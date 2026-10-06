(* Reference model of one event queue, cycle by cycle (spec v0.2, Timing model).

   Entries are already committed: {due; pin; value}. Nothing here knows about
   skews or the transmit path, because those were resolved at enqueue.

   This model is deliberately written in a different style from the RTL (an
   OCaml list rather than a ring buffer), so the two are independent
   implementations of the same contract. *)
open! Base

let time_bits = 24
let mask = (1 lsl time_bits) - 1
let half = 1 lsl (time_bits - 1)

(* Lead bound enforced by the sequencer. The queue double-checks it. *)
let window = 1 lsl (time_bits - 2)

(* Signed difference a - b modulo 2^24, in [-2^23, 2^23). *)
let sdiff a b =
  let d = (a - b) land mask in
  if d >= half then d - (1 lsl time_bits) else d
;;

module Value = struct
  let drive0 = 0
  let drive1 = 1
  let release = 2
end

type entry =
  { due : int
  ; pin : int
  ; value : int
  }
[@@deriving sexp, equal]

type t =
  { depth : int
  ; mutable q : entry list (* head first *)
  ; mutable last_due : int option
  }

let create ~depth = { depth; q = []; last_due = None }

type inputs =
  { t_now : int
  ; enq : entry option
  }

type fire =
  { pin : int
  ; value : int
  ; late : bool
  }
[@@deriving sexp, equal]

type outputs =
  { ready : bool
  ; fire0 : fire option
  ; fire1 : fire option
  ; order_err : bool
  ; window_err : bool
  ; count : int
  }
[@@deriving sexp, equal]

let is_due (e : entry) ~t_now = sdiff e.due t_now <= 0

(* Outputs depend on the state at the start of the cycle; the state update
   happens at the clock edge. This matches the RTL's timing exactly. *)
let step m { t_now; enq } =
  let ready = List.length m.q < m.depth in
  let fire_of (e : entry) = { pin = e.pin; value = e.value; late = sdiff e.due t_now < 0 } in
  let fire0, fire1, remaining =
    match m.q with
    | e0 :: e1 :: rest when is_due e0 ~t_now && is_due e1 ~t_now ->
      Some (fire_of e0), Some (fire_of e1), rest
    | e0 :: rest when is_due e0 ~t_now -> Some (fire_of e0), None, rest
    | q -> None, None, q
  in
  let accepted =
    match enq with
    | Some e when ready -> Some e
    | _ -> None
  in
  let order_err, window_err =
    match accepted with
    | None -> false, false
    | Some e ->
      let order =
        match m.last_due with
        | Some l -> sdiff e.due l < 0
        | None -> false
      in
      let d = sdiff e.due t_now in
      order, d >= window || d <= -window
  in
  let outputs = { ready; fire0; fire1; order_err; window_err; count = List.length m.q } in
  (match accepted with
   | Some e ->
     m.q <- remaining @ [ e ];
     m.last_due <- Some e.due
   | None -> m.q <- remaining);
  outputs
;;
