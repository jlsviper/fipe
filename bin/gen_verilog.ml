(* Writes the generated Verilog that the Tiny Tapeout template consumes.
   Run from the repo root: dune exec bin/gen_verilog.exe *)
open! Base
open Hardcaml

let write path circuit =
  let out = Stdio.Out_channel.create path in
  Rtl.output ~output_mode:(Rtl.Output_mode.To_channel out) Verilog circuit;
  Stdio.Out_channel.close out;
  Stdio.print_endline ("wrote " ^ path)
;;

let () =
  write "src/fipe_event_queue.v" (Fipe_hw.Event_queue.circuit ());
  write "src/fipe_core.v" (Fipe_hw.Core.circuit ())
;;
