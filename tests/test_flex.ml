(* Flexibility: protocols the chip was not designed for, written in assembly
   only, each verified against a device model on the RTL-proven simulator and
   spot-checked on the RTL itself. *)
open! Base
open Stdio
open Hardcaml
module C = Fipe_checker
module Isa = Fipe_isa.Isa
module T = Fipe_asm.Text
module CB = Fipe_bench.Chip_bus
module L = Fipe_hw.Loopback
module Lsim = Cyclesim.With_interface (L.I) (L.O)

let set r w v = r := Bits.of_int ~width:w (v land ((1 lsl w) - 1))
let source name = In_channel.read_all ("../examples/" ^ name ^ ".s")

let assemble ?(subst = []) name =
  let src =
    List.fold subst ~init:(source name) ~f:(fun s (k, v) ->
      String.substr_replace_all s ~pattern:k ~with_:v)
  in
  T.assemble src |> Result.ok_or_failwith
;;

(* The same program and device on the RTL loopback. *)
let rtl ~(cfg : C.Isim.config) ~fifo ~cycles ~(device : CB.device) program =
  let sim = Lsim.create L.create in
  let i : _ L.I.t = Cyclesim.inputs sim in
  let o : _ L.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  i.core.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.clear := Bits.gnd;
  Array.iteri program ~f:(fun a ins ->
    i.core.imem_we := Bits.vdd;
    set i.core.imem_addr 6 a;
    set i.core.imem_data 16 (Isa.encode ins);
    Cyclesim.cycle sim);
  i.core.imem_we := Bits.gnd;
  set i.core.cfg_data_pin 3 cfg.data_pin;
  set i.core.cfg_clk_pin 3 cfg.clk_pin;
  set i.core.cfg_in_pin 3 cfg.in_pin;
  set i.core.cfg_aux_pin 3 cfg.aux_pin;
  i.core.start := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.start := Bits.gnd;
  let fifo = ref fifo and samples = Queue.create () in
  for _ = 1 to cycles do
    (match !fifo with
     | w :: _ ->
       i.core.fifo_valid := Bits.vdd;
       set i.core.fifo_data 32 w
     | [] -> i.core.fifo_valid := Bits.gnd);
    Cyclesim.cycle sim;
    if Bits.to_bool !(o.core.fifo_ready) then fifo := List.tl_exn !fifo;
    if Bits.to_bool !(o.core.sample_valid) then Queue.enqueue samples (Bits.to_int !(o.core.sample_bit));
    set i.ext_pull_low 8 (device ~levels:(Bits.to_int !(o.levels)))
  done;
  Queue.to_list samples, Bits.to_bool !(o.core.halted)
;;

(* --- WS2812 ----------------------------------------------------------------- *)

module W = Fipe_model.Ws2812

let ws_cfg = { C.Isim.default_config with data_pin = 0; clk_pin = 1; in_pin = 2; aux_pin = 3 }
let colours = [ 0xFF0000; 0x00FF00; 0x5A3C96 ] (* GRB *)

let ws_run ?(subst = []) () =
  let leds = W.create (W.default ~leds:3) in
  let r =
    CB.run
      ~tail:100
      ~cfg:ws_cfg
      ~fifo:(List.map colours ~f:(fun c -> c lsl 8))
      ~device:(fun ~levels ->
        W.step leds ~din:(levels land 1 = 1);
        0)
      (assemble ~subst "ws2812")
  in
  r, leds
;;

let%expect_test "WS2812: three LEDs, on-chip bit encoding" =
  let r, leds = ws_run () in
  let ns l = List.map l ~f:(fun c -> c * 20) in
  let zero_w, one_w = List.partition_tf (ns leds.widths) ~f:(fun w -> w < 620) in
  let mm l = Option.value_exn (List.min_elt l ~compare:Int.compare), Option.value_exn (List.max_elt l ~compare:Int.compare) in
  printf "program %d words; halted %b after %d cycles\n" (Array.length (assemble "ws2812")) r.sim.halted r.cycles;
  printf "LEDs latched (GRB): %s\n" (String.concat ~sep:" " (List.map leds.latched ~f:(Printf.sprintf "%06X")));
  printf "0 bits: high %d..%d ns (spec 400 +/- 150)\n" (fst (mm zero_w)) (snd (mm zero_w));
  printf "1 bits: high %d..%d ns (spec 800 +/- 150)\n" (fst (mm one_w)) (snd (mm one_w));
  printf "bit period %d..%d ns (spec 1250 +/- 600)\n" (fst (mm (ns leds.periods))) (snd (mm (ns leds.periods)));
  (* the same run on the RTL *)
  let rtl_leds = W.create (W.default ~leds:3) in
  let _ =
    rtl
      ~cfg:ws_cfg
      ~fifo:(List.map colours ~f:(fun c -> c lsl 8))
      ~cycles:(r.cycles + 50)
      ~device:(fun ~levels ->
        W.step rtl_leds ~din:(levels land 1 = 1);
        0)
      (assemble "ws2812")
  in
  printf
    "RTL: same colours %b, same pulse widths %b\n"
    ([%equal: int list] rtl_leds.latched leds.latched)
    ([%equal: int list] rtl_leds.widths leds.widths);
  [%expect {|
    program 21 words; halted true after 36485 cycles
    LEDs latched (GRB): FF0000 00FF00 5A3C96
    0 bits: high 400..400 ns (spec 400 +/- 150)
    1 bits: high 800..800 ns (spec 800 +/- 150)
    bit period 1200..1200 ns (spec 1250 +/- 600)
    RTL: same colours true, same pulse widths true |}]
;;

(* Measured datasheet, LED edition: sweep the slot length. A 0 is THIRD cycles
   high and a 1 is 2 x THIRD; the LEDs decode correctly only while the 0 stays
   under their decision threshold and the 1 exceeds it, so the passing window
   pins the threshold down. *)
let%expect_test "WS2812: the LED's 0/1 decision threshold, from a sweep" =
  let ok third =
    let _, leds = ws_run ~subst:[ ".equ  THIRD, 20", Printf.sprintf ".equ  THIRD, %d" third ] () in
    [%equal: int list] leds.latched colours
  in
  let thirds = List.range 10 33 in
  let pass = List.filter thirds ~f:ok in
  let lo = List.hd_exn pass and hi = List.last_exn pass in
  printf "%s\n" (String.concat (List.map thirds ~f:(fun t -> if ok t then "." else "X")));
  printf
    "decodes for THIRD = %d..%d cycles: threshold above %d ns (longest 0 accepted) and below %d ns (shortest 1 accepted); hidden: %d ns\n"
    lo
    hi
    (hi * 20)
    (2 * lo * 20)
    (31 * 20);
  [%expect {|
    XXXXXX................X
    decodes for THIRD = 16..31 cycles: threshold above 620 ns (longest 0 accepted) and below 640 ns (shortest 1 accepted); hidden: 620 ns |}]
;;

(* --- 1-Wire ------------------------------------------------------------------ *)

module O = Fipe_model.Onewire

let ow_cfg = { C.Isim.default_config with data_pin = 0; clk_pin = 1; in_pin = 0; aux_pin = 3 }
let ow_fifo = [ C.Firmware.uart_word 0x33 ] (* LSB first, like UART *)

let ow_device dev ~levels = if O.step dev ~line:(levels land 1 = 1) then 1 else 0

let%expect_test "1-Wire: presence, READ ROM, 64-bit ID with CRC" =
  let program = assemble "onewire_read_rom" in
  let dev = O.create O.default in
  let r = CB.run ~tail:10 ~cfg:ow_cfg ~fifo:ow_fifo ~device:(ow_device dev) program in
  let bits = CB.sample_bits r in
  let presence = List.hd_exn bits and rom_bits = List.tl_exn bits in
  let bytes =
    List.chunks_of rom_bits ~length:8
    |> List.map ~f:(fun l -> List.foldi l ~init:0 ~f:(fun i a b -> a lor (b lsl i)))
  in
  let hex l = String.concat ~sep:" " (List.map l ~f:(Printf.sprintf "%02X")) in
  printf "program %d words; device saw command 0x%02X\n" (Array.length program) (Option.value_exn dev.command);
  printf "presence bit %d\nROM read: %s\nROM true: %s\n" presence (hex bytes) (hex O.default.rom);
  printf
    "family 0x%02X, CRC-8 %s\n"
    (List.hd_exn bytes)
    (if O.crc8 (List.take bytes 7) = List.nth_exn bytes 7 then "valid" else "INVALID");
  printf "halted at pc %d after %d cycles (%d us)\n" r.sim.pc r.cycles (r.cycles / 50);
  (* the same exchange on the RTL *)
  let dev2 = O.create O.default in
  let rtl_samples, _ = rtl ~cfg:ow_cfg ~fifo:ow_fifo ~cycles:(r.cycles + 50) ~device:(ow_device dev2) program in
  printf "RTL: identical samples %b\n" ([%equal: int list] rtl_samples bits);
  [%expect {|
    program 39 words; device saw command 0x33
    presence bit 0
    ROM read: 28 E5 D4 C3 B2 A1 00 F5
    ROM true: 28 E5 D4 C3 B2 A1 00 F5
    family 0x28, CRC-8 valid
    halted at pc 37 after 297277 cycles (5945 us)
    RTL: identical samples true |}]
;;

let%expect_test "1-Wire: no device answers, so the program takes the other branch" =
  let program = assemble "onewire_read_rom" in
  let r = CB.run ~tail:10 ~cfg:ow_cfg ~fifo:ow_fifo ~device:(fun ~levels:_ -> 0) program in
  let absent =
    match T.assemble (source "onewire_read_rom") with
    | Ok p -> Array.length p - 1
    | Error _ -> -1
  in
  printf
    "presence bit %d; halted at pc %d (the 'absent' label is %d) after %d us\n"
    (List.hd_exn (CB.sample_bits r))
    r.sim.pc
    absent
    (r.cycles / 50);
  [%expect {| presence bit 1; halted at pc 38 (the 'absent' label is 38) after 553 us |}]
;;

(* --- JTAG ---------------------------------------------------------------------- *)

module J = Fipe_model.Jtag_tap

let jtag_cfg = { C.Isim.default_config with data_pin = 0; clk_pin = 1; in_pin = 2; aux_pin = 3 }

(* TDI pin 0, TCK pin 1, TDO pin 2, TMS pin 3 *)
let jtag_device tap ~levels =
  let b k = levels land (1 lsl k) <> 0 in
  match J.step tap ~tck:(b 1) ~tms:(b 3) ~tdi:(b 0) with
  | Some false -> 4
  | _ -> 0
;;

let%expect_test "JTAG: walk the TAP and read IDCODE" =
  let program = assemble "jtag_idcode" in
  let tap = J.create () in
  let r = CB.run ~tail:10 ~cfg:jtag_cfg ~fifo:[] ~device:(jtag_device tap) program in
  let bits = CB.sample_bits r in
  let id = List.foldi bits ~init:0 ~f:(fun i a b -> a lor (b lsl i)) in
  printf "program %d words; %d TDO samples\n" (Array.length program) (List.length bits);
  printf "IDCODE 0x%08X (device holds 0x%08X)\n" id tap.idcode;
  printf
    "  version %d, part 0x%04X, manufacturer 0x%03X (JEDEC; 0x23B is ARM), bit 0 = %d\n"
    (id lsr 28)
    ((id lsr 12) land 0xFFFF)
    ((id lsr 1) land 0x7FF)
    (id land 1);
  printf
    "TAP path: %s\n"
    (String.concat ~sep:" > " (List.rev_map tap.visited ~f:(fun s -> Sexp.to_string (J.sexp_of_state s))));
  let tap2 = J.create () in
  let rtl_samples, _ = rtl ~cfg:jtag_cfg ~fifo:[] ~cycles:(r.cycles + 50) ~device:(jtag_device tap2) program in
  printf "RTL: identical samples %b\n" ([%equal: int list] rtl_samples bits);
  [%expect {|
    program 32 words; 32 TDO samples
    IDCODE 0x4BA00477 (device holds 0x4BA00477)
      version 4, part 0xBA00, manufacturer 0x23B (JEDEC; 0x23B is ARM), bit 0 = 1
    TAP path: Tlr > Rti > Sel_dr > Cap_dr > Shift_dr > Exit1_dr > Upd_dr
    RTL: identical samples true |}]
;;
