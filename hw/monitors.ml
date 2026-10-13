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

   Device-side attribution: a trigger marked "device only" counts an edge only
   if FIPE's own driver on that pin was released on both sides of the edge
   (driver enables delayed to match the synchronizer). On an open-drain line a
   falling edge with our driver released is the device's; a rising edge may
   also be the line recovering, through the pull-up, from our own earlier
   release. So attribution is exact for falling edges, and for pins FIPE never
   drives (such as MISO).
   Prescale: a slot's counter advances every 1, 16, 256 or 4096 cycles, so an
   interval of up to 65535 ticks covers 1.3 ms, 21 ms, 335 ms or 5.4 s at
   50 MHz, at a resolution of one tick.
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
    ; pins_oe : 'a [@bits n_pins] (* FIPE's own drivers, for attribution *)
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
    ; st_dev : 'a list [@length n_slots] (* START: device edges only *)
    ; sp_dev : 'a list [@length n_slots]
    ; ab_dev : 'a list [@length n_slots]
    ; prescale : 'a list [@length n_slots] [@bits 2] (* tick every 1, 16, 256, 4096 *)
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
  let sync_spec = Reg_spec.create ~clock:i.clock () in
  let sync1 = reg sync_spec i.pins in (* no clear: see Host_spi *)
  let cur = reg sync_spec sync1 in
  let prev = reg spec cur in
  (* our driver enables, delayed like the pins: [cur] is the bus two cycles
     ago and [prev] three, so an edge between them is ours unless the driver
     was released at both of those times *)
  let oe_d1 = reg spec i.pins_oe in
  let oe_d2 = reg spec oe_d1 in
  let oe_d3 = reg spec oe_d2 in
  let trig ~pin ~edge ~qen ~qpin ~qlvl ~dev =
    let c = mux pin (bits_lsb cur) in
    let p = mux pin (bits_lsb prev) in
    let edge_ok = mux edge [ ~:p &: c; p &: ~:c; p ^: c; gnd ] in
    let q = mux qpin (bits_lsb prev) in
    let released = ~:(mux pin (bits_lsb oe_d2)) &: ~:(mux pin (bits_lsb oe_d3)) in
    edge_ok &: (~:qen |: (q ==: qlvl)) &: (~:dev |: released)
  in
  (* shared prescaler: one free-running counter, ticks decoded per slot *)
  let pre = reg_fb spec ~width:12 ~f:(fun q -> q +:. 1) in
  let tick ps =
    mux ps [ vdd; select pre 3 0 ==:. 15; select pre 7 0 ==:. 255; pre ==:. 4095 ]
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
      List.iter
        [ "armed", armed; "count_cycles", cnt; "sticky", sticky; "min_seen", min_seen
        ; "max_seen", max_seen; "intervals", count
        ]
        ~f:(fun (n, (v : Always.Variable.t)) ->
          ignore (Signal.( -- ) v.value (Printf.sprintf "mon%d_%s" k n) : Signal.t));
      let st =
        en
        &: trig
             ~pin:(nth i.st_pin k)
             ~edge:(nth i.st_edge k)
             ~qen:(nth i.st_qen k)
             ~qpin:(nth i.st_qpin k)
             ~qlvl:(nth i.st_qlvl k)
             ~dev:(nth i.st_dev k)
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
             ~dev:(nth i.sp_dev k)
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
             ~dev:(nth i.ab_dev k)
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
                    (still_armed
                     &: tick (nth i.prescale k)
                     &: (cnt.value <>: ones cnt_bits))
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
