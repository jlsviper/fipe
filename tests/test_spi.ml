(* SPI characterization: a frequency-by-mode sweep against SPI devices with
   failure modes reported from real silicon. *)
open! Base
open Stdio
open Hardcaml
module C = Fipe_checker
module D = Fipe_model.Spi_device
module SB = Fipe_bench.Spi_bus
module Isa = Fipe_isa.Isa
module L = Fipe_hw.Loopback
module Lsim = Cyclesim.With_interface (L.I) (L.O)

let set r w v = r := Bits.of_int ~width:w (v land ((1 lsl w) - 1))

(* The same transaction on the RTL: MOSI pin 0, SCLK 1, MISO 2, CS 3; the
   device drives MISO by pulling the line low (it idles high). *)
let rtl ~params ~mode ~half =
  let program = C.Firmware.spi_read_id ~mode ~half in
  let sim = Lsim.create L.create in
  let i : _ L.I.t = Cyclesim.inputs sim in
  let o : _ L.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  let dev = D.create params in
  i.core.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.clear := Bits.gnd;
  Array.iteri program ~f:(fun a ins ->
    i.core.imem_we := Bits.vdd;
    set i.core.imem_addr 6 a;
    set i.core.imem_data 16 (Isa.encode ins);
    Cyclesim.cycle sim);
  i.core.imem_we := Bits.gnd;
  set i.core.cfg_data_pin 3 0;
  set i.core.cfg_clk_pin 3 1;
  set i.core.cfg_in_pin 3 2;
  set i.core.cfg_aux_pin 3 3;
  i.core.start := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.start := Bits.gnd;
  let fifo = ref C.Firmware.spi_read_id_fifo in
  let samples = Queue.create () in
  let idle = ref 0 and cycles = ref 0 in
  while !idle < 400 && !cycles < 200_000 do
    (match !fifo with
     | w :: _ ->
       i.core.fifo_valid := Bits.vdd;
       set i.core.fifo_data 32 w
     | [] -> i.core.fifo_valid := Bits.gnd);
    Cyclesim.cycle sim;
    Int.incr cycles;
    if Bits.to_bool !(o.core.fifo_ready) then fifo := List.tl_exn !fifo;
    if Bits.to_bool !(o.core.sample_valid)
    then Queue.enqueue samples (Bits.to_int !(o.core.sample_bit));
    let lv = Bits.to_int !(o.levels) in
    let b k = lv land (1 lsl k) <> 0 in
    let drive = D.step dev ~cs:(b 3) ~sclk:(b 1) ~mosi:(b 0) in
    set i.ext_pull_low 8 (if Option.equal Bool.equal drive (Some false) then 4 else 0);
    if Bits.to_bool !(o.core.halted) && Bits.to_int !(o.core.queue_count) = 0 then Int.incr idle
  done;
  Cyclesim.cycle sim;
  Queue.to_list samples, Bits.to_bool !(o.core.late)
;;

let oz = { D.typical with mode0_only = true; idle_timeout = Some 40 }

let%expect_test "the fast SPI bench matches the RTL" =
  let points =
    [ D.typical, 0, 10; D.typical, 1, 10; D.typical, 3, 6; D.typical, 0, 2; oz, 2, 12; oz, 0, 48; oz, 0, 20 ]
  in
  let same = ref 0 in
  List.iter points ~f:(fun (params, mode, half) ->
    let r_samples, r_late = rtl ~params ~mode ~half in
    let m = SB.run ~params ~program:(C.Firmware.spi_read_id ~mode ~half) () in
    if List.equal Int.equal r_samples m.samples && Bool.equal r_late m.late
    then Int.incr same
    else print_s [%message "DIFFERS" (mode : int) (half : int) (r_samples : int list) (m.samples : int list)]);
  printf "%d of %d points identical (all 32 samples and the LATE flag)\n" !same (List.length points);
  [%expect {| 7 of 7 points identical (all 32 samples and the LATE flag) |}]
;;

let halves = [ 2; 3; 4; 5; 6; 8; 10; 12; 16; 20; 24; 32; 40; 48; 64; 96; 128; 192 ]

let shmoo ~title params =
  printf "%s\n" title;
  printf "  SCLK MHz %s\n"
    (String.concat (List.map halves ~f:(fun h -> Printf.sprintf "%6.3g" (50. /. (2. *. Float.of_int h)))));
  List.iter [ 0; 1; 2; 3 ] ~f:(fun mode ->
    printf "  mode %d   " mode;
    List.iter halves ~f:(fun half ->
      let o = SB.run ~params ~program:(C.Firmware.spi_read_id ~mode ~half) () in
      let c =
        if o.late
        then 'L'
        else if Option.equal Int.equal (SB.id_of o.samples) (Some params.id)
        then '.'
        else 'X'
      in
      printf "     %c" c);
    printf "\n")
;;

let%expect_test "frequency-by-mode shmoo: a typical part and one with real-silicon bugs" =
  shmoo ~title:"typical part: modes 0 and 3, 60 ns minimum SCLK phase" D.typical;
  shmoo ~title:"\npart with mode-0-only logic and an 800 ns SCLK watchdog" oz;
  printf "\n. ID read correctly   X wrong ID   L the chip cannot generate this rate\n";
  [%expect {|
    typical part: modes 0 and 3, 60 ns minimum SCLK phase
      SCLK MHz   12.5  8.33  6.25     5  4.17  3.12   2.5  2.08  1.56  1.25  1.04 0.781 0.625 0.521 0.391  0.26 0.195  0.13
      mode 0        L     X     X     .     .     .     .     .     .     .     .     .     .     .     .     .     .     .
      mode 1        L     .     .     .     .     .     .     .     .     .     .     .     .     .     .     .     .     .
      mode 2        L     X     X     X     X     X     X     X     X     X     X     X     X     X     X     X     X     X
      mode 3        L     X     X     .     .     .     .     .     .     .     .     .     .     .     .     .     .     .

    part with mode-0-only logic and an 800 ns SCLK watchdog
      SCLK MHz   12.5  8.33  6.25     5  4.17  3.12   2.5  2.08  1.56  1.25  1.04 0.781 0.625 0.521 0.391  0.26 0.195  0.13
      mode 0        L     X     X     .     .     .     .     .     .     .     .     .     .     X     X     X     X     X
      mode 1        L     .     .     .     .     .     .     .     .     .     .     .     .     X     X     X     X     X
      mode 2        L     X     X     X     X     X     X     X     X     X     X     X     X     X     X     X     X     X
      mode 3        L     X     X     X     X     X     X     X     X     X     X     X     X     X     X     X     X     X

    . ID read correctly   X wrong ID   L the chip cannot generate this rate |}]
;;
