open! Base
open Stdio
module Isa = Fipe_isa.Isa
module T = Fipe_asm.Text

(* Every legal instruction word, as a one-instruction program at address 0,
   disassembles to text that assembles back to exactly the same word. *)
let%expect_test "assembler and disassembler are exact inverses on every legal word" =
  let checked = ref 0 and bad = ref 0 in
  for w = 0 to 0xFFFF do
    match Isa.decode w with
    | None -> ()
    | Some i ->
      Int.incr checked;
      let text = T.disassemble [| i |] in
      (match T.assemble text with
       | Ok [| j |] when Isa.encode j = w -> ()
       | r ->
         Int.incr bad;
         if !bad <= 3
         then print_s [%message "MISMATCH" (w : int) text (r : (Isa.t array, string) Result.t)])
  done;
  printf "%d legal words round-trip, %d mismatches\n" !checked !bad;
  [%expect {| 12110 legal words round-trip, 0 mismatches |}]
;;

let%expect_test "a small program, and helpful errors" =
  let src =
    {|
      .equ  BIT, 52            ; constants
      set   coder, opendrain
      set   prescale, x4
      set   k1, -5
loop: evt   10, data, shift
      evt   BIT, clk, release, k1
      wait  in, low, x
      jmp   x--, loop
      halt
|}
  in
  (match T.assemble src with
   | Ok p -> print_string (T.disassemble p)
   | Error e -> print_endline e);
  List.iter
    [ "evt 64, data, drive0"; "evt 1, data, wiggle"; "jmp nowhere"; "set x, 300"; "wait in, sideways" ]
    ~f:(fun bad -> printf "%-24s -> %s\n" bad (Result.error (T.assemble bad) |> Option.value ~default:"ok"));
  [%expect {|
            set   coder, nrz|opendrain   ;  0: 5508
            set   prescale, x4           ;  1: 5701
            set   k1, -5                 ;  2: 52fb
    l3:     evt   10, data, shift        ;  3: 1284
            evt   52, clk, release, k1   ;  4: 1d2a
            wait  in, low, x             ;  5: 3040
            jmp   x--, l3                ;  6: 4103
            halt                         ;  7: 4007
    evt 64, data, drive0     -> line 1: dt 64 out of range 0..63
    evt 1, data, wiggle      -> line 1: unknown action "wiggle" (expected one of: drive0 drive1 release toggle shift sample aux0 aux1)
    jmp nowhere              -> line 1: undefined label "nowhere"
    set x, 300               -> line 1: immediate 300 out of range 0..255
    wait in, sideways        -> line 1: wait level must be low or high, not "sideways" |}]
;;

(* The example programs are what a reader sees; each must assemble to exactly
   the words of the verified firmware it documents. *)
let%expect_test "every example assembles to its verified firmware, word for word" =
  let module F = Fipe_checker.Firmware in
  let rise =
    Isa.
      [| Set { dst = Coder_mode; imm = Coder_mode.open_drain }
       ; Evt { dt = 0; clk_pin = false; cls = 0; act = Drive0 }
       ; Dly { dt = 100 }
       ; Evt { dt = 0; clk_pin = false; cls = 0; act = Release }
       ; Evt { dt = 0; clk_pin = false; cls = 3; act = Sample }
       ; Jmp { cond = Always; addr = 5 }
      |]
  in
  List.iter
    [ "i2c_eeprom_write", F.i2c_write_and_poll ~start_stop_cls:3 ~bytes:3 ()
    ; "spi_read_id", F.spi_read_id ~mode:0 ~half:10
    ; "spi_read_id_late", F.spi_read_id_sampled ~half:10 ~offset:10
    ; "uart_echo", F.uart_echo ~tx_bit:434 ~rx_bit:434 ~bytes:2
    ; "rise_time", rise
    ]
    ~f:(fun (name, expected) ->
      let src = In_channel.read_all ("../examples/" ^ name ^ ".s") in
      match T.assemble src with
      | Error e -> printf "%-18s ERROR %s\n" name e
      | Ok p ->
        printf
          "%-18s %2d words  %s\n"
          name
          (Array.length p)
          (if Array.equal Isa.equal p expected then "identical to firmware" else "DIFFERS"));
  [%expect {|
    i2c_eeprom_write   39 words  identical to firmware
    spi_read_id        16 words  identical to firmware
    spi_read_id_late   17 words  identical to firmware
    uart_echo          22 words  identical to firmware
    rise_time           6 words  identical to firmware |}]
;;
