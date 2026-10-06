(* Writes the generated Verilog that the Tiny Tapeout template consumes. *)
open! Base
open Hardcaml

let () =
  let out = Stdio.Out_channel.create "src/fipe_event_queue.v" in
  Rtl.output ~output_mode:(Rtl.Output_mode.To_channel out) Verilog
    (Fipe_hw.Event_queue.circuit ());
  Stdio.Out_channel.close out;
  Stdio.print_endline "wrote src/fipe_event_queue.v"
;;
