open! Base
open Stdio
module C = Fipe_checker
module Spec = Fipe_spec.Protocol_spec

let timing = { C.Check.clk_hz = 50_000_000; prescale = 4 }

(* Write 0x5A to address 0x00 of an EEPROM at 0x50. *)
let events () =
  C.Exec.run
    ~pins:C.Firmware.i2c_pins
    ~fifo:C.Firmware.[ byte 0xA0; byte 0x00; byte 0x5A ]
    (C.Firmware.i2c_write ~bytes:3)
  |> Or_error.ok_exn
;;

let findings () = C.Check.check ~timing Spec.I2c_standard_mode.spec (events ())

let%expect_test "I2C write: every rule, with the skew range where it holds" =
  print_string (C.Check.report ~timing (findings ()));
  [%expect {|
    dt unit = 80 ns (clock 50 MHz, prescale x4)
    rule      bound         n  holds when                 nominal
    t_HD_STA  >= 4000 ns    1  K1 - K2 >= -5              ok, margin 5 (400 ns)
    t_LOW     >= 4700 ns   28  always holds               ok, margin 3 (240 ns)
    t_HIGH    >= 4000 ns   27  always holds               ok, margin 5 (400 ns)
    t_SU_DAT  >= 250 ns    16  K1 - K2 >= -48             ok, margin 48 (3840 ns)
    t_HD_DAT  >= 0 ns      16  K2 - K1 >= -10             ok, margin 10 (800 ns)
    t_SU_STO  >= 4000 ns    1  K2 - K1 >= -5              ok, margin 5 (400 ns)
    ORDER     >= 0         25  always holds               ok, margin 0 (0 ns)
    ORDER     >= 0          3  -K1 >= -27                 ok, margin 27 (2160 ns)
    ORDER     >= 0          3  K1 >= -28                  ok, margin 28 (2240 ns)
    ORDER     >= 0         29  K1 - K2 >= -52             ok, margin 52 (4160 ns)
    ORDER     >= 0          1  K2 >= -60                  ok, margin 60 (4800 ns)
    ORDER     >= 0         29  K2 - K1 >= -10             ok, margin 10 (800 ns)
    PATTERN   >= 1 unit    17  K1 - K2 >= -51             ok, margin 51 (4080 ns)
    PATTERN   >= 1 unit    17  K2 - K1 >= -9              ok, margin 9 (720 ns) |}]
;;

(* The predicted shmoo: which rule breaks first at each (K1, K2). K1 skews SCL
   edges, K2 skews SDA edges, both in 80 ns units. Each cell is computed in
   concrete mode on the cycle model's exact fire times, so it holds even where
   the waveform changes shape. O means the hardware itself raises ORDER or
   LATE. The chip's measured sweep must reproduce this grid. *)
let%expect_test "predicted shmoo over K1 (SCL) and K2 (SDA)" =
  let events, trace =
    C.Exec.run_traced
      ~pins:C.Firmware.i2c_pins
      ~fifo:C.Firmware.[ byte 0xA0; byte 0x00; byte 0x5A ]
      (C.Firmware.i2c_write ~bytes:3)
    |> Or_error.ok_exn
  in
  let ev = Array.of_list events in
  let letter = function
    | "t_HD_STA" -> 'A'
    | "t_LOW" -> 'L'
    | "t_HIGH" -> 'G'
    | "t_SU_STA" -> 'U'
    | "t_SU_DAT" -> 'S'
    | "t_HD_DAT" -> 'H'
    | "t_SU_STO" -> 'P'
    | "t_BUF" -> 'B'
    | _ -> '?'
  in
  let cell k1 k2 =
    let k = function 1 -> k1 | 2 -> k2 | _ -> 0 in
    let fired = C.Ontime.simulate ~lead:64 ~k events trace in
    if List.exists fired ~f:(fun f -> f.late)
    then 'O'
    else (
      let fires = List.map fired ~f:(fun f -> f.t, ev.(f.seq)) in
      match
        List.find
          (C.Check.concrete ~ns_per_cycle:20 Spec.I2c_standard_mode.spec fires)
          ~f:(fun c -> c.violations > 0)
      with
      | None -> '.'
      | Some c -> letter c.rule)
  in
  let ks = List.range ~stride:4 (-40) 41 in
  printf "K2\\K1 %s\n" (String.concat (List.map ks ~f:(fun k -> Printf.sprintf "%4d" k)));
  List.iter (List.rev ks) ~f:(fun k2 ->
    printf "%5d " k2;
    List.iter ks ~f:(fun k1 -> printf "   %c" (cell k1 k2));
    printf "\n");
  printf "\n. holds  A t_HD_STA  U t_SU_STA  H t_HD_DAT  P t_SU_STO  O hardware ORDER/LATE\n";
  [%expect {|
    K2\K1  -40 -36 -32 -28 -24 -20 -16 -12  -8  -4   0   4   8  12  16  20  24  28  32  36  40
       40    O   O   O   O   O   O   O   A   A   A   A   A   A   A   A   A   A   O   O   O   O
       36    O   O   O   O   O   O   A   A   A   A   A   A   A   A   A   A   A   O   O   O   O
       32    O   O   O   O   O   A   A   A   A   A   A   A   A   A   A   A   A   O   O   O   O
       28    O   O   O   O   A   A   A   A   A   A   A   A   A   A   A   A   .   O   O   O   O
       24    O   O   O   A   A   A   A   A   A   A   A   A   A   A   A   .   .   O   O   O   O
       20    O   O   O   A   A   A   A   A   A   A   A   A   A   A   .   .   .   O   O   O   O
       16    O   O   O   A   A   A   A   A   A   A   A   A   A   .   .   .   P   O   O   O   O
       12    O   O   O   A   A   A   A   A   A   A   A   A   .   .   .   P   O   O   O   O   O
        8    O   O   O   A   A   A   A   A   A   A   A   .   .   .   P   O   O   O   O   O   O
        4    O   O   O   A   A   A   A   A   A   A   .   .   .   P   O   O   O   O   O   O   O
        0    O   O   O   A   A   A   A   A   A   .   .   .   P   O   O   O   O   O   O   O   O
       -4    O   O   O   A   A   A   A   A   .   .   .   P   O   O   O   O   O   O   O   O   O
       -8    O   O   O   A   A   A   A   .   .   .   P   O   O   O   O   O   O   O   O   O   O
      -12    O   O   O   A   A   A   .   .   .   P   O   O   O   O   O   O   O   O   O   O   O
      -16    O   O   O   A   A   .   .   .   P   O   O   O   O   O   O   O   O   O   O   O   O
      -20    O   O   O   A   .   .   .   P   O   O   O   O   O   O   O   O   O   O   O   O   O
      -24    O   O   O   .   .   .   P   O   O   O   O   O   O   O   O   O   O   O   O   O   O
      -28    O   O   O   .   .   P   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O
      -32    O   O   O   .   P   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O
      -36    O   O   O   P   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O
      -40    O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O   O

    . holds  A t_HD_STA  U t_SU_STA  H t_HD_DAT  P t_SU_STO  O hardware ORDER/LATE |}]
;;

let%expect_test "the same spec compiled into timing-monitor slots" =
  List.iter Spec.I2c_standard_mode.spec.rules ~f:(fun r ->
    match C.Monitor.of_rule ~clk_hz:50_000_000 r with
    | Ok slot ->
      printf
        "%-9s min %s cycles\n"
        slot.rule
        (Option.value_map slot.min_cycles ~default:"-" ~f:Int.to_string)
    | Error e -> printf "%-9s rejected: %s\n" r.name (Error.to_string_hum e));
  [%expect {|
    t_HD_STA  min 199 cycles
    t_LOW     min 234 cycles
    t_HIGH    min 199 cycles
    t_SU_STA  min 234 cycles
    t_SU_DAT  min 11 cycles
    t_HD_DAT  min 0 cycles
    t_SU_STO  min 199 cycles
    t_BUF     min 234 cycles |}]
;;

let%expect_test "a program the checker cannot analyse is reported, not guessed" =
  let prog = Fipe_isa.Isa.[| Wait { pin = 0; pol = true; timeout = 0 } |] in
  (match C.Exec.run ~pins:C.Firmware.i2c_pins ~fifo:[] prog with
   | Ok _ -> print_endline "analysed"
   | Error e -> print_endline (Error.to_string_hum e));
  [%expect {|
    ("unsupported in checker v0" (here 0)
     (other (Wait (pin 0) (pol true) (timeout 0)))) |}]
;;

let%expect_test "on-time: how far ahead of its due time each event is queued" =
  let events, trace =
    C.Exec.run_traced
      ~pins:C.Firmware.i2c_pins
      ~fifo:C.Firmware.[ byte 0xA0; byte 0x00; byte 0x5A ]
      (C.Firmware.i2c_write ~bytes:3)
    |> Or_error.ok_exn
  in
  let r = C.Ontime.run ~lead:64 ~k:(fun _ -> 0) events trace in
  let late = List.count r.fired ~f:(fun f -> f.late) in
  (match C.Ontime.min_slack ~lead:64 ~k:(fun _ -> 0) events trace with
   | Some (i, s) ->
     printf
       "events %d, late %d, minimum slack %d cycles (event %d, pc %d)\n"
       (List.length events)
       late
       s
       i
       (List.nth_exn events i).pc
   | None -> print_endline "no events");
  [%expect {| events 91, late 0, minimum slack 58 cycles (event 1, pc 4) |}]
;;
