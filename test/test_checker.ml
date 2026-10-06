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
    ORDER     >= 0         29  K2 - K1 >= -10             ok, margin 10 (800 ns) |}]
;;

(* The predicted shmoo: which rule breaks first at each (K1, K2). K1 skews SCL
   edges, K2 skews SDA edges, both in 80 ns units. The real chip will sweep the
   same grid against a real EEPROM; this is what the checker says it must see. *)
let%expect_test "predicted shmoo over K1 (SCL) and K2 (SDA)" =
  let fs = findings () in
  let code (f : C.Check.finding) =
    match f.name with
    | "t_HD_DAT" -> 'H'
    | "t_SU_DAT" -> 'S'
    | "ORDER" -> 'O'
    | "t_SU_STO" -> 'P'
    | "t_HD_STA" -> 'A'
    | "t_LOW" -> 'L'
    | _ -> '?'
  in
  let ks = List.range ~stride:4 (-40) 41 in
  printf "K2\\K1 %s\n" (String.concat (List.map ks ~f:(fun k -> Printf.sprintf "%4d" k)));
  List.iter (List.rev ks) ~f:(fun k2 ->
    printf "%5d " k2;
    List.iter ks ~f:(fun k1 ->
      let k = function 1 -> k1 | 2 -> k2 | _ -> 0 in
      let fail =
        List.find fs ~f:(fun f -> not (C.Check.holds_at f (C.Check.Knob.eval f.knob ~k)))
      in
      printf "   %c" (match fail with None -> '.' | Some f -> code f));
    printf "\n");
  printf "\n. holds  H t_HD_DAT  S t_SU_DAT  A t_HD_STA  P t_SU_STO  L t_LOW  O hardware ORDER\n";
  [%expect {|
    K2\K1  -40 -36 -32 -28 -24 -20 -16 -12  -8  -4   0   4   8  12  16  20  24  28  32  36  40
       40    A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   O   O
       36    A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   O   O   O
       32    A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   O   O   O   P
       28    A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   .   O   O   P   H
       24    A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   .   .   O   P   H   H
       20    A   A   A   A   A   A   A   A   A   A   A   A   A   A   .   .   .   P   H   H   H
       16    A   A   A   A   A   A   A   A   A   A   A   A   A   .   .   .   P   H   H   H   H
       12    A   A   A   A   A   A   A   A   A   A   A   A   .   .   .   P   H   H   H   H   H
        8    A   A   A   A   A   A   A   A   A   A   A   .   .   .   P   H   H   H   H   H   H
        4    A   A   A   A   A   A   A   A   A   A   .   .   .   P   H   H   H   H   H   H   H
        0    A   A   A   A   A   A   A   A   A   .   .   .   P   H   H   H   H   H   H   H   H
       -4    A   A   A   A   A   A   A   A   .   .   .   P   H   H   H   H   H   H   H   H   H
       -8    A   A   A   A   A   A   A   .   .   .   P   H   H   H   H   H   H   H   H   H   H
      -12    A   A   A   A   A   A   .   .   .   P   H   H   H   H   H   H   H   H   H   H   H
      -16    A   A   A   A   A   .   .   .   P   H   H   H   H   H   H   H   H   H   H   H   H
      -20    A   A   A   A   .   .   .   P   H   H   H   H   H   H   H   H   H   H   H   H   H
      -24    A   A   A   .   .   .   P   H   H   H   H   H   H   H   H   H   H   H   H   H   H
      -28    A   A   O   .   .   P   H   H   H   H   H   H   H   H   H   H   H   H   H   H   H
      -32    A   O   O   .   P   H   H   H   H   H   H   H   H   H   H   H   H   H   H   H   H
      -36    O   O   O   P   H   H   H   H   H   H   H   H   H   H   H   H   H   H   H   H   H
      -40    O   O   P   H   H   H   H   H   H   H   H   H   H   H   H   H   H   H   H   H   H

    . holds  H t_HD_DAT  S t_SU_DAT  A t_HD_STA  P t_SU_STO  L t_LOW  O hardware ORDER |}]
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
