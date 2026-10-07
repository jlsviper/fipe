(* Runs one sequencer program and records every event it would enqueue.

   Data is concrete (the bytes come from [fifo]); only the skews K1 to K3 stay
   symbolic. That works because of spec v0.2: an event's due time is
   S + K_cls, where S is a plain integer that never includes skew. So the
   checker records S and the class, and reasons about K later.

   Checker v0 handles the instructions a timed transmit program needs:
   EVT, DLY, SET (X, Y, coder mode), JMP (always, X--, Y--), PULL, NOP.
   Anything else is reported as unsupported rather than guessed. *)
open! Base
module Isa = Fipe_isa.Isa

type value =
  | Drive0
  | Drive1
  | Release
  | Sample
[@@deriving sexp, equal]

type event =
  { seq : int (* enqueue order, which is also queue order *)
  ; s : int (* schedule time in dt units, without skew *)
  ; cyc : int (* the same schedule time in clock cycles, honouring prescale changes *)
  ; scale : int (* prescale in force at enqueue; K is multiplied by it *)
  ; cls : int (* skew class; K0 = 0 *)
  ; pin : string
  ; value : value
  ; pc : int
  }
[@@deriving sexp]

(* One entry per executed instruction, in order: either the EVT that enqueued
   event [seq], or any other instruction. The on-time check replays this
   against a cycle model of the sequencer and queue. *)
type step =
  | Evt_step of int
  | Plain
[@@deriving sexp]

type pins =
  { data_pin : string
  ; clk_pin : string
  }

let bit_31 = 1 lsl 31
let mask32 = (1 lsl 32) - 1

let run_traced ?(max_steps = 100_000) ~pins ~fifo (program : Isa.t array) =
  let open Or_error.Let_syntax in
  let pc = ref 0
  and x = ref 0
  and y = ref 0
  and s = ref 0
  and cyc = ref 0
  and scale = ref 1
  and osr = ref 0
  and coder = ref 0
  and fifo = ref fifo
  and steps = ref 0
  and events = Queue.create ()
  and trace = Queue.create ()
  and level = Hashtbl.create (module String) in
  let committed pin = Hashtbl.find level pin |> Option.value ~default:Release in
  let emit ~cls ~pin value =
    (match value with
     | Sample -> ()
     | v -> Hashtbl.set level ~key:pin ~data:v);
    Queue.enqueue
      events
      { seq = Queue.length events; s = !s; cyc = !cyc; scale = !scale; cls; pin; value; pc = !pc }
  in
  let open_drain () = !coder land Isa.Coder_mode.open_drain <> 0 in
  let high () = if open_drain () then Release else Drive1 in
  let rec loop () =
    if !pc >= Array.length program
    then Ok ()
    else if !steps >= max_steps
    then Or_error.error_s [%message "step limit reached; unbounded loop?" (max_steps : int)]
    else (
      Int.incr steps;
      let here = !pc in
      pc := here + 1;
      let n_before = Queue.length events in
      let%bind () =
        match program.(here) with
        | Nop -> Ok ()
        | Evt { dt; clk_pin; cls; act } ->
          s := !s + dt;
          cyc := !cyc + (dt * !scale);
          let pin = if clk_pin then pins.clk_pin else pins.data_pin in
          pc := here;
          let value =
            match act with
            | Drive0 -> Drive0
            | Drive1 -> Drive1
            | Release -> Release
            | Sample -> Sample
            | Toggle ->
              (* flips the last committed level, never the live pin (spec v0.2) *)
              (match committed pin with
               | Drive0 -> high ()
               | _ -> Drive0)
            | Shift_out ->
              let bit = !osr land bit_31 <> 0 in
              osr := (!osr lsl 1) land mask32;
              let bit = Bool.( <> ) bit (!coder land Isa.Coder_mode.invert <> 0) in
              if bit then high () else Drive0
          in
          emit ~cls ~pin value;
          pc := here + 1;
          Ok ()
        | Dly { dt } ->
          s := !s + dt;
          cyc := !cyc + (dt * !scale);
          Ok ()
        | Set { dst = X; imm } ->
          x := imm;
          Ok ()
        | Set { dst = Y; imm } ->
          y := imm;
          Ok ()
        | Set { dst = Coder_mode; imm } ->
          coder := imm;
          Ok ()
        | Set { dst = Prescale; imm } ->
          scale := 1 lsl (2 * (imm land 3));
          Ok ()
        | Set { dst = K1 | K2 | K3 | Pin_dir; _ } -> Ok ()
        | Jmp { cond = Always; addr } when addr = here ->
          (* JMP to itself halts, in the executor and in the RTL *)
          pc := Array.length program;
          Ok ()
        | Jmp { cond = Always; addr } ->
          pc := addr;
          Ok ()
        | Jmp { cond = X_dec_nz; addr } ->
          if !x <> 0
          then (
            Int.decr x;
            pc := addr);
          Ok ()
        | Jmp { cond = Y_dec_nz; addr } ->
          if !y <> 0
          then (
            Int.decr y;
            pc := addr);
          Ok ()
        | Pull _ ->
          (match !fifo with
           | w :: rest ->
             osr := w land mask32;
             fifo := rest;
             Ok ()
           | [] -> Or_error.error_s [%message "PULL with empty host FIFO" (here : int)])
        | other ->
          Or_error.error_s [%message "unsupported in checker v0" (here : int) (other : Isa.t)]
      in
      Queue.enqueue
        trace
        (if Queue.length events > n_before then Evt_step n_before else Plain);
      loop ())
  in
  let%map () = loop () in
  Queue.to_list events, Queue.to_list trace
;;

let run ?max_steps ~pins ~fifo program =
  Or_error.map (run_traced ?max_steps ~pins ~fifo program) ~f:fst
;;
