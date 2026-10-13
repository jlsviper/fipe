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

(* ---- device-side attribution, prescale, corner cases ------------------------ *)

module E = Fipe_model.I2c_eeprom
module Monitors_edge = M.Edge

(* Slot 0 only, set directly: [start] and [stop] are (pin, edge, qualifier
   option); [dev] marks the stop trigger "device edges only". *)
let set_slot0 (m : Bits.t ref M.I.t) ~start ~stop ~dev ~prescale =
  let n l = List.nth_exn l 0 in
  for k = 1 to M.n_slots - 1 do
    setb (List.nth_exn m.en k) false
  done;
  let put (pin, edge, q) rp re rqen rqp rql =
    set (n rp) 3 pin;
    set (n re) 2 edge;
    match q with
    | None -> setb (n rqen) false
    | Some (qp, ql) ->
      setb (n rqen) true;
      set (n rqp) 3 qp;
      setb (n rql) ql
  in
  setb (n m.en) true;
  put start m.st_pin m.st_edge m.st_qen m.st_qpin m.st_qlvl;
  put stop m.sp_pin m.sp_edge m.sp_qen m.sp_qpin m.sp_qlvl;
  setb (n m.ab_en) false;
  setb (n m.keep_first) false;
  setb (n m.min_en) false;
  setb (n m.max_en) false;
  setb (n m.sp_dev) dev;
  set (n m.prescale) 2 prescale
;;

(* An I2C write of three bytes to the EEPROM model on the loopback bus; returns
   slot 0's (min_seen, max_seen, count). *)
let with_eeprom ?(params = E.default) ~start ~stop ~dev ~prescale () =
  let sim = Lsim.create L.create in
  let i : _ L.I.t = Cyclesim.inputs sim in
  let o : _ L.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  let dev_m = E.create params in
  set_slot0 i.mon ~start ~stop ~dev ~prescale;
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
  i.mon.mon_clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.mon.mon_clear := Bits.gnd;
  i.core.start := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.start := Bits.gnd;
  let fifo = ref i2c_fifo and finished = ref 0 and cycles = ref 0 in
  while !finished < 10 && !cycles < 80_000 do
    (match !fifo with
     | w :: _ ->
       i.core.fifo_valid := Bits.vdd;
       set i.core.fifo_data 32 w
     | [] -> i.core.fifo_valid := Bits.gnd);
    Cyclesim.cycle sim;
    Int.incr cycles;
    let lv = Bits.to_int !(o.levels) in
    let pull = E.step dev_m ~scl:(lv land 2 <> 0) ~sda:(lv land 1 <> 0) in
    set i.ext_pull_low 8 (if pull then 1 else 0);
    if Bits.to_bool !(o.core.fifo_ready) then fifo := List.tl_exn !fifo;
    if Bits.to_bool !(o.core.halted) && Bits.to_int !(o.core.queue_count) = 0
    then Int.incr finished
  done;
  Cyclesim.cycle sim;
  let g l = Bits.to_int !(List.nth_exn l 0) in
  g o.mon.min_seen, g o.mon.max_seen, g o.mon.count
;;

let%expect_test "device-side attribution: the EEPROM's own ACK delay, across a population" =
  (* START: SCL falls. STOP: SDA falls. Re-arming on every SCL fall makes the
     slot report the interval from the latest SCL fall to the next SDA fall. *)
  let start = 1, Monitors_edge.fall, None and stop = 0, Monitors_edge.fall, None in
  printf "t_vd_ack   device-only stop (min..max, count)   any-edge stop (min..max)\n";
  List.iter [ 25; 35; 45; 55 ] ~f:(fun t_vd_ack ->
    let params = { E.default with t_vd_ack } in
    let dmin, dmax, dn = with_eeprom ~params ~start ~stop ~dev:true ~prescale:0 () in
    let amin, amax, _ = with_eeprom ~params ~start ~stop ~dev:false ~prescale:0 () in
    printf
      "%5d      %4d..%-4d (%d), minus t_vd_ack = %d      %4d..%-4d\n"
      t_vd_ack
      dmin
      dmax
      dn
      (dmin - t_vd_ack)
      amin
      amax);
  [%expect {|
    t_vd_ack   device-only stop (min..max, count)   any-edge stop (min..max)
       25        41..41   (3), minus t_vd_ack = 16        40..41
       35        51..51   (3), minus t_vd_ack = 16        40..51
       45        61..61   (3), minus t_vd_ack = 16        40..61
       55        71..71   (3), minus t_vd_ack = 16        40..71 |}]
;;

let%expect_test "prescale: one transaction timed at x1, x16 and x256" =
  (* START condition (SDA falls while SCL high) to STOP condition (SDA rises
     while SCL high) *)
  let start = 0, Monitors_edge.fall, Some (1, true) in
  let stop = 0, Monitors_edge.rise, Some (1, true) in
  List.iter [ 0, 1; 1, 16; 2, 256 ] ~f:(fun (ps, factor) ->
    let mn, _, n = with_eeprom ~start ~stop ~dev:false ~prescale:ps () in
    (* the counter starts at 1: at x1 it holds the interval exactly; with a
       prescaler the interval is (ticks - 1) * P, within one tick *)
    if factor = 1
    then printf "x1    %6d ticks: exactly %d cycles (count %d)\n" mn mn n
    else
      printf
        "x%-4d %6d ticks: (ticks - 1) x %d = %d cycles, within +/-%d (count %d)\n"
        factor
        mn
        factor
        ((mn - 1) * factor)
        factor
        n);
  [%expect {|
    x1     13324 ticks: exactly 13324 cycles (count 1)
    x16      834 ticks: (ticks - 1) x 16 = 13328 cycles, within +/-16 (count 1)
    x256      53 ticks: (ticks - 1) x 256 = 13312 cycles, within +/-256 (count 1) |}]
;;

(* Standalone monitor, driven cycle by cycle: [wave] gives pins 0..2 levels per
   cycle. Returns the cycles with a violation and the slot's final state. *)
let corner ?(abort = false) ?max ?(keep_first = false) wave =
  let sim = Msim.create M.create in
  let m : _ M.I.t = Cyclesim.inputs sim in
  let o : _ M.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  set_slot0 m ~start:(0, Monitors_edge.rise, None) ~stop:(1, Monitors_edge.rise, None) ~dev:false ~prescale:0;
  let n l = List.nth_exn l 0 in
  setb (n m.keep_first) keep_first;
  setb (n m.ab_en) abort;
  set (n m.ab_pin) 3 2;
  set (n m.ab_edge) 2 Monitors_edge.rise;
  setb (n m.ab_qen) false;
  (match max with
   | Some v ->
     setb (n m.max_en) true;
     set (n m.max_cyc) 16 v
   | None -> ());
  m.clear := Bits.vdd;
  Cyclesim.cycle sim;
  m.clear := Bits.gnd;
  m.mon_clear := Bits.vdd;
  Cyclesim.cycle sim;
  m.mon_clear := Bits.gnd;
  let viols = Queue.create () in
  Array.iteri wave ~f:(fun c p ->
    set m.pins 8 p;
    Cyclesim.cycle sim;
    if Bits.to_bool !(n o.viol) then Queue.enqueue viols c);
  for _ = 1 to 4 do
    Cyclesim.cycle sim
  done;
  let g l = Bits.to_int !(n l) in
  printf
    "violations at %s; measured %d (min %d, max %d); armed %b\n"
    (if Queue.is_empty viols then "none" else String.concat ~sep:"," (List.map (Queue.to_list viols) ~f:Int.to_string))
    (g o.count)
    (g o.min_seen)
    (g o.max_seen)
    (g o.armed = 1)
;;

(* levels: bit 0 START pin, bit 1 STOP pin, bit 2 ABORT pin; rising edges *)
let wave_of steps len =
  Array.init len ~f:(fun c ->
    List.fold steps ~init:0 ~f:(fun acc (at, bits) -> if c >= at then acc lxor bits else acc))
;;

let%expect_test "monitor corner cases" =
  print_string "START and STOP in one cycle, slot idle: only arms.             ";
  corner (wave_of [ 5, 0b011 ] 30);
  print_string "...then both again 15 cycles later: measures 15 and re-arms.   ";
  corner (wave_of [ 5, 0b011; 10, 0b011; 20, 0b011 ] 40);
  print_string "STOP and ABORT in one cycle: STOP wins (measured 7).            ";
  corner ~abort:true (wave_of [ 5, 0b001; 12, 0b110 ] 30);
  print_string "ABORT alone: nothing measured, disarmed.                        ";
  corner ~abort:true (wave_of [ 5, 0b001; 12, 0b100 ] 30);
  print_string "timeout (max 10) with no new START: flagged once, disarmed.     ";
  corner ~max:10 (wave_of [ 5, 0b001 ] 40);
  (* edges are seen two cycles after they happen, so a START rising at cycle
     16 lands on the cycle-18 timeout *)
  print_string "timeout and a new START in one cycle: flags, and re-arms.       ";
  corner ~max:10 (wave_of [ 5, 0b001; 10, 0b001; 16, 0b001 ] 25);
  [%expect {|
    START and STOP in one cycle, slot idle: only arms.             violations at none; measured 0 (min 65535, max 0); armed true
    ...then both again 15 cycles later: measures 15 and re-arms.   violations at none; measured 1 (min 15, max 15); armed true
    STOP and ABORT in one cycle: STOP wins (measured 7).            violations at none; measured 1 (min 7, max 7); armed false
    ABORT alone: nothing measured, disarmed.                        violations at none; measured 0 (min 65535, max 0); armed false
    timeout (max 10) with no new START: flagged once, disarmed.     violations at 18; measured 1 (min 11, max 11); armed false
    timeout and a new START in one cycle: flags, and re-arms.       violations at 18; measured 1 (min 11, max 11); armed true |}]
;;
