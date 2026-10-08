(* End-to-end: firmware runs on the RTL core, and every fired event must land
   exactly where the checker's executor says it will.

   The executor is the golden model here. It was written independently of the
   RTL (an interpreter over OCaml values, no cycles, no queue), so agreement
   between the two is real evidence, not a tautology. *)
open! Base
open Stdio
open Hardcaml
module Core = Fipe_hw.Core
module Isa = Fipe_isa.Isa
module C = Fipe_checker
module Sim = Cyclesim.With_interface (Core.I) (Core.O)

let start_lead = Fipe_hw.Sequencer.start_lead
let mask = (1 lsl 24) - 1

type fired =
  { cycle : int
  ; pin : int
  ; value : int
  }
[@@deriving sexp, equal]

type run =
  { fires : fired list
  ; t_start : int
  ; halted : bool
  ; late : bool
  ; order_err : bool
  ; window_err : bool
  }

let run_core
  ?(k1 = 0)
  ?(k2 = 0)
  ?(k3 = 0)
  ?in_pin
  ?(aux_pin = 7)
  ~data_pin
  ~clk_pin
  ~max_cycles
  ~fifo
  program
  =
  let sim = Sim.create Core.create in
  let i : _ Core.I.t = Cyclesim.inputs sim in
  let o : _ Core.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  let set r w v = r := Bits.of_int ~width:w (v land ((1 lsl w) - 1)) in
  i.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.clear := Bits.gnd;
  Array.iteri program ~f:(fun a ins ->
    i.imem_we := Bits.vdd;
    set i.imem_addr 6 a;
    set i.imem_data 16 (Isa.encode ins);
    Cyclesim.cycle sim);
  i.imem_we := Bits.gnd;
  set i.cfg_data_pin 3 data_pin;
  set i.cfg_clk_pin 3 clk_pin;
  set i.cfg_in_pin 3 (Option.value in_pin ~default:data_pin);
  set i.cfg_aux_pin 3 aux_pin;
  set i.cfg_k1 8 k1;
  set i.cfg_k2 8 k2;
  set i.cfg_k3 8 k3;
  i.start := Bits.vdd;
  Cyclesim.cycle sim;
  let t_start = Bits.to_int !(o.t_now) in
  i.start := Bits.gnd;
  let fifo = ref fifo in
  let fires = Queue.create () in
  let b r = Bits.to_bool !r and n r = Bits.to_int !r in
  let finished = ref false in
  let cycles = ref 0 in
  while (not !finished) && !cycles < max_cycles do
    (match !fifo with
     | w :: _ ->
       i.fifo_valid := Bits.vdd;
       set i.fifo_data 32 w
     | [] -> i.fifo_valid := Bits.gnd);
    Cyclesim.cycle sim;
    Int.incr cycles;
    if b o.fifo_ready then fifo := List.tl_exn !fifo;
    let t = n o.t_now in
    if b o.fire0_valid
    then Queue.enqueue fires { cycle = t; pin = n o.fire0_pin; value = n o.fire0_value };
    if b o.fire1_valid
    then Queue.enqueue fires { cycle = t; pin = n o.fire1_pin; value = n o.fire1_value };
    if b o.halted && n o.queue_count = 0 then finished := true
  done;
  (* sticky flags are registered, so look one cycle later *)
  Cyclesim.cycle sim;
  { fires = Queue.to_list fires
  ; t_start
  ; halted = b o.halted
  ; late = b o.late
  ; order_err = b o.order_err
  ; window_err = b o.window_err
  }
;;

let value_code : C.Exec.value -> int = function
  | Drive0 -> 0
  | Drive1 -> 1
  | Release -> 2
  | Sample -> 3
;;

(* Where the executor says each event fires: T_start + lead + S + K * prescale. *)
let expected ~t_start ~pin_of ~k (events : C.Exec.event list) =
  List.map events ~f:(fun e ->
    { cycle = (t_start + start_lead + e.cyc + (k e.cls * e.scale)) land mask
    ; pin = pin_of e.pin
    ; value = value_code e.value
    })
;;

(* The hardware order invariant, evaluated on the executor's events. *)
let order_violated ~k (events : C.Exec.event list) =
  let due (e : C.Exec.event) = e.cyc + (k e.cls * e.scale) in
  let rec go = function
    | a :: (b :: _ as rest) -> due b < due a || go rest
    | _ -> false
  in
  go events
;;

(* Fires predicted by the on-time cycle model, in RTL terms. *)
let predicted_fires ~t_start ~pin_of ~k (events : C.Exec.event list) trace =
  let ev = Array.of_list events in
  C.Ontime.simulate ~lead:start_lead ~k events trace
  |> List.map ~f:(fun (f : C.Ontime.fired) ->
    { cycle = (t_start + f.t) land mask
    ; pin = pin_of ev.(f.seq).pin
    ; value = value_code ev.(f.seq).value
    })
;;

let predicted_late ~k events trace =
  List.exists (C.Ontime.simulate ~lead:start_lead ~k events trace) ~f:(fun f -> f.late)
;;

let i2c_program = C.Firmware.i2c_write ~bytes:3 ()
let i2c_fifo = C.Firmware.[ byte 0xA0; byte 0x00; byte 0x5A ]

let i2c_events, i2c_trace =
  C.Exec.run_traced ~pins:C.Firmware.i2c_pins ~fifo:i2c_fifo i2c_program |> Or_error.ok_exn
;;

let i2c_pin_of = function
  | "SDA" -> 0
  | "SCL" -> 1
  | p -> raise_s [%message "pin" p]
;;

let kfun ~k1 ~k2 = function
  | 1 -> k1
  | 2 -> k2
  | _ -> 0
;;

let%expect_test "I2C firmware on the RTL fires every edge exactly where predicted" =
  let r = run_core ~data_pin:0 ~clk_pin:1 ~max_cycles:50_000 ~fifo:i2c_fifo i2c_program in
  let exp = expected ~t_start:r.t_start ~pin_of:i2c_pin_of ~k:(kfun ~k1:0 ~k2:0) i2c_events in
  printf
    "events predicted %d, fired %d, identical: %b\n"
    (List.length exp)
    (List.length r.fires)
    (List.equal equal_fired exp r.fires);
  printf
    "halted %b  late %b  order %b  window %b\n"
    r.halted
    r.late
    r.order_err
    r.window_err;
  (match List.hd r.fires, List.last r.fires with
   | Some f, Some l ->
     printf
       "transaction spans %d cycles = %.2f us at 50 MHz\n"
       (l.cycle - f.cycle)
       (Float.of_int (l.cycle - f.cycle) *. 0.02)
   | _ -> ());
  [%expect {|
    events predicted 91, fired 91, identical: true
    halted true  late false  order false  window false
    transaction spans 13564 cycles = 271.28 us at 50 MHz |}]
;;

(* Sweep the skews across the checker's ORDER boundaries. The RTL must agree
   with the checker on the ORDER flag, with the on-time model on the LATE flag,
   and with the on-time model on every fire cycle, inside and outside the safe
   region alike. *)
let%expect_test "skew sweep: RTL agrees with the checker and the cycle model everywhere" =
  let points =
    [ 0, 0; 27, 27; 28, 28; -28, -28; -29, -29; 0, -10; 0, -11; 0, 52; 0, 53; 5, -5; -40, 10 ]
  in
  printf "  K1   K2  order(pred/rtl)  late(pred/rtl)  fires identical\n";
  List.iter points ~f:(fun (k1, k2) ->
    let r =
      run_core ~k1 ~k2 ~data_pin:0 ~clk_pin:1 ~max_cycles:60_000 ~fifo:i2c_fifo i2c_program
    in
    let k = kfun ~k1 ~k2 in
    let p_order = order_violated ~k i2c_events in
    let p_late = predicted_late ~k i2c_events i2c_trace in
    let same =
      List.equal
        equal_fired
        (predicted_fires ~t_start:r.t_start ~pin_of:i2c_pin_of ~k i2c_events i2c_trace)
        r.fires
    in
    let ok = Bool.equal p_order r.order_err && Bool.equal p_late r.late && same in
    printf
      "%4d %4d  %-5b / %-5b    %-5b / %-5b   %b%s\n"
      k1
      k2
      p_order
      r.order_err
      p_late
      r.late
      same
      (if ok then "" else "   <-- DISAGREE"));
  [%expect {|
     K1   K2  order(pred/rtl)  late(pred/rtl)  fires identical
      0    0  false / false    false / false   true
     27   27  false / false    false / false   true
     28   28  true  / true     true  / true    true
    -28  -28  false / false    false / false   true
    -29  -29  true  / true     true  / true    true
      0  -10  false / false    false / false   true
      0  -11  true  / true     true  / true    true
      0   52  false / false    false / false   true
      0   53  true  / true     true  / true    true
      5   -5  false / false    false / false   true
    -40   10  true  / true     true  / true    true |}]
;;

(* Random programs from the supported instruction subset, with random skews
   and pin assignments. Every run is compared against the executor. *)
let gen_program ?(stress = false) rand =
  let len = 4 + Random.State.int rand 36 in
  let ri n = Random.State.int rand n in
  let acts = Isa.Act.[| Drive0; Drive1; Release; Toggle; Shift_out; Sample; Aux0; Aux1 |] in
  Array.init (len + 1) ~f:(fun a ->
    if a = len
    then Isa.Jmp { cond = Always; addr = a }
    else (
      let r = ri 100 in
      if r < 50
      then
        Isa.Evt
          { dt = (if stress then ri 3 else ri 64)
          ; clk_pin = ri 2 = 1
          ; cls = ri 4
          ; act = acts.(ri 8)
          }
      else if r < 58
      then Dly { dt = ri 200 }
      else if r < 66
      then Set { dst = (if ri 2 = 0 then X else Y); imm = ri 4 }
      else if r < 71
      then Set { dst = Coder_mode; imm = [| 0; 4; 8; 12 |].(ri 4) }
      else if r < 75
      then Set { dst = Prescale; imm = (if stress then 0 else ri 3) }
      else if r < 82
      then Pull { block = true }
      else if r < 90 && a > 0
      then Jmp { cond = (if ri 2 = 0 then X_dec_nz else Y_dec_nz); addr = ri a }
      else Nop))
;;

let random_campaign ~stress ~seed ~n =
  let rand = Random.State.make [| seed |] in
  let tally = Hashtbl.create (module String) in
  let note k = Hashtbl.incr tally k in
  for _ = 1 to n do
    let program = gen_program ~stress rand in
    let fifo = List.init 64 ~f:(fun _ -> Random.State.bits rand land 0xFFFF_FFFF) in
    let pins = { C.Exec.data_pin = "D"; clk_pin = "C"; in_pin = "D"; aux_pin = "A" } in
    match C.Exec.run_traced ~max_steps:5_000 ~pins ~fifo program with
    | Error _ -> note "skipped: executor rejects (unbounded loop)"
    | Ok (events, trace) ->
      let rk () = if stress then 0 else Random.State.int rand 13 - 6 in
      let k1 = rk () and k2 = rk () and k3 = rk () in
      let k = function 1 -> k1 | 2 -> k2 | 3 -> k3 | _ -> 0 in
      let data_pin = Random.State.int rand 8 in
      let clk_pin = (data_pin + 1 + Random.State.int rand 7) % 8 in
      let aux_pin =
        List.filter (List.range 0 8) ~f:(fun p -> p <> data_pin && p <> clk_pin)
        |> fun l -> List.nth_exn l (Random.State.int rand (List.length l))
      in
      let pin_of = function "D" -> data_pin | "A" -> aux_pin | _ -> clk_pin in
      let last = List.fold events ~init:0 ~f:(fun m e -> Int.max m e.cyc) in
      let r =
        run_core ~k1 ~k2 ~k3 ~aux_pin ~data_pin ~clk_pin ~max_cycles:(last + 20_000) ~fifo program
      in
      let p_order = order_violated ~k events in
      let p_late = predicted_late ~k events trace in
      let same =
        List.equal equal_fired (predicted_fires ~t_start:r.t_start ~pin_of ~k events trace) r.fires
      in
      if not r.halted
      then note "MISMATCH: did not halt"
      else if not (Bool.equal p_order r.order_err)
      then note "MISMATCH: ORDER flag"
      else if not (Bool.equal p_late r.late)
      then note "MISMATCH: LATE flag"
      else if not same
      then note "MISMATCH: fire cycles"
      else if p_order
      then note "cycle-exact, order violation predicted and flagged"
      else if p_late
      then note "cycle-exact, late events predicted and flagged"
      else note "cycle-exact, all on time"
  done;
  Hashtbl.to_alist tally
  |> List.sort ~compare:(fun (a, _) (b, _) -> String.compare a b)
  |> List.iter ~f:(fun (k, v) -> printf "%4d  %s\n" v k)
;;

let%expect_test "random programs: RTL vs executor and cycle model" =
  random_campaign ~stress:false ~seed:42 ~n:300;
  [%expect {|
    198  cycle-exact, all on time
     43  cycle-exact, order violation predicted and flagged
     59  skipped: executor rejects (unbounded loop) |}]
;;

(* Tiny dt values, no prescale and no skew, so ORDER always holds and the only
   way to be late is the sequencer falling behind: the case only the on-time
   model predicts. *)
let%expect_test "stress programs: the sequencer falls behind, and the model knows when" =
  random_campaign ~stress:true ~seed:7 ~n:300;
  [%expect {|
    128  cycle-exact, all on time
    110  cycle-exact, late events predicted and flagged
     62  skipped: executor rejects (unbounded loop) |}]
;;
