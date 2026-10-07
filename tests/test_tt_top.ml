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

type chip =
  { sim : Sim.t
  ; i : Bits.t ref T.I.t
  ; o : Bits.t ref T.O.t
  ; mutable ui : int
  ; mutable pull : bool
  ; dev : E.t option
  ; mutable cycles : int
  }
[@@warning "-69"]

let set r w v = r := Bits.of_int ~width:w (v land ((1 lsl w) - 1))

(* One core clock. The uio pins are an open-drain bus with pull-ups: a pin
   reads low if the chip drives it low or the device pulls it low. *)
let tick c =
  let out = Bits.to_int !(c.o.uio_out) and oe = Bits.to_int !(c.o.uio_oe) in
  let ours = out land oe lor (lnot oe land 0xFF) in
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

let make ?dev () =
  let sim = Sim.create T.create in
  let c =
    { sim
    ; i = Cyclesim.inputs sim
    ; o = Cyclesim.outputs sim
    ; ui = 0b010 (* CS_n high, SCK low *)
    ; pull = false
    ; dev
    ; cycles = 0
    }
  in
  c.i.rst_n := Bits.gnd;
  c.i.ena := Bits.vdd;
  ticks c 5;
  c.i.rst_n := Bits.vdd;
  ticks c 5;
  c
;;

(* SPI mode 0 at SCK = clk/8: four core cycles per half period. *)
let half = 4
let sck c v = c.ui <- (c.ui land lnot 1) lor if v then 1 else 0
let cs c low = c.ui <- (c.ui land lnot 2) lor if low then 0 else 2
let mosi c v = c.ui <- (c.ui land lnot 4) lor if v then 4 else 0
let miso c = Bits.to_int !(c.o.uo_out) land 0x80 <> 0

let xfer c ~cmd ~data =
  cs c true;
  ticks c half;
  let got = ref 0 in
  for k = 0 to 39 do
    let b = if k < 8 then (cmd lsr (7 - k)) land 1 else (data lsr (39 - k)) land 1 in
    mosi c (b = 1);
    ticks c half;
    if k >= 8 then got := (!got lsl 1) lor if miso c then 1 else 0;
    sck c true;
    ticks c half;
    sck c false
  done;
  ticks c half;
  cs c false;
  ticks c half;
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
