(* Writes the Verilog the Tiny Tapeout flow builds: src/<top>.v.
   With --components, also writes each block to build/ for area studies.
   With --formal, writes the blocks the formal proofs in formal/ need.
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
  write ("src/" ^ Fipe_hw.Tt_top.name ^ ".v") (Fipe_hw.Tt_top.circuit ());
  (* the register map, generated from the same table the top level decodes *)
  Stdio.Out_channel.write_all "docs/registers.md" ~data:(Fipe_hw.Regmap.markdown ());
  if Array.exists (Sys.get_argv ()) ~f:(String.equal "--components")
  then (
    ignore (Stdlib.Sys.command "mkdir -p build" : int);
    write "build/fipe_event_queue.v" (Fipe_hw.Event_queue.circuit ());
    write "build/fipe_core.v" (Fipe_hw.Core.circuit ());
    write "build/fipe_monitors.v" (Fipe_hw.Monitors.circuit ()));
  if Array.exists (Sys.get_argv ()) ~f:(String.equal "--formal")
  then (
    ignore (Stdlib.Sys.command "mkdir -p build" : int);
    write "build/fipe_event_queue_formal.v" (Fipe_hw.Event_queue.circuit_formal ());
    write "build/fipe_core.v" (Fipe_hw.Core.circuit ()))
;;
