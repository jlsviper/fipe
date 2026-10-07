open! Base
open Stdio
open Hardcaml
module Isa = Fipe_isa.Isa
module C = Fipe_checker
module Spec = Fipe_spec.Protocol_spec
module M = Fipe_hw.Monitors
module L = Fipe_hw.Loopback

let set r w v = r := Bits.of_int ~width:w (v land ((1 lsl w) - 1))
let setb r b = r := if b then Bits.vdd else Bits.gnd

let no_trig = { C.Monitor.Hw.pin = 0; edge = 3; qen = false; qpin = 0; qlvl = false }

(* Load slot configurations into the monitor inputs; unused slots disabled. *)
let load (m : Bits.t ref M.I.t) (slots : C.Monitor.Hw.t list) =
  for k = 0 to M.n_slots - 1 do
    let nth l = List.nth_exn l k in
    let cfg = List.nth slots k in
    setb (nth m.en) (Option.is_some cfg);
    let s = Option.value cfg ~default:{ start = no_trig; stop = no_trig; abort = None; keep_first = false; min_cyc = None; max_cyc = None } in
    let put (t : C.Monitor.Hw.trig) pin edge qen qpin qlvl =
      set (nth pin) 3 t.pin;
      set (nth edge) 2 t.edge;
      setb (nth qen) t.qen;
      set (nth qpin) 3 t.qpin;
      setb (nth qlvl) t.qlvl
    in
    put s.start m.st_pin m.st_edge m.st_qen m.st_qpin m.st_qlvl;
    put s.stop m.sp_pin m.sp_edge m.sp_qen m.sp_qpin m.sp_qlvl;
    setb (nth m.ab_en) (Option.is_some s.abort);
    put (Option.value s.abort ~default:no_trig) m.ab_pin m.ab_edge m.ab_qen m.ab_qpin m.ab_qlvl;
    setb (nth m.keep_first) s.keep_first;
    setb (nth m.min_en) (Option.is_some s.min_cyc);
    set (nth m.min_cyc) 16 (Option.value s.min_cyc ~default:0);
    setb (nth m.max_en) (Option.is_some s.max_cyc);
    set (nth m.max_cyc) 16 (Option.value s.max_cyc ~default:0)
  done
;;

(* --- Unit test: one slot, hand-made pulses ----------------------------- *)

module Msim = Cyclesim.With_interface (M.I) (M.O)

let%expect_test "one slot: pulse width must be 10..20 cycles" =
  let sim = Msim.create M.create in
  let i : _ M.I.t = Cyclesim.inputs sim in
  let o : _ M.O.t = Cyclesim.outputs sim in
  let rise = { no_trig with edge = 0 } and fall = { no_trig with edge = 1 } in
  load i [ { start = rise; stop = fall; abort = None; keep_first = false; min_cyc = Some 10; max_cyc = Some 20 } ];
  i.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.clear := Bits.gnd;
  i.mon_clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.mon_clear := Bits.gnd;
  let pulse width =
    let flagged = ref false in
    let step () =
      Cyclesim.cycle sim;
      if Bits.to_bool !(List.hd_exn o.viol) then flagged := true
    in
    set i.pins 8 1;
    for _ = 1 to width do step () done;
    set i.pins 8 0;
    for _ = 1 to 30 do step () done;
    printf "width %2d: %s\n" width (if !flagged then "VIOLATION" else "ok")
  in
  (* 40 times out at cycle 21, while the pulse is still high: a device that
     never lets go is caught without waiting for an edge that may never come *)
  List.iter [ 5; 10; 15; 20; 21; 40 ] ~f:pulse;
  printf
    "measured: min %d, max %d, count %d\n"
    (Bits.to_int !(List.hd_exn o.min_seen))
    (Bits.to_int !(List.hd_exn o.max_seen))
    (Bits.to_int !(List.hd_exn o.count));
  [%expect {|
    width  5: VIOLATION
    width 10: ok
    width 15: ok
    width 20: ok
    width 21: VIOLATION
    width 40: VIOLATION
    measured: min 5, max 21, count 6 |}]
;;

(* --- Loopback: our own I2C waveform, audited by the compiled spec ------ *)

module Lsim = Cyclesim.With_interface (L.I) (L.O)

let i2c_program = C.Firmware.i2c_write ~bytes:3 ()
let i2c_fifo = C.Firmware.[ byte 0xA0; byte 0x00; byte 0x5A ]
let pin_of = function "SDA" -> 0 | "SCL" -> 1 | p -> raise_s [%message "pin" p]
let rules = Spec.I2c_standard_mode.spec.rules
let rule name = List.find_exn rules ~f:(fun (r : Spec.rule) -> String.equal r.name name)

let hw_slot r =
  C.Monitor.of_rule ~clk_hz:50_000_000 r |> Or_error.ok_exn |> C.Monitor.Hw.of_slot ~pin_of
;;

type slot_result =
  { flagged : bool
  ; min_seen : int
  ; count : int
  }

let run_loopback ~k1 ~k2 names =
  let sim = Lsim.create L.create in
  let i : _ L.I.t = Cyclesim.inputs sim in
  let o : _ L.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  load i.mon (List.map names ~f:(fun n -> hw_slot (rule n)));
  i.core.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.clear := Bits.gnd;
  Array.iteri i2c_program ~f:(fun a ins ->
    i.core.imem_we := Bits.vdd;
    set i.core.imem_addr 6 a;
    set i.core.imem_data 16 (Isa.encode ins);
    Cyclesim.cycle sim);
  i.core.imem_we := Bits.gnd;
  set i.core.cfg_data_pin 3 0;
  set i.core.cfg_clk_pin 3 1;
  set i.core.cfg_k1 8 k1;
  set i.core.cfg_k2 8 k2;
  i.mon.mon_clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.mon.mon_clear := Bits.gnd;
  i.core.start := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.start := Bits.gnd;
  let fifo = ref i2c_fifo in
  let finished = ref 0 in
  let cycles = ref 0 in
  (* run until halted and drained, then a little longer for the synchronizers *)
  while !finished < 10 && !cycles < 60_000 do
    (match !fifo with
     | w :: _ ->
       i.core.fifo_valid := Bits.vdd;
       set i.core.fifo_data 32 w
     | [] -> i.core.fifo_valid := Bits.gnd);
    Cyclesim.cycle sim;
    Int.incr cycles;
    if Bits.to_bool !(o.core.fifo_ready) then fifo := List.tl_exn !fifo;
    if Bits.to_bool !(o.core.halted) && Bits.to_int !(o.core.queue_count) = 0
    then Int.incr finished
  done;
  Cyclesim.cycle sim;
  List.mapi names ~f:(fun k _ ->
    let nth l = Bits.to_int !(List.nth_exn l k) in
    { flagged = nth o.mon.viol_sticky = 1; min_seen = nth o.mon.min_seen; count = nth o.mon.count })
;;

let events_t, trace =
  C.Exec.run_traced ~pins:C.Firmware.i2c_pins ~fifo:i2c_fifo i2c_program |> Or_error.ok_exn
;;

(* Ground truth: the concrete checker on the cycle model's exact fire times. *)
let concrete ~k =
  let ev = Array.of_list events_t in
  let fires =
    C.Ontime.simulate ~lead:64 ~k events_t trace
    |> List.map ~f:(fun (f : C.Ontime.fired) -> f.t, ev.(f.seq))
  in
  C.Check.concrete ~ns_per_cycle:20 Spec.I2c_standard_mode.spec fires
;;

let predicted_ok name ~k =
  let c = List.find_exn (concrete ~k) ~f:(fun c -> String.equal c.rule name) in
  c.violations = 0
;;

let config_a = [ "t_HD_STA"; "t_SU_STO"; "t_LOW"; "t_HD_DAT" ]
let config_b = [ "t_HIGH"; "t_SU_DAT"; "t_SU_STA"; "t_BUF" ]

let%expect_test "monitors compiled from the spec flag exactly what the checker predicts" =
  (* all points keep the hardware ORDER invariant, so the waveform is exactly
     the one the checker analysed *)
  let points = [ 0, 0; 0, 5; 0, 6; 0, -5; 0, -6; 0, -10; 10, 15; 10, 16; -20, -26; 20, 26 ] in
  let disagreements = ref 0 in
  printf "  K1   K2  rule      checker  monitor\n";
  List.iter points ~f:(fun (k1, k2) ->
    let k = function 1 -> k1 | 2 -> k2 | _ -> 0 in
    List.iter [ config_a; config_b ] ~f:(fun names ->
      let res = run_loopback ~k1 ~k2 names in
      List.iter2_exn names res ~f:(fun name r ->
        let p = predicted_ok name ~k in
        let agree = Bool.equal p (not r.flagged) in
        if not agree then Int.incr disagreements;
        (* print only the interesting rows: violations, or disagreements *)
        if (not p) || r.flagged || not agree
        then
          printf
            "%4d %4d  %-9s %-8s %-8s%s\n"
            k1
            k2
            name
            (if p then "ok" else "VIOLATES")
            (if r.flagged then "FLAGGED" else "quiet")
            (if agree then "" else "   <-- DISAGREE"))));
  printf
    "%d points x 8 rules checked; every unlisted pair: both ok. disagreements: %d\n"
    (List.length points)
    !disagreements;
  [%expect {|
      K1   K2  rule      checker  monitor
       0    6  t_HD_STA  VIOLATES FLAGGED
       0   -6  t_SU_STO  VIOLATES FLAGGED
       0  -10  t_SU_STO  VIOLATES FLAGGED
       0  -10  t_SU_STA  VIOLATES FLAGGED
      10   16  t_HD_STA  VIOLATES FLAGGED
     -20  -26  t_SU_STO  VIOLATES FLAGGED
      20   26  t_HD_STA  VIOLATES FLAGGED
    10 points x 8 rules checked; every unlisted pair: both ok. disagreements: 0 |}]
;;

let%expect_test "measured datasheet of our own I2C output at K = 0" =
  let measured =
    run_loopback ~k1:0 ~k2:0 config_a @ run_loopback ~k1:0 ~k2:0 config_b
    |> List.zip_exn (config_a @ config_b)
  in
  let predicted = concrete ~k:(fun _ -> 0) in
  printf "%-9s %9s %10s %10s %9s  %s\n" "rule" "spec" "predicted" "measured" "margin" "n";
  List.iter rules ~f:(fun (r : Spec.rule) ->
    let m = List.Assoc.find_exn measured r.name ~equal:String.equal in
    let p = List.find_exn predicted ~f:(fun c -> String.equal c.rule r.name) in
    let spec_ns = Option.value r.min_ns ~default:0 in
    if m.count = 0
    then
      printf
        "%-9s %6d ns %10s %10s %9s  0 (never triggered; predicted %d)\n"
        r.name
        spec_ns
        "-"
        "-"
        "-"
        p.instances
    else
      printf
        "%-9s %6d ns %6d cyc %6d cyc %+6d ns  %d%s\n"
        r.name
        spec_ns
        (Option.value p.min_sep ~default:(-1))
        m.min_seen
        ((m.min_seen * 20) - spec_ns)
        m.count
        (if Option.equal Int.equal p.min_sep (Some m.min_seen) && p.instances = m.count
         then ""
         else "   <-- DIFFERS"));
  [%expect {|
    rule           spec  predicted   measured    margin  n
    t_HD_STA    4000 ns    220 cyc    220 cyc   +400 ns  1
    t_LOW       4700 ns    248 cyc    248 cyc   +260 ns  28
    t_HIGH      4000 ns    220 cyc    220 cyc   +400 ns  27
    t_SU_STA    4700 ns          -          -         -  0 (never triggered; predicted 0)
    t_SU_DAT     250 ns    208 cyc    208 cyc  +3910 ns  16
    t_HD_DAT       0 ns     40 cyc     40 cyc   +800 ns  16
    t_SU_STO    4000 ns    220 cyc    220 cyc   +400 ns  1
    t_BUF       4700 ns          -          -         -  0 (never triggered; predicted 0) |}]
;;
