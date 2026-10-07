(* Checks an event stream against a protocol spec, with the skews symbolic.

   Every rule instance relates two events a and b. Their separation is
     (s_b - s_a) + K_cls(b) - K_cls(a)
   so a rule [min <= separation <= max] becomes a range on one knob expression,
   K_cls(b) - K_cls(a). Same class: the knobs cancel and the rule either always
   holds or always fails. The checker intersects the ranges over all instances
   of a rule, and reports the knob range where the rule holds.

   The same machinery checks the hardware order invariant (spec v0.2): adjacent
   queued events must satisfy due(i+1) >= due(i).

   Edges are identified on the nominal timeline (all K = 0). Pins are
   open-drain-aware: Release reads as high. *)
open! Base
module Spec = Fipe_spec.Protocol_spec

type timing =
  { clk_hz : int
  ; prescale : int
  }

let unit_ns t = t.prescale * 1_000_000_000 / t.clk_hz
let ceil_div a b = if a >= 0 then (a + b - 1) / b else -(-a / b)
let floor_div a b = if a >= 0 then a / b else -((-a + b - 1) / b)

(* A knob expression K_b - K_a, normalized. K0 is the constant 0. *)
module Knob = struct
  type t =
    { plus : int (* class, 0 = none *)
    ; minus : int
    }
  [@@deriving sexp, compare, equal, hash]

  let make ~b ~a = if b = a then { plus = 0; minus = 0 } else { plus = b; minus = a }
  let is_const t = t.plus = 0 && t.minus = 0

  let to_string t =
    match t.plus, t.minus with
    | 0, 0 -> "(no knob)"
    | p, 0 -> Printf.sprintf "K%d" p
    | 0, m -> Printf.sprintf "-K%d" m
    | p, m -> Printf.sprintf "K%d - K%d" p m
  ;;

  let eval t ~k = k t.plus - k t.minus
end

type level =
  | High
  | Low
[@@deriving equal]

let level_of : Exec.value -> level option = function
  | Drive0 -> Some Low
  | Drive1 | Release -> Some High
  | Sample -> None
;;

type edge =
  { ev : Exec.event
  ; pin : string
  ; rising : bool
  ; before : (string, level) Hashtbl.t (* levels of all pins just before this edge *)
  }

let edges_of (events : Exec.event list) =
  let nominal =
    List.stable_sort events ~compare:(fun (a : Exec.event) b ->
      match Int.compare a.s b.s with
      | 0 -> Int.compare a.seq b.seq
      | c -> c)
  in
  let cur = Hashtbl.create (module String) in
  let get p = Hashtbl.find cur p |> Option.value ~default:High in
  List.filter_map nominal ~f:(fun (ev : Exec.event) ->
    match level_of ev.value with
    | None -> None
    | Some l ->
      let old = get ev.pin in
      if equal_level old l
      then None
      else (
        let before = Hashtbl.copy cur in
        Hashtbl.set cur ~key:ev.pin ~data:l;
        Some { ev; pin = ev.pin; rising = equal_level l High; before }))
;;

let matches (t : Spec.trigger) e =
  let lvl p = Hashtbl.find e.before p |> Option.value ~default:High in
  String.equal t.pin e.pin
  && (match t.edge with
    | Any -> true
    | Rise -> e.rising
    | Fall -> not e.rising)
  && Option.for_all t.while_high ~f:(fun p -> equal_level (lvl p) High)
  && Option.for_all t.while_low ~f:(fun p -> equal_level (lvl p) Low)
;;

(* For each edge matching [from_], the next edge matching [to_], unless [abort]
   matches first. *)
let instances (r : Spec.rule) edges =
  let rec next = function
    | [] -> None
    | e :: rest ->
      if matches r.to_ e
      then Some e
      else if Option.exists r.abort ~f:(fun a -> matches a e)
      then None
      else next rest
  in
  let rec go acc = function
    | [] -> List.rev acc
    | e :: rest ->
      let acc =
        if matches r.from_ e
        then (
          match next rest with
          | Some b -> (e, b) :: acc
          | None -> acc)
        else acc
      in
      go acc rest
  in
  go [] edges
;;

type finding =
  { name : string
  ; descr : string
  ; bound : string
  ; knob : Knob.t
  ; instances : int
  ; lo : int option (* knob range where the rule holds, in dt units *)
  ; hi : int option
  }

let holds_at f v =
  Option.for_all f.lo ~f:(fun lo -> v >= lo) && Option.for_all f.hi ~f:(fun hi -> v <= hi)
;;

let nominal_ok f = holds_at f 0

(* Merge per-instance ranges into one finding per (rule, knob). *)
let collect ~name ~descr ~bound pairs =
  let tbl = Hashtbl.create (module Knob) in
  List.iter pairs ~f:(fun (knob, lo, hi) ->
    Hashtbl.update tbl knob ~f:(function
      | None -> 1, lo, hi
      | Some (n, lo', hi') ->
        ( n + 1
        , Option.merge lo lo' ~f:Int.max
        , Option.merge hi hi' ~f:Int.min )));
  Hashtbl.to_alist tbl
  |> List.sort ~compare:(fun (a, _) (b, _) -> Knob.compare a b)
  |> List.map ~f:(fun (knob, (instances, lo, hi)) ->
    { name; descr; bound; knob; instances; lo; hi })
;;

let check_rule ~timing (r : Spec.rule) edges =
  let u = unit_ns timing in
  let min_u = Option.map r.min_ns ~f:(fun n -> ceil_div n u) in
  let max_u = Option.map r.max_ns ~f:(fun n -> floor_div n u) in
  let pairs =
    instances r edges
    |> List.map ~f:(fun (a, b) ->
      let ds = b.ev.s - a.ev.s in
      let knob = Knob.make ~b:b.ev.cls ~a:a.ev.cls in
      knob, Option.map min_u ~f:(fun m -> m - ds), Option.map max_u ~f:(fun m -> m - ds))
  in
  let bound =
    match r.min_ns, r.max_ns with
    | Some lo, Some hi -> Printf.sprintf "%d..%d ns" lo hi
    | Some lo, None -> Printf.sprintf ">= %d ns" lo
    | None, Some hi -> Printf.sprintf "<= %d ns" hi
    | None, None -> "any"
  in
  collect ~name:r.name ~descr:r.descr ~bound pairs
;;

(* Hardware order invariant: due(i+1) - due(i) >= 0 for adjacent queued events. *)
let check_order (events : Exec.event list) =
  let rec pairs acc = function
    | a :: (b :: _ as rest) ->
      let a : Exec.event = a in
      let b : Exec.event = b in
      pairs ((Knob.make ~b:b.cls ~a:a.cls, Some (a.s - b.s), None) :: acc) rest
    | _ -> acc
  in
  collect
    ~name:"ORDER"
    ~descr:"hardware: queued events stay in time order"
    ~bound:">= 0"
    (pairs [] events)
;;

(* The symbolic ranges assume the waveform keeps its nominal shape: edges on
   different pins neither meet nor swap. Two edges in the same cycle are
   ambiguous on the wire (is SDA moving while SCL is high, or after it fell?),
   so adjacent edges on different pins must stay at least one dt unit apart.
   Outside this region the symbolic answer is not trusted; [concrete] is. *)
let check_pattern edges =
  let rec pairs acc = function
    | a :: (b :: _ as rest) ->
      let acc =
        if String.equal a.pin b.pin || a.ev.s = b.ev.s
        then acc
        else (Knob.make ~b:b.ev.cls ~a:a.ev.cls, Some (1 - (b.ev.s - a.ev.s)), None) :: acc
      in
      pairs acc rest
    | _ -> acc
  in
  collect
    ~name:"PATTERN"
    ~descr:"waveform keeps its shape: edges on different pins never meet or swap"
    ~bound:">= 1 unit"
    (pairs [] edges)
;;

let check ~timing (spec : Spec.t) events =
  let edges = edges_of events in
  List.concat_map spec.rules ~f:(fun r -> check_rule ~timing r edges)
  @ check_order events
  @ check_pattern edges
;;

(* Concrete mode: the exact waveform at given fire times, with hardware
   semantics. Edges in the same cycle form one group; a qualifier reads the
   levels before that cycle; within a group, a rule's stop is checked before
   its abort, then a new start arms it (as the monitor slots do). This is the
   ground truth the symbolic ranges are checked against. *)
type concrete =
  { rule : string
  ; instances : int
  ; violations : int
  ; min_sep : int option (* cycles *)
  ; max_sep : int option
  }
[@@deriving sexp]

let concrete ~ns_per_cycle (spec : Spec.t) (fires : (int * Exec.event) list) =
  let levels = Hashtbl.create (module String) in
  let get h p = Hashtbl.find h p |> Option.value ~default:High in
  let groups =
    List.group fires ~break:(fun (t1, _) (t2, _) -> t1 <> t2)
    |> List.filter_map ~f:(fun group ->
      let t = fst (List.hd_exn group) in
      let before = Hashtbl.copy levels in
      List.iter group ~f:(fun (_, (e : Exec.event)) ->
        Option.iter (level_of e.value) ~f:(fun l -> Hashtbl.set levels ~key:e.pin ~data:l));
      let edges =
        Hashtbl.to_alist levels
        |> List.filter_map ~f:(fun (pin, l) ->
          if equal_level (get before pin) l
          then None
          else
            Some
              { ev = snd (List.hd_exn group)
              ; pin
              ; rising = equal_level l High
              ; before
              })
      in
      if List.is_empty edges then None else Some (t, edges))
  in
  List.map spec.rules ~f:(fun (r : Spec.rule) ->
    let any trig edges = List.exists edges ~f:(matches trig) in
    let keep_first = Option.is_some r.max_ns && Option.is_none r.min_ns in
    let armed = ref None in
    let seps = ref [] in
    List.iter groups ~f:(fun (t, edges) ->
      (match !armed with
       | Some t0 when any r.to_ edges ->
         seps := (t - t0) :: !seps;
         armed := None
       | Some _ when Option.exists r.abort ~f:(fun a -> any a edges) -> armed := None
       | _ -> ());
      if any r.from_ edges && not (keep_first && Option.is_some !armed)
      then armed := Some t);
    let bad sep =
      let ns = sep * ns_per_cycle in
      Option.exists r.min_ns ~f:(fun m -> ns < m) || Option.exists r.max_ns ~f:(fun m -> ns > m)
    in
    { rule = r.name
    ; instances = List.length !seps
    ; violations = List.count !seps ~f:bad
    ; min_sep = List.min_elt !seps ~compare:Int.compare
    ; max_sep = List.max_elt !seps ~compare:Int.compare
    })
;;

let range_to_string f =
  let k = Knob.to_string f.knob in
  if Knob.is_const f.knob
  then if nominal_ok f then "always holds" else "ALWAYS FAILS"
  else (
    match f.lo, f.hi with
    | None, None -> "always holds"
    | Some lo, None -> Printf.sprintf "%s >= %d" k lo
    | None, Some hi -> Printf.sprintf "%s <= %d" k hi
    | Some lo, Some hi when lo > hi -> "NEVER HOLDS"
    | Some lo, Some hi -> Printf.sprintf "%d <= %s <= %d" lo k hi)
;;

(* Margin at K = 0, in dt units, against the nearest bound. *)
let margin f =
  let d =
    List.filter_opt
      [ Option.map f.lo ~f:(fun lo -> 0 - lo); Option.map f.hi ~f:(fun hi -> hi - 0) ]
  in
  List.min_elt d ~compare:Int.compare
;;

let report ~timing findings =
  let u = unit_ns timing in
  let b = Buffer.create 1024 in
  Printf.bprintf
    b
    "dt unit = %d ns (clock %d MHz, prescale x%d)\n"
    u
    (timing.clk_hz / 1_000_000)
    timing.prescale;
  Printf.bprintf b "%-9s %-10s %4s  %-26s %s\n" "rule" "bound" "n" "holds when" "nominal";
  List.iter findings ~f:(fun f ->
    let nominal =
      match margin f with
      | None -> "ok"
      | Some m when m >= 0 -> Printf.sprintf "ok, margin %d (%d ns)" m (m * u)
      | Some m -> Printf.sprintf "FAILS by %d (%d ns)" (-m) (-m * u)
    in
    Printf.bprintf
      b
      "%-9s %-10s %4d  %-26s %s\n"
      f.name
      f.bound
      f.instances
      (range_to_string f)
      nominal);
  Buffer.contents b
;;
