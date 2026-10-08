(* Characterization the way industry does it, on the RTL-validated bench. *)
open! Base
open Stdio
module Ch = Fipe_bench.Characterize
module E = Fipe_model.I2c_eeprom
module Spec = Fipe_spec.Protocol_spec

let knob rule = List.find_exn Ch.knobs ~f:(fun k -> String.equal k.rule rule)

(* A part with a faulty deglitch filter: SDA edges 65 to 105 cycles after SCL
   falls are taken as START. Sweeping K2 upward delays SDA (longer data hold,
   shorter setup), so the part fails in a band, then works again, then fails
   for real when setup runs out. *)
let%expect_test "a non-monotonic failure: binary search misses it, the full sweep finds it" =
  let params = { E.default with deglitch_window = Some (65, 105) } in
  let kn = knob "t_SU_DAT" in
  let pass = Ch.passes ~params kn in
  printf "binary search: %s\n" (Sexp.to_string (Ch.sexp_of_result (Ch.binary pass ~vmax:kn.vmax)));
  let sweep = Ch.full pass ~vmax:kn.vmax in
  printf
    "full sweep, K2 = 0..%d:\n  %s\n"
    kn.vmax
    (String.init (Array.length sweep) ~f:(fun i -> if sweep.(i) then '.' else 'X'));
  List.iter (Ch.holes sweep) ~f:(fun (a, b) ->
    printf
      "HOLE at K2 = %d..%d: data hold %d..%d ns (setup still %d ns or more)\n"
      a
      b
      (Ch.interval_ns ~rule:"t_HD_DAT" kn a)
      (Ch.interval_ns ~rule:"t_HD_DAT" kn b)
      (Ch.interval_ns ~rule:"t_SU_DAT" kn b));
  [%expect {|
    binary search: (Boundary 50 51)
    full sweep, K2 = 0..52:
      ..........XXXXXXXXXXX..............................XX
    HOLE at K2 = 10..20: data hold 1600..2400 ns (setup still 2560 ns or more) |}]
;;

(* 30 parts with realistic spread plus one outlier (a part with a 600 ns input
   filter, as a different die or a counterfeit might have). Each rule's
   requirement is measured per part by binary search on the chip's own ACK
   bits; the hidden truth is checked against every bracket. *)
let%expect_test "population characterization: 31 parts" =
  let rand = Random.State.make [| 2026 |] in
  let parts =
    List.init 30 ~f:(fun _ -> Ch.sample_part rand)
    @ [ { E.default with scl_fall_delay = 30 } ]
  in
  (* what each part really needs at the pins, in cycles *)
  let truth (p : E.params) = function
    | "t_HD_STA" -> p.hd_sta_min - p.scl_fall_delay
    | "t_SU_STO" -> p.su_sto_min
    | "t_HD_DAT" -> p.scl_fall_delay
    | "t_SU_DAT" -> p.su_dat_min
    | _ -> 0
  in
  printf
    "%-9s %7s %8s %9s %10s %15s  %s\n"
    "rule"
    "spec"
    "median"
    "sigma"
    "6s limit"
    "range"
    "outliers";
  let contained = ref 0 and total = ref 0 in
  List.iter Ch.knobs ~f:(fun kn ->
    let measured =
      List.filter_mapi parts ~f:(fun i params ->
        Option.map (Ch.measure ~params kn) ~f:(fun m ->
          Int.incr total;
          let t = truth params kn.rule * Ch.ns_per_cycle in
          if m.fail_ns < t && t <= m.pass_ns then Int.incr contained;
          i, Float.of_int (m.fail_ns + m.pass_ns) /. 2.))
    in
    let s = Ch.stats ~step_ns:80 measured in
    let spec =
      (List.find_exn Spec.I2c_standard_mode.spec.rules ~f:(fun r -> String.equal r.name kn.rule))
        .min_ns
      |> Option.value ~default:0
    in
    printf
      "%-9s %4d ns %5.0f ns %4.0f ns%s %7.0f ns %6.0f..%-6.0f  %s\n"
      kn.rule
      spec
      s.med
      s.sigma
      (if s.sigma_floored then "*" else " ")
      (s.med +. (6. *. s.sigma))
      s.lo
      s.hi
      (match s.outliers with
       | [] -> "-"
       | l -> String.concat ~sep:", " (List.map l ~f:(fun i -> Printf.sprintf "part %d" i))));
  printf
    "\n* spread below the 80 ns measurement step; sigma floored at step/sqrt(12)\n\
     hidden truth inside the measured bracket: %d of %d measurements\n"
    !contained
    !total;
  [%expect {|
    rule         spec   median     sigma   6s limit           range  outliers
    t_HD_STA  4000 ns   840 ns  237 ns     2263 ns    520..1160    -
    t_SU_STO  4000 ns  1000 ns  119 ns     1712 ns    760..1240    -
    t_HD_DAT     0 ns   280 ns   23 ns*     419 ns    200..600     part 30
    t_SU_DAT   250 ns   120 ns   23 ns*     259 ns     40..200     -

    * spread below the 80 ns measurement step; sigma floored at step/sqrt(12)
    hidden truth inside the measured bracket: 124 of 124 measurements |}]
;;
