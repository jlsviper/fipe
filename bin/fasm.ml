(* fasm: the FIPE assembler and disassembler.

     dune exec bin/fasm.exe -- asm  PROGRAM.s [-o PROGRAM.hex]   assemble to a hex image
     dune exec bin/fasm.exe -- dis  PROGRAM.hex                  disassemble a hex image
     dune exec bin/fasm.exe -- list PROGRAM.s                    assemble, show the listing
     dune exec bin/fasm.exe -- labels PROGRAM.s                  label addresses (entry points)

   The hex image has one 16-bit instruction word per line, for the host
   loader (registers 0x00..0x3F over SPI). *)
open! Base
open Stdio
module T = Fipe_asm.Text

let read path = In_channel.read_all path

let () =
  match List.tl_exn (Array.to_list (Sys.get_argv ())) with
  | [ "asm"; src ] | [ "asm"; src; "-o"; _ ] as args ->
    (match T.assemble (read src) with
     | Error e ->
       eprintf "%s: %s\n" src e;
       Stdlib.exit 1
     | Ok p ->
       let hex = T.to_hex p in
       (match args with
        | [ _; _; "-o"; out ] ->
          Out_channel.write_all out ~data:hex;
          printf "%s: %d instructions -> %s\n" src (Array.length p) out
        | _ -> print_string hex))
  | [ "dis"; hex ] -> print_string (T.disassemble (T.of_hex (read hex)))
  | [ "labels"; src ] ->
    (match T.assemble_with_labels (read src) with
     | Error e ->
       eprintf "%s: %s\n" src e;
       Stdlib.exit 1
     | Ok (_, labels) -> List.iter labels ~f:(fun (l, a) -> printf "%-12s %d\n" l a))
  | [ "list"; src ] ->
    (match T.assemble (read src) with
     | Error e ->
       eprintf "%s: %s\n" src e;
       Stdlib.exit 1
     | Ok p -> print_string (T.disassemble p))
  | _ ->
    eprintf "usage: fasm asm FILE.s [-o FILE.hex] | dis FILE.hex | list FILE.s\n";
    Stdlib.exit 2
;;
