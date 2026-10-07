(* Timing monitors (spec v0.3): the protocol spec enforced live, in silicon, on
   whatever is on the pins, including the device's side of the wire.

   Each slot holds one rule, compiled by [Fipe_checker.Monitor]:
     after an edge matching START, the next edge matching STOP must come within
     [min, max] cycles, unless an edge matching ABORT comes first.
   A trigger is a pin, an edge (rise, fall, any) and optionally one qualifier
   pin that must be at a given level just before the edge, as in "SDA falls
   while SCL is high".

   Inputs pass through a two-flop synchronizer, the same for every pin, so the
   latency cancels out of every interval. The counter is set to 1 on START, so
   at STOP it holds exactly stop_cycle - start_cycle.

   Re-arming: by default each new START restarts the measurement, which makes
   the slot report the tightest interval (right for min rules). With
   [keep_first], the first START wins (right for max rules).

   A slot flags: too short at STOP (below min), too long at STOP (above max),
   or a timeout once the counter passes max with no STOP yet (a device that
   never answers). It also records the smallest and largest interval it has
   measured: that is the measured datasheet. *)
open! Base
open Hardcaml
open Signal

let n_slots = 4
let n_pins = 8
let cnt_bits = 16

module Edge = struct
  let rise = 0
  let fall = 1
  let any = 2
end

module I = struct
  type 'a t =
    { clock : 'a
    ; clear : 'a
    ; pins : 'a [@bits n_pins]
    ; mon_clear : 'a
    ; en : 'a list [@length n_slots]
    ; keep_first : 'a list [@length n_slots]
    ; st_pin : 'a list [@length n_slots] [@bits 3]
    ; st_edge : 'a list [@length n_slots] [@bits 2]
    ; st_qen : 'a list [@length n_slots]
    ; st_qpin : 'a list [@length n_slots] [@bits 3]
    ; st_qlvl : 'a list [@length n_slots]
    ; sp_pin : 'a list [@length n_slots] [@bits 3]
    ; sp_edge : 'a list [@length n_slots] [@bits 2]
    ; sp_qen : 'a list [@length n_slots]
    ; sp_qpin : 'a list [@length n_slots] [@bits 3]
    ; sp_qlvl : 'a list [@length n_slots]
    ; ab_en : 'a list [@length n_slots]
    ; ab_pin : 'a list [@length n_slots] [@bits 3]
    ; ab_edge : 'a list [@length n_slots] [@bits 2]
    ; ab_qen : 'a list [@length n_slots]
    ; ab_qpin : 'a list [@length n_slots] [@bits 3]
    ; ab_qlvl : 'a list [@length n_slots]
    ; min_en : 'a list [@length n_slots]
    ; min_cyc : 'a list [@length n_slots] [@bits cnt_bits]
    ; max_en : 'a list [@length n_slots]
    ; max_cyc : 'a list [@length n_slots] [@bits cnt_bits]
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { viol : 'a list [@length n_slots]
    ; viol_sticky : 'a list [@length n_slots]
    ; armed : 'a list [@length n_slots]
    ; min_seen : 'a list [@length n_slots] [@bits cnt_bits]
    ; max_seen : 'a list [@length n_slots] [@bits cnt_bits]
    ; count : 'a list [@length n_slots] [@bits 8] (* intervals measured, saturating *)
    }
  [@@deriving sexp_of, hardcaml]
end

let create (i : _ I.t) : _ O.t =
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.clear () in
  let sync1 = reg spec i.pins in
  let cur = reg spec sync1 in
  let prev = reg spec cur in
  let trig ~pin ~edge ~qen ~qpin ~qlvl =
    let c = mux pin (bits_lsb cur) in
    let p = mux pin (bits_lsb prev) in
    let edge_ok = mux edge [ ~:p &: c; p &: ~:c; p ^: c; gnd ] in
    let q = mux qpin (bits_lsb prev) in
    edge_ok &: (~:qen |: (q ==: qlvl))
  in
  let nth l k = List.nth_exn l k in
  let slots =
    List.init n_slots ~f:(fun k ->
      let en = nth i.en k in
      let open Always in
      let armed = Variable.reg spec ~width:1 in
      let cnt = Variable.reg spec ~width:cnt_bits in
      let sticky = Variable.reg spec ~width:1 in
      let min_seen = Variable.reg spec ~width:cnt_bits in
      let max_seen = Variable.reg spec ~width:cnt_bits in
      let count = Variable.reg spec ~width:8 in
      let st =
        en
        &: trig
             ~pin:(nth i.st_pin k)
             ~edge:(nth i.st_edge k)
             ~qen:(nth i.st_qen k)
             ~qpin:(nth i.st_qpin k)
             ~qlvl:(nth i.st_qlvl k)
      in
      let sp =
        en
        &: armed.value
        &: trig
             ~pin:(nth i.sp_pin k)
             ~edge:(nth i.sp_edge k)
             ~qen:(nth i.sp_qen k)
             ~qpin:(nth i.sp_qpin k)
             ~qlvl:(nth i.sp_qlvl k)
      in
      let ab =
        en
        &: armed.value
        &: nth i.ab_en k
        &: trig
             ~pin:(nth i.ab_pin k)
             ~edge:(nth i.ab_edge k)
             ~qen:(nth i.ab_qen k)
             ~qpin:(nth i.ab_qpin k)
             ~qlvl:(nth i.ab_qlvl k)
        &: ~:sp
      in
      let over_max = nth i.max_en k &: (cnt.value >: nth i.max_cyc k) in
      let too_short = sp &: nth i.min_en k &: (cnt.value <: nth i.min_cyc k) in
      let too_long = sp &: over_max in
      let timeout = en &: armed.value &: over_max &: ~:sp &: ~:ab in
      let viol = too_short |: too_long |: timeout in
      let ends = sp |: ab |: timeout in
      let still_armed = armed.value &: ~:ends in
      let rearm = st &: ~:(still_armed &: nth i.keep_first k) in
      let measured = sp |: timeout in
      compile
        [ if_
            i.mon_clear
            [ armed <-- gnd
            ; sticky <-- gnd
            ; min_seen <-- ones cnt_bits
            ; max_seen <--. 0
            ; count <--. 0
            ]
            [ when_ viol [ sticky <-- vdd ]
            ; when_
                measured
                [ when_ (cnt.value <: min_seen.value) [ min_seen <-- cnt.value ]
                ; when_ (cnt.value >: max_seen.value) [ max_seen <-- cnt.value ]
                ; when_ (count.value <>:. 255) [ count <-- count.value +:. 1 ]
                ]
            ; if_
                rearm
                [ armed <-- vdd; cnt <--. 1 ]
                [ armed <-- still_armed
                ; when_
                    (still_armed &: (cnt.value <>: ones cnt_bits))
                    [ cnt <-- cnt.value +:. 1 ]
                ]
            ]
        ];
      viol, sticky.value, armed.value, min_seen.value, max_seen.value, count.value)
  in
  let get f = List.map slots ~f in
  { viol = get (fun (v, _, _, _, _, _) -> v)
  ; viol_sticky = get (fun (_, s, _, _, _, _) -> s)
  ; armed = get (fun (_, _, a, _, _, _) -> a)
  ; min_seen = get (fun (_, _, _, m, _, _) -> m)
  ; max_seen = get (fun (_, _, _, _, m, _) -> m)
  ; count = get (fun (_, _, _, _, _, c) -> c)
  }
;;

let circuit () =
  let module C = Circuit.With_interface (I) (O) in
  C.create_exn ~name:"fipe_monitors" create
;;
