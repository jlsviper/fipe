(* An IEEE 1149.1 TAP controller with an IDCODE register, at its pins. On each
   TCK rising edge it performs the current state's action (Capture-DR loads
   IDCODE; Shift-DR shifts toward TDO) and steps the state machine on TMS. TDO
   changes on the falling edge, and is driven only in Shift-DR. After
   Test-Logic-Reset the instruction register selects IDCODE. *)
open! Base

type state =
  | Tlr
  | Rti
  | Sel_dr
  | Cap_dr
  | Shift_dr
  | Exit1_dr
  | Pause_dr
  | Exit2_dr
  | Upd_dr
  | Sel_ir
  | Cap_ir
  | Shift_ir
  | Exit1_ir
  | Pause_ir
  | Exit2_ir
  | Upd_ir
[@@deriving sexp, equal]

let next s ~tms =
  match s, tms with
  | Tlr, true -> Tlr
  | Tlr, false -> Rti
  | Rti, true -> Sel_dr
  | Rti, false -> Rti
  | Sel_dr, true -> Sel_ir
  | Sel_dr, false -> Cap_dr
  | Cap_dr, true -> Exit1_dr
  | Cap_dr, false -> Shift_dr
  | Shift_dr, true -> Exit1_dr
  | Shift_dr, false -> Shift_dr
  | Exit1_dr, true -> Upd_dr
  | Exit1_dr, false -> Pause_dr
  | Pause_dr, true -> Exit2_dr
  | Pause_dr, false -> Pause_dr
  | Exit2_dr, true -> Upd_dr
  | Exit2_dr, false -> Shift_dr
  | Upd_dr, true -> Sel_dr
  | Upd_dr, false -> Rti
  | Sel_ir, true -> Tlr
  | Sel_ir, false -> Cap_ir
  | Cap_ir, true -> Exit1_ir
  | Cap_ir, false -> Shift_ir
  | Shift_ir, true -> Exit1_ir
  | Shift_ir, false -> Shift_ir
  | Exit1_ir, true -> Upd_ir
  | Exit1_ir, false -> Pause_ir
  | Pause_ir, true -> Exit2_ir
  | Pause_ir, false -> Pause_ir
  | Exit2_ir, true -> Upd_ir
  | Exit2_ir, false -> Shift_ir
  | Upd_ir, true -> Sel_dr
  | Upd_ir, false -> Rti
;;

type t =
  { idcode : int
  ; mutable state : state
  ; mutable dr : int
  ; mutable tck_prev : bool
  ; mutable tdo : bool option (* None: not driven *)
  ; mutable visited : state list (* newest first *)
  }

(* 0x4BA00477: an ARM CoreSight debug port *)
let create ?(idcode = 0x4BA00477) () =
  { idcode; state = Tlr; dr = 0; tck_prev = false; tdo = None; visited = [ Tlr ] }
;;

(* One cycle: bus levels in, TDO out (None = released). *)
let step d ~tck ~tms ~tdi =
  if tck && not d.tck_prev
  then (
    (match d.state with
     | Cap_dr -> d.dr <- d.idcode
     | Shift_dr -> d.dr <- (d.dr lsr 1) lor if tdi then 1 lsl 31 else 0
     | _ -> ());
    let s = next d.state ~tms in
    if not (equal_state s d.state) then d.visited <- s :: d.visited;
    d.state <- s);
  if (not tck) && d.tck_prev
  then d.tdo <- (if equal_state d.state Shift_dr then Some (d.dr land 1 = 1) else None);
  d.tck_prev <- tck;
  d.tdo
;;
