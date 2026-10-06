open! Base
open Stdio
open Hardcaml
module Q = Fipe_hw.Event_queue
module M = Fipe_model.Event_queue_model
module Sim = Cyclesim.With_interface (Q.I) (Q.O)

let make () =
  let sim = Sim.create ~config:Cyclesim.Config.trace_all Q.create in
  let i : _ Q.I.t = Cyclesim.inputs sim in
  i.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.clear := Bits.gnd;
  sim
;;

let drive sim ~t_now ~(enq : M.entry option) =
  let i : _ Q.I.t = Cyclesim.inputs sim in
  let set r w v = r := Bits.of_int ~width:w v in
  set i.t_now Q.time_bits t_now;
  match enq with
  | None -> i.enq_valid := Bits.gnd
  | Some e ->
    i.enq_valid := Bits.vdd;
    set i.enq_due Q.time_bits e.due;
    set i.enq_pin Q.pin_bits e.pin;
    set i.enq_value Q.value_bits e.value
;;

(* Read the RTL outputs before the clock edge and convert them to the model's type. *)
let observe sim : M.outputs =
  let o : _ Q.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  let b r = Bits.to_bool !r and n r = Bits.to_int !r in
  let fire v p x l = if b v then Some { M.pin = n p; value = n x; late = b l } else None in
  { ready = b o.enq_ready
  ; fire0 = fire o.fire0_valid o.fire0_pin o.fire0_value o.fire0_late
  ; fire1 = fire o.fire1_valid o.fire1_pin o.fire1_value o.fire1_late
  ; order_err = b o.order_err
  ; window_err = b o.window_err
  ; count = n o.count
  }
;;

(* Random stimulus that deliberately produces every fault: late events, order
   inversions, two-per-cycle bursts, a full queue, window violations, and a run
   across the 24-bit wrap. *)
let run_differential ~seed ~cycles ~t_start =
  let rand = Random.State.make [| seed |] in
  let sim = make () in
  let model = M.create ~depth:Q.depth in
  let next_due = ref (t_start + 5) in
  let mismatches = ref 0 in
  let tally = Hashtbl.create (module String) in
  let note k = Hashtbl.incr tally k in
  for c = 0 to cycles - 1 do
    let t_now = (t_start + c) land M.mask in
    let enq =
      if Random.State.int rand 100 < 45
      then (
        let r = Random.State.int rand 100 in
        let due =
          if r < 3
          then t_now + (1 lsl 22) + Random.State.int rand 1000 (* too far ahead *)
          else if r < 10
          then !next_due - Random.State.int rand 6 (* possible order inversion *)
          else !next_due + Random.State.int rand 4 (* dt = 0 gives bursts *)
        in
        let due = due land M.mask in
        if r >= 3 then next_due := due;
        Some { M.due; pin = Random.State.int rand 8; value = Random.State.int rand 3 })
      else None
    in
    (* keep the schedule loosely tied to T so most events are on time *)
    if M.sdiff !next_due t_now < 0 then next_due := (t_now + Random.State.int rand 3) land M.mask;
    drive sim ~t_now ~enq;
    let expected = M.step model { t_now; enq } in
    Cyclesim.cycle sim;
    (* [Before] = values computed in the cycle just simulated, before its clock edge *)
    let got = observe sim in
    if not (M.equal_outputs expected got)
    then (
      Int.incr mismatches;
      if !mismatches <= 3
      then print_s [%message "MISMATCH" (c : int) (expected : M.outputs) (got : M.outputs)]);
    if Option.is_some got.fire0 then note "fired";
    if Option.is_some got.fire1 then note "fired two in one cycle";
    if Option.exists got.fire0 ~f:(fun f -> f.late) then note "late";
    if got.order_err then note "order_err";
    if got.window_err then note "window_err";
    if not got.ready then note "queue full"
  done;
  !mismatches, tally
;;

let%expect_test "RTL matches the reference model, including across the 24-bit wrap" =
  let total = Hashtbl.create (module String) in
  let mismatches = ref 0 in
  List.iter [ 1; 2; 3; 4; 5 ] ~f:(fun seed ->
    let t_start = if seed % 2 = 0 then M.mask - 2_000 else 1_000 in
    let m, tally = run_differential ~seed ~cycles:5_000 ~t_start in
    mismatches := !mismatches + m;
    Hashtbl.iteri tally ~f:(fun ~key ~data ->
      Hashtbl.update total key ~f:(fun x -> Option.value x ~default:0 + data)));
  printf "mismatches: %d\n" !mismatches;
  (* Every fault class must actually be exercised, or the test proves little. *)
  List.iter
    [ "fired"; "fired two in one cycle"; "late"; "order_err"; "window_err"; "queue full" ]
    ~f:(fun k -> printf "%-24s %s\n" k (if Hashtbl.mem total k then "exercised" else "MISSING"));
  [%expect {|
    mismatches: 0
    fired                    exercised
    fired two in one cycle   exercised
    late                     exercised
    order_err                exercised
    window_err               exercised
    queue full               exercised |}]
;;

let%expect_test "waveform: an SPI-style edge pair fires in one cycle, then a late event" =
  let sim = make () in
  let waves, sim = Hardcaml_waveterm.Waveform.create sim in
  let cyc ~t ?enq () =
    drive sim ~t_now:t ~enq;
    Cyclesim.cycle sim
  in
  cyc ~t:0 ~enq:{ M.due = 4; pin = 1; value = M.Value.drive0 } ();
  cyc ~t:1 ~enq:{ M.due = 4; pin = 0; value = M.Value.drive1 } ();
  cyc ~t:2 ();
  cyc ~t:3 ();
  cyc ~t:4 ();
  cyc ~t:5 ~enq:{ M.due = 5; pin = 2; value = M.Value.release } ();
  cyc ~t:6 ();
  cyc ~t:7 ();
  Hardcaml_waveterm.Waveform.print
    ~display_width:100
    ~display_height:26
    ~wave_width:1
    ~display_rules:
      Hardcaml_waveterm.Display_rule.
        [ port_name_is "t_now" ~wave_format:(Bit_or Unsigned_int)
        ; port_name_is "enq_valid" ~wave_format:Bit
        ; port_name_is "enq_due" ~wave_format:(Bit_or Unsigned_int)
        ; port_name_is "count" ~wave_format:(Bit_or Unsigned_int)
        ; port_name_is "fire0_valid" ~wave_format:Bit
        ; port_name_is "fire0_pin" ~wave_format:(Bit_or Unsigned_int)
        ; port_name_is "fire1_valid" ~wave_format:Bit
        ; port_name_is "fire1_pin" ~wave_format:(Bit_or Unsigned_int)
        ; port_name_is "fire0_late" ~wave_format:Bit
        ]
    waves;
  [%expect {|
    ┌Signals───────────┐┌Waves─────────────────────────────────────────────────────────────────────────┐
    │                  ││────┬───┬───┬───┬───┬───┬───┬───                                              │
    │t_now             ││ 0  │1  │2  │3  │4  │5  │6  │7                                                │
    │                  ││────┴───┴───┴───┴───┴───┴───┴───                                              │
    │enq_valid         ││────────┐           ┌───┐                                                     │
    │                  ││        └───────────┘   └───────                                              │
    │                  ││────────────────────┬───────────                                              │
    │enq_due           ││ 4                  │5                                                        │
    │                  ││────────────────────┴───────────                                              │
    │                  ││────┬───┬───────────┬───┬───┬───                                              │
    │count             ││ 0  │1  │2          │0  │1  │0                                                │
    │                  ││────┴───┴───────────┴───┴───┴───                                              │
    │fire0_valid       ││                ┌───┐   ┌───┐                                                 │
    │                  ││────────────────┘   └───┘   └───                                              │
    │                  ││────┬───────────────┬───┬───┬───                                              │
    │fire0_pin         ││ 0  │1              │0  │2  │0                                                │
    │                  ││────┴───────────────┴───┴───┴───                                              │
    │fire1_valid       ││                ┌───┐                                                         │
    │                  ││────────────────┘   └───────────                                              │
    │                  ││────────────────────────────┬───                                              │
    │fire1_pin         ││ 0                          │1                                                │
    │                  ││────────────────────────────┴───                                              │
    │fire0_late        ││                        ┌───┐                                                 │
    │                  ││────────────────────────┘   └───                                              │
    │                  ││                                                                              │
    └──────────────────┘└──────────────────────────────────────────────────────────────────────────────┘ |}]
;;
