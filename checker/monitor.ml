(* Compiles spec rules into timing-monitor slot configurations: the second
   place the same spec is enforced, this time on the device's side of the wire.

   A slot arms on an edge matching [start], then requires an edge matching
   [stop] within [min_cycles, max_cycles], measured on synchronized inputs. A
   slot can only express what the hardware can compare, so a rule that needs
   more than one qualifier pin is rejected rather than approximated. *)
open! Base
module Spec = Fipe_spec.Protocol_spec

type trigger =
  { pin : string
  ; edge : Spec.edge
  ; qual : (string * bool) option (* (pin, required level) *)
  }
[@@deriving sexp]

type slot =
  { rule : string
  ; start : trigger
  ; stop : trigger
  ; abort : trigger option
  ; min_cycles : int option
  ; max_cycles : int option
  }
[@@deriving sexp]

let trigger (t : Spec.trigger) =
  match t.while_high, t.while_low with
  | Some _, Some _ ->
    Or_error.error_s [%message "two qualifier pins; a slot supports one" (t : Spec.trigger)]
  | Some p, None -> Ok { pin = t.pin; edge = t.edge; qual = Some (p, true) }
  | None, Some p -> Ok { pin = t.pin; edge = t.edge; qual = Some (p, false) }
  | None, None -> Ok { pin = t.pin; edge = t.edge; qual = None }
;;

(* Synchronizer latency is the same for every input (spec v0.2), so it cancels
   out of a start-to-stop interval; one cycle of observation uncertainty
   remains. Bounds are rounded in the device's favour: the monitor only flags
   what is certainly a violation. *)
let of_rule ~clk_hz (r : Spec.rule) =
  let open Or_error.Let_syntax in
  let ns_per_cycle = 1_000_000_000 / clk_hz in
  let%bind start = trigger r.from_ in
  let%bind stop = trigger r.to_ in
  let%map abort =
    match r.abort with
    | None -> Ok None
    | Some a -> trigger a >>| Option.some
  in
  { rule = r.name
  ; start
  ; stop
  ; abort
  ; min_cycles = Option.map r.min_ns ~f:(fun n -> Int.max 0 ((n / ns_per_cycle) - 1))
  ; max_cycles = Option.map r.max_ns ~f:(fun n -> (n + ns_per_cycle - 1) / ns_per_cycle + 1)
  }
;;
