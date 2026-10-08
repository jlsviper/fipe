(* Characterization strategies on the simulated bench.

   - Binary search: fast, but assumes a part fails monotonically as a timing
     is squeezed. A part that works at 25 MHz and fails at 19 MHz (a real case
     reported by a former Maxim IC design lead) breaks that assumption.
   - Full sweep: every step, so failure holes show up; slower.
   - Population: many parts with realistic spread, reporting median, robust
     sigma, a suggested limit at k sigma, and outlier parts, following the
     ATE characterization practice (few hundred parts, 6-7 sigma limits). *)
open! Base
module C = Fipe_checker
module Spec = Fipe_spec.Protocol_spec
module E = Fipe_model.I2c_eeprom

let program = C.Firmware.i2c_write_and_poll ~start_stop_cls:3 ~bytes:3 ()
let fifo = C.Firmware.[ byte 0xA0; byte 0x00; byte 0x5A; byte 0xA0 ]
let good = [ 0; 0; 0; 1 ] (* three ACKs, then the busy NACK proving the write *)
let ns_per_cycle = 20

(* One knob direction isolates one rule (see Firmware.i2c_write). [vmax] is the
   largest value inside the hardware ORDER bound. *)
type knob =
  { rule : string
  ; kvec : int -> int * int * int
  ; vmax : int
  }

let knobs =
  [ { rule = "t_HD_STA"; kvec = (fun v -> 0, 0, v); vmax = 55 }
  ; { rule = "t_SU_STO"; kvec = (fun v -> 0, 0, -v); vmax = 55 }
  ; { rule = "t_HD_DAT"; kvec = (fun v -> 0, -v, 0); vmax = 10 }
  ; { rule = "t_SU_DAT"; kvec = (fun v -> 0, v, 0); vmax = 52 }
  ]
;;

let kfun (k1, k2, k3) = function
  | 1 -> k1
  | 2 -> k2
  | 3 -> k3
  | _ -> 0
;;

(* What the chip observes: did the part pass at this knob value? *)
let passes ?params kn v =
  let o = Bus.run ?params ~program ~fifo ~k:(kfun (kn.kvec v)) () in
  (not o.flags) && List.equal Int.equal o.samples good
;;

(* A rule's tightest interval on the wire at a knob value, in ns. Taken from
   the checker's symbolic findings: each knob moves its rule linearly, one
   80 ns step per unit. The concrete matcher is not used here, because at the
   last step of a sweep two edges can land in the same cycle, and the concrete
   matcher then re-pairs them (the PATTERN ambiguity), which would turn a 0 ns
   separation into a whole bit period. *)
let timing = { C.Check.clk_hz = 50_000_000; prescale = 4 }
let unit_ns = C.Check.unit_ns timing

let events, trace =
  C.Exec.run_traced ~pins:C.Firmware.i2c_pins ~fifo program |> Or_error.ok_exn
;;

let findings = C.Check.check ~timing Spec.I2c_standard_mode.spec events

let interval_ns ~rule kn v =
  let k = kfun (kn.kvec v) in
  let r =
    List.find_exn Spec.I2c_standard_mode.spec.rules ~f:(fun (r : Spec.rule) ->
      String.equal r.name rule)
  in
  let min_u = C.Check.ceil_div (Option.value r.min_ns ~default:0) unit_ns in
  List.filter_map findings ~f:(fun (f : C.Check.finding) ->
    if String.equal f.name rule
    then Option.map f.lo ~f:(fun lo -> min_u - lo + C.Check.Knob.eval f.knob ~k)
    else None)
  |> List.min_elt ~compare:Int.compare
  |> Option.value_exn
  |> fun units -> units * unit_ns
;;

type result =
  | Fails_at_nominal
  | Never_fails
  | Boundary of int * int (* last passing value, first failing value *)
[@@deriving sexp]

(* Binary search between a passing 0 and a failing vmax. *)
let binary pass ~vmax =
  if not (pass 0)
  then Fails_at_nominal
  else if pass vmax
  then Never_fails
  else (
    let rec go lo hi =
      if hi - lo <= 1
      then Boundary (lo, hi)
      else (
        let mid = (lo + hi) / 2 in
        if pass mid then go mid hi else go lo mid)
    in
    go 0 vmax)
;;

(* Every step from 0 to vmax. *)
let full pass ~vmax = Array.init (vmax + 1) ~f:pass

(* Failing runs that are followed by a later pass: the holes binary search
   cannot see. *)
let holes (sweep : bool array) =
  let n = Array.length sweep in
  let last_pass = ref (-1) in
  Array.iteri sweep ~f:(fun i p -> if p then last_pass := i);
  let rec go i acc =
    if i >= n
    then List.rev acc
    else if sweep.(i)
    then go (i + 1) acc
    else (
      let j = ref i in
      while !j + 1 < n && not sweep.(!j + 1) do
        Int.incr j
      done;
      let acc = if !j < !last_pass then (i, !j) :: acc else acc in
      go (!j + 1) acc)
  in
  go 0 []
;;

(* --- population ------------------------------------------------------- *)

let gaussian rand ~mean ~sd =
  let u1 = Float.max 1e-12 (Random.State.float rand 1.) and u2 = Random.State.float rand 1. in
  mean +. (sd *. Float.sqrt (-2. *. Float.log u1) *. Float.cos (2. *. Float.pi *. u2))
;;

(* A part's hidden parameters: nominal values with realistic spread. *)
let sample_part rand =
  let g ~mean ~sd ~min =
    Int.max min (Float.iround_nearest_exn (gaussian rand ~mean ~sd))
  in
  { E.default with
    scl_fall_delay = g ~mean:15. ~sd:2. ~min:1
  ; su_dat_min = g ~mean:5. ~sd:1. ~min:1
  ; hd_sta_min = g ~mean:60. ~sd:8. ~min:1
  ; su_sto_min = g ~mean:50. ~sd:8. ~min:1
  }
;;

(* One part's measured requirement for one rule: the bracket in ns,
   (fail, pass]. Its midpoint is the estimate. *)
type measured =
  { fail_ns : int
  ; pass_ns : int
  }

let measure ~params kn =
  match binary (passes ~params kn) ~vmax:kn.vmax with
  | Boundary (lo, hi) ->
    Some { fail_ns = interval_ns ~rule:kn.rule kn hi; pass_ns = interval_ns ~rule:kn.rule kn lo }
  | Fails_at_nominal | Never_fails -> None
;;

let median xs =
  let a = List.sort xs ~compare:Float.compare |> Array.of_list in
  let n = Array.length a in
  if n = 0 then Float.nan else if n % 2 = 1 then a.(n / 2) else (a.((n / 2) - 1) +. a.(n / 2)) /. 2.
;;

type stats =
  { n : int
  ; med : float
  ; sigma : float (* robust: 1.4826 * MAD, floored at the quantization noise *)
  ; sigma_floored : bool
  ; lo : float
  ; hi : float
  ; outliers : int list (* part indices more than 6 sigma from the median *)
  }

(* The measurement grid is one knob step (80 ns here); a uniform quantization
   error has sigma = step / sqrt 12, so spreads below that are not resolvable. *)
let stats ~step_ns (xs : (int * float) list) =
  let vals = List.map xs ~f:snd in
  let med = median vals in
  let mad = median (List.map vals ~f:(fun x -> Float.abs (x -. med))) in
  let raw = 1.4826 *. mad in
  let floor = Float.of_int step_ns /. Float.sqrt 12. in
  let sigma = Float.max raw floor in
  { n = List.length xs
  ; med
  ; sigma
  ; sigma_floored = Float.( < ) raw floor
  ; lo = List.fold vals ~init:Float.infinity ~f:Float.min
  ; hi = List.fold vals ~init:Float.neg_infinity ~f:Float.max
  ; outliers =
      List.filter_map xs ~f:(fun (i, x) ->
        if Float.( > ) (Float.abs (x -. med)) (6. *. sigma) then Some i else None)
  }
;;
