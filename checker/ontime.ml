(* The on-time check: a cycle model of the sequencer issuing instructions and
   the event queue firing them.

   ORDER is necessary but not sufficient for exact timing. An event can also
   fire late because the sequencer fell behind: too many instructions between
   events, or the queue was full when the event needed to enter. This model
   replays the executor's trace one instruction per cycle, with the queue's
   depth and its two fires per cycle, and reports exactly when each event fires.

   It is a second, independent model of the hardware's timing, so the RTL tests
   compare against it cycle for cycle, including runs where events are late.

   Time 0 is the cycle in which the sequencer is started. Assumes host data is
   always ready for PULL. *)
open! Base

type fired =
  { t : int
  ; seq : int
  ; late : bool
  }
[@@deriving sexp]

let depth = 4

type result =
  { fired : fired list
  ; enq_t : int array (* cycle each event entered the queue *)
  ; due : int array
  }

let run ?(lead = 64) ?(limit = 50_000_000) ~k (events : Exec.event list) trace =
  let ev = Array.of_list events in
  let enq_t = Array.create ~len:(Array.length ev) (-1) in
  let due i = lead + ev.(i).cyc + (k ev.(i).cls * ev.(i).scale) in
  let q = Queue.create () in
  let trace = ref trace in
  let fired = Queue.create () in
  let t = ref 1 in
  while (not (List.is_empty !trace && Queue.is_empty q)) && !t < limit do
    let count_at_start = Queue.length q in
    (* fire: up to two from the head, in order *)
    let rec fire n =
      if n < 2
      then (
        match Queue.peek q with
        | Some i when due i <= !t ->
          ignore (Queue.dequeue_exn q : int);
          Queue.enqueue fired { t = !t; seq = i; late = due i < !t };
          fire (n + 1)
        | _ -> ())
    in
    fire 0;
    (* issue: one instruction per cycle; EVT waits while the queue is full *)
    (match !trace with
     | Exec.Evt_step i :: rest ->
       if count_at_start < depth
       then (
         Queue.enqueue q i;
         enq_t.(i) <- !t;
         trace := rest)
     | Plain :: rest -> trace := rest
     | [] -> ());
    Int.incr t
  done;
  { fired = Queue.to_list fired; enq_t; due = Array.init (Array.length ev) ~f:due }
;;

let simulate ?lead ?limit ~k events trace = (run ?lead ?limit ~k events trace).fired

(* Slack of each event: cycles between entering the queue and the last cycle
   it could have entered and still fire on time. Negative means late. *)
let min_slack ?lead ~k events trace =
  let r = run ?lead ~k events trace in
  Array.mapi r.due ~f:(fun i d -> i, d - r.enq_t.(i) - 1)
  |> Array.min_elt ~compare:(fun (_, a) (_, b) -> Int.compare a b)
;;
