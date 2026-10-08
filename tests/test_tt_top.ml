(* The whole chip through its pins only, as it will be used on a board: a host
   bit-bangs SPI on ui_in, an EEPROM sits on the uio pins, and every result is
   read back over SPI. Nothing internal is observed. *)
open! Base
open Stdio
open Hardcaml
module Isa = Fipe_isa.Isa
module C = Fipe_checker
module Spec = Fipe_spec.Protocol_spec
module T = Fipe_hw.Tt_top
module E = Fipe_model.I2c_eeprom
module Sim = Cyclesim.With_interface (T.I) (T.O)

(* An RC model of the SDA line (pin 0) for rise-time tests: pull-up R, bus
   capacitance C, and optionally an unpowered device clamping the line below
   the input threshold. A released line crosses the threshold (taken as half
   the supply) after ln 2 * R * C. *)
type rc =
  { r_ohm : float
  ; c_pf : float
  ; clamp : bool
  }

let cross_cycles rc =
  Float.iround_up_exn (Float.log 2. *. rc.r_ohm *. rc.c_pf *. 1e-12 /. 20e-9)
;;

type chip =
  { sim : Sim.t
  ; i : Bits.t ref T.I.t
  ; o : Bits.t ref T.O.t
  ; mutable ui : int
  ; mutable pull : bool
  ; dev : E.t option
  ; mutable cycles : int
  ; mutable half : int (* SPI SCK half period, in core cycles *)
  ; rc : rc option
  ; mutable released_at : int option
  }
[@@warning "-69"]

let set r w v = r := Bits.of_int ~width:w (v land ((1 lsl w) - 1))

(* One core clock. The uio pins are an open-drain bus with pull-ups: a pin
   reads low if the chip drives it low or the device pulls it low. *)
let tick c =
  let out = Bits.to_int !(c.o.uio_out) and oe = Bits.to_int !(c.o.uio_oe) in
  let ours = out land oe lor (lnot oe land 0xFF) in
  let ours =
    match c.rc with
    | None -> ours
    | Some rc ->
      let driven_low = oe land 1 = 1 && out land 1 = 0 in
      let driven_high = oe land 1 = 1 && out land 1 = 1 in
      if driven_low || driven_high
      then (
        c.released_at <- None;
        ours)
      else (
        let t0 =
          match c.released_at with
          | Some t -> t
          | None ->
            c.released_at <- Some c.cycles;
            c.cycles
        in
        let high = (not rc.clamp) && c.cycles - t0 >= cross_cycles rc in
        if high then ours lor 1 else ours land lnot 1)
  in
  let levels = ours land lnot (if c.pull then 1 else 0) land 0xFF in
  set c.i.uio_in 8 levels;
  set c.i.ui_in 8 c.ui;
  Cyclesim.cycle c.sim;
  c.cycles <- c.cycles + 1;
  Option.iter c.dev ~f:(fun d ->
    c.pull <- E.step d ~scl:(levels land 2 <> 0) ~sda:(levels land 1 <> 0))
;;

let ticks c n =
  for _ = 1 to n do
    tick c
  done
;;

let make ?dev ?rc ?(half = 4) () =
  let sim = Sim.create T.create in
  let c =
    { sim
    ; i = Cyclesim.inputs sim
    ; o = Cyclesim.outputs sim
    ; ui = 0b010 (* CS_n high, SCK low *)
    ; pull = false
    ; dev
    ; cycles = 0
    ; half
    ; rc
    ; released_at = None
    }
  in
  c.i.rst_n := Bits.gnd;
  c.i.ena := Bits.vdd;
  ticks c 5;
  c.i.rst_n := Bits.vdd;
  ticks c 5;
  c
;;

(* SPI mode 0. Default SCK = clk/8: four core cycles per half period. *)
let sck c v = c.ui <- (c.ui land lnot 1) lor if v then 1 else 0
let cs c low = c.ui <- (c.ui land lnot 2) lor if low then 0 else 2
let mosi c v = c.ui <- (c.ui land lnot 4) lor if v then 4 else 0
let miso c = Bits.to_int !(c.o.uo_out) land 0x80 <> 0

let xfer c ~cmd ~data =
  cs c true;
  ticks c c.half;
  let got = ref 0 in
  for k = 0 to 39 do
    let b = if k < 8 then (cmd lsr (7 - k)) land 1 else (data lsr (39 - k)) land 1 in
    mosi c (b = 1);
    ticks c c.half;
    if k >= 8 then got := (!got lsl 1) lor if miso c then 1 else 0;
    sck c true;
    ticks c c.half;
    sck c false
  done;
  ticks c c.half;
  cs c false;
  ticks c c.half;
  !got
;;

let write c addr data = ignore (xfer c ~cmd:(0x80 lor addr) ~data : int)
let read c addr = xfer c ~cmd:addr ~data:0

let%expect_test "ID and register read-back over SPI" =
  let c = make () in
  printf "ID 0x%08x (%S)\n" (read c T.Reg.id) "FIPE";
  write c T.Reg.pins 0b001_000;
  write c T.Reg.skew 0x03_FB_05;
  printf "PINS 0x%02x  SKEW 0x%06x\n" (read c T.Reg.pins) (read c T.Reg.skew);
  [%expect {|
    ID 0x46495045 ("FIPE")
    PINS 0x08  SKEW 0x03fb05 |}]
;;

let%expect_test "full chip: I2C write and poll against an EEPROM, all over the pins" =
  let dev = E.create E.default in
  let c = make ~dev () in
  let program = C.Firmware.i2c_write_and_poll ~bytes:3 () in
  Array.iteri program ~f:(fun a ins -> write c a (Isa.encode ins));
  List.iter C.Firmware.[ byte 0xA0; byte 0x00; byte 0x5A; byte 0xA0 ] ~f:(write c T.Reg.fifo);
  write c T.Reg.pins (0 lor (1 lsl 3));
  write c T.Reg.skew 0;
  (* four monitor slots from the compiled spec *)
  let names = [ "t_HD_STA"; "t_LOW"; "t_SU_DAT"; "t_HIGH" ] in
  let pin_of = function "SDA" -> 0 | _ -> 1 in
  List.iteri names ~f:(fun s n ->
    let r =
      List.find_exn Spec.I2c_standard_mode.spec.rules ~f:(fun (r : Spec.rule) ->
        String.equal r.name n)
    in
    let a, b, cw =
      C.Monitor.of_rule ~clk_hz:50_000_000 r
      |> Or_error.ok_exn
      |> C.Monitor.Hw.of_slot ~pin_of
      |> C.Monitor.words
    in
    write c (T.Reg.mon_cfg + (3 * s)) a;
    write c (T.Reg.mon_cfg + (3 * s) + 1) b;
    write c (T.Reg.mon_cfg + (3 * s) + 2) cw);
  write c T.Reg.ctrl 0b011 (* clear monitors, start *);
  let status () = read c T.Reg.status in
  let rec wait n =
    let s = status () in
    if s land 1 = 1 && (s lsr 4) land 7 = 0 then s
    else if n = 0 then failwith "timeout"
    else (
      ticks c 2_000;
      wait (n - 1))
  in
  let s = wait 50 in
  let samples = read c T.Reg.samples in
  printf
    "halted after ~%d cycles; late %d order %d window %d; samples logged %d\n"
    c.cycles
    ((s lsr 1) land 1)
    ((s lsr 2) land 1)
    ((s lsr 3) land 1)
    ((s lsr 16) land 0x3F);
  printf
    "sampled bits, oldest first: %s (expect 0001: three ACKs, then busy NACK)\n"
    (String.init 4 ~f:(fun k -> if (samples lsr (3 - k)) land 1 = 1 then '1' else '0'));
  printf "device wrote 0x%02x at 0x00\n" (Hashtbl.find_exn dev.memory 0);
  printf "monitor violations: %d\n" ((s lsr 24) land 0xF);
  let counts = read c T.Reg.mon_counts in
  List.iteri names ~f:(fun s n ->
    let seen = read c (T.Reg.mon_seen + s) in
    printf
      "  %-9s min %3d cyc  max %3d cyc  n %d\n"
      n
      (seen land 0xFFFF)
      (seen lsr 16)
      ((counts lsr (8 * s)) land 0xFF));
  [%expect {|
    halted after ~40918 cycles; late 0 order 0 window 0; samples logged 4
    sampled bits, oldest first: 0001 (expect 0001: three ACKs, then busy NACK)
    device wrote 0x5a at 0x00
    monitor violations: 0
      t_HD_STA  min 220 cyc  max 220 cyc  n 2
      t_LOW     min 248 cyc  max 248 cyc  n 38
      t_SU_DAT  min 192 cyc  max 208 cyc  n 22
      t_HIGH    min 220 cyc  max 680 cyc  n 37 |}]
;;

(* Our own SPI port, characterized the way we characterize others: sweep SCK
   from very slow to beyond the clk/8 limit, both read and write, and find
   where it fails. Industry experience: parts that fail at LOW frequency exist,
   so the sweep starts slow. *)
let%expect_test "self-characterization: our SPI port across SCK frequency" =
  printf "%9s %10s  %s\n" "half (cyc)" "SCK" "ID read / register write+read";
  List.iter [ 1; 2; 3; 4; 6; 10; 50; 500 ] ~f:(fun half ->
    let c = make ~half () in
    let id_ok = read c T.Reg.id = T.id in
    write c T.Reg.pins 0b101_010;
    let rw_ok = read c T.Reg.pins = 0b101_010 in
    let mhz = 50. /. (2. *. Float.of_int half) in
    printf
      "%9d %7.3g MHz  %s / %s\n"
      half
      mhz
      (if id_ok then "pass" else "FAIL")
      (if rw_ok then "pass" else "FAIL"));
  [%expect {|
    half (cyc)        SCK  ID read / register write+read
            1      25 MHz  FAIL / FAIL
            2    12.5 MHz  FAIL / FAIL
            3    8.33 MHz  pass / pass
            4    6.25 MHz  pass / pass
            6    4.17 MHz  pass / pass
           10     2.5 MHz  pass / pass
           50     0.5 MHz  pass / pass
          500    0.05 MHz  pass / pass |}]
;;

(* Open-drain rise time, measured from the chip's own release of SDA to the
   synchronized input reading high. A sample event trails the release by K3
   cycles (prescale x1, 20 ns steps); a binary search finds the first K3 that
   reads high. A no-load run calibrates out the chip's fixed latency. With and
   without a known switched capacitor on the board, two equations give the
   pull-up R and the unknown bus capacitance, which predict the rise time at
   any load. *)
let rise_program =
  let open Isa in
  [| Set { dst = Coder_mode; imm = Coder_mode.open_drain }
   ; Evt { dt = 0; clk_pin = false; cls = 0; act = Drive0 }
   ; Dly { dt = 100 } (* hold low 2 us so the line is fully discharged *)
   ; Evt { dt = 0; clk_pin = false; cls = 0; act = Release }
   ; Evt { dt = 0; clk_pin = false; cls = 3; act = Sample } (* at release + K3 *)
   ; Jmp { cond = Always; addr = 5 }
  |]
;;

(* First K3 at which the released line reads high, or None within 127 cycles. *)
let first_high rc =
  let c = make ~rc () in
  Array.iteri rise_program ~f:(fun a ins -> write c a (Isa.encode ins));
  write c T.Reg.pins (0 lor (1 lsl 3));
  let high k3 =
    write c T.Reg.skew (k3 lsl 16);
    write c T.Reg.ctrl 1;
    let rec wait () = if read c T.Reg.status land 1 = 0 then (ticks c 200; wait ()) in
    wait ();
    read c T.Reg.samples land 1 = 1
  in
  if not (high 127)
  then None
  else (
    let rec go lo hi = if hi - lo <= 1 then hi else (let m = (lo + hi) / 2 in if high m then go lo m else go m hi) in
    Some (if high 0 then 0 else go 0 127))
;;

let%expect_test "open-drain rise time: two loads give pull-up R and bus C" =
  let r = 4700. and c_bus = 45. and c_sw = 100. in
  let base = first_high { r_ohm = r; c_pf = 0.; clamp = false } |> Option.value_exn in
  let t1 = first_high { r_ohm = r; c_pf = c_bus; clamp = false } |> Option.value_exn in
  let t2 = first_high { r_ohm = r; c_pf = c_bus +. c_sw; clamp = false } |> Option.value_exn in
  let ns k = Float.of_int ((k - base) * 20) in
  let ln2 = Float.log 2. in
  let r_est = (ns t2 -. ns t1) *. 1e-9 /. (ln2 *. c_sw *. 1e-12) in
  let c_est = ns t1 *. 1e-9 /. (ln2 *. r_est) *. 1e12 in
  printf "calibration (no load): %d cycles of fixed latency\n" base;
  printf "threshold crossing: %.0f ns at bus load, %.0f ns with +%.0f pF switched in\n" (ns t1) (ns t2) c_sw;
  printf "pull-up R: %.0f ohm measured (true %.0f)\n" r_est r;
  printf "bus C:     %.0f pF measured (true %.0f)\n" c_est c_bus;
  (* 30 to 70 percent rise time of an RC: ln(0.7/0.3) * R * C *)
  let tr c = Float.log (0.7 /. 0.3) *. r_est *. c *. 1e-12 *. 1e9 in
  printf "predicted t_r (30-70%%): %.0f ns at this bus; %.0f ns at the 400 pF spec maximum (limit 1000 ns)\n" (tr c_est) (tr 400.);
  printf "largest pull-up meeting t_r at 400 pF: %.0f ohm\n" (1000e-9 /. (Float.log (0.7 /. 0.3) *. 400e-12));
  (match first_high { r_ohm = r; c_pf = c_bus; clamp = true } with
   | None -> print_endline "unpowered device on the bus: line never reached the threshold (clamped): FAIL"
   | Some k -> printf "unpowered device: crossed after %d cycles\n" k);
  [%expect {|
    calibration (no load): 3 cycles of fixed latency
    threshold crossing: 160 ns at bus load, 480 ns with +100 pF switched in
    pull-up R: 4617 ohm measured (true 4700)
    bus C:     50 pF measured (true 45)
    predicted t_r (30-70%): 196 ns at this bus; 1565 ns at the 400 pF spec maximum (limit 1000 ns)
    largest pull-up meeting t_r at 400 pF: 2951 ohm
    unpowered device on the bus: line never reached the threshold (clamped): FAIL |}]
;;
