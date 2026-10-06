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
  [%expect {| legal encodings: 10614 of 65536 |}]
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
