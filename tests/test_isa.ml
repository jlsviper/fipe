open! Base
open Stdio
module Isa = Fipe_isa.Isa

(* Exhaustive over all 2^16 words: every word that decodes re-encodes to itself. *)
let%expect_test "decode/encode round-trip over every 16-bit word" =
  let legal = ref 0 in
  for w = 0 to 0xFFFF do
    match Isa.decode w with
    | None -> ()
    | Some i ->
      Int.incr legal;
      if Isa.encode i <> w then print_s [%message "mismatch" (w : int) (i : Isa.t)]
  done;
  printf "legal encodings: %d of 65536\n" !legal;
  [%expect {| legal encodings: 12110 of 65536 |}]
;;

let%expect_test "a few instructions" =
  List.iter
    Isa.
      [ Evt { dt = 10; clk_pin = true; cls = 1; act = Drive1 }
      ; Evt { dt = 0; clk_pin = false; cls = 0; act = Shift_out }
      ; Dly { dt = 4095 }
      ; Jmp { cond = X_dec_nz; addr = 63 }
      ; Set { dst = K2; imm = 0xF9 }
      ]
    ~f:(fun i -> printf "%04x  %s\n" (Isa.encode i) (Sexp.to_string (Isa.sexp_of_t i)));
  [%expect {|
    12a9  (Evt(dt 10)(clk_pin true)(cls 1)(act Drive1))
    1004  (Evt(dt 0)(clk_pin false)(cls 0)(act Shift_out))
    2fff  (Dly(dt 4095))
    413f  (Jmp(cond X_dec_nz)(addr 63))
    53f9  (Set(dst K2)(imm 249)) |}]
;;

(* The sequencer's trap check against the ISA, on every 16-bit word. *)
let%expect_test "hardware executable check = decode + implemented, all 65,536 words" =
  let open Hardcaml in
  let w = Signal.input "w" 16 in
  let circuit =
    Circuit.create_exn ~name:"exec_check" [ Signal.output "ok" (Fipe_hw.Sequencer.executable w) ]
  in
  let sim = Cyclesim.create circuit in
  let inp = Cyclesim.in_port sim "w" and out = Cyclesim.out_port sim "ok" in
  let agree = ref 0 and executable = ref 0 and reserved = ref 0 and illegal = ref 0 in
  for word = 0 to 0xFFFF do
    inp := Bits.of_int ~width:16 word;
    Cyclesim.cycle sim;
    let hw = Bits.to_bool !out in
    let sw =
      match Isa.decode word with
      | Some i when Isa.implemented i -> true
      | Some _ ->
        Int.incr reserved;
        false
      | None ->
        Int.incr illegal;
        false
    in
    if Bool.equal hw sw then Int.incr agree else printf "DISAGREE at 0x%04x (hardware %b)\n" word hw;
    if sw then Int.incr executable
  done;
  printf
    "%d of 65536 words agree. %d execute, %d are legal but reserved (trap), %d are illegal (trap)\n"
    !agree
    !executable
    !reserved
    !illegal;
  [%expect {| 65536 of 65536 words agree. 10842 execute, 1268 are legal but reserved (trap), 53426 are illegal (trap) |}]
;;
