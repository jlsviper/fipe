(* One I2C EEPROM write trial per input line, on the fast bus simulator
   (proven cycle-exact against the RTL): FIPE's write-and-poll firmware, with
   skews k1 k2 k3, against the EEPROM model with the given parameters. For
   experiment runners that drive simulated parts (fipe-bench's simulation
   backend).

   Input, one line per trial, integers separated by spaces:
     k1 k2 k3 su_dat_min hd_sta_min su_sto_min scl_fall_delay t_vd_ack t_hd_ack
   (device parameters in 50 MHz cycles, as Fipe_model.I2c_eeprom.params).
   Output, one line per trial:
     pass acks written flags t_SU_DAT t_HD_DAT t_HD_STA t_SU_STO
   pass 1/0; acks the sampled ACK bits (e.g. 0001: three ACKs, then the busy
   NACK that proves the write started); written the byte the device stored at
   0x00 (-1 if none: ground truth); flags 1 if FIPE would raise LATE or ORDER;
   then each rule's tightest interval on the wire, in ns.

     dune exec bin/trial.exe < trials.txt *)
open! Base
open Stdio
module B = Fipe_bench
module C = Fipe_checker
module E = Fipe_model.I2c_eeprom

let rules = [ "t_SU_DAT"; "t_HD_DAT"; "t_HD_STA"; "t_SU_STO" ]

let interval_ns ~rule (k1, k2, k3) =
  let k = B.Characterize.kfun (k1, k2, k3) in
  let r =
    List.find_exn Fipe_spec.Protocol_spec.I2c_standard_mode.spec.rules ~f:(fun (r : Fipe_spec.Protocol_spec.rule) ->
      String.equal r.name rule)
  in
  let unit_ns = B.Characterize.unit_ns in
  let min_u = C.Check.ceil_div (Option.value r.min_ns ~default:0) unit_ns in
  List.filter_map B.Characterize.findings ~f:(fun (f : C.Check.finding) ->
    if String.equal f.name rule
    then Option.map f.lo ~f:(fun lo -> min_u - lo + C.Check.Knob.eval f.knob ~k)
    else None)
  |> List.min_elt ~compare:Int.compare
  |> Option.value_map ~default:(-1) ~f:(fun u -> u * unit_ns)
;;

let () =
  In_channel.iter_lines In_channel.stdin ~f:(fun line ->
    match String.split line ~on:' ' |> List.filter ~f:(Fn.non String.is_empty) |> List.map ~f:Int.of_string with
    | [ k1; k2; k3; su_dat_min; hd_sta_min; su_sto_min; scl_fall_delay; t_vd_ack; t_hd_ack ] ->
      let params =
        { E.default with su_dat_min; hd_sta_min; su_sto_min; scl_fall_delay; t_vd_ack; t_hd_ack }
      in
      let o =
        B.Bus.run ~params ~program:B.Characterize.program ~fifo:B.Characterize.fifo
          ~k:(B.Characterize.kfun (k1, k2, k3)) ()
      in
      let pass = (not o.flags) && List.equal Int.equal o.samples B.Characterize.good in
      printf
        "%d %s %d %d %s\n%!"
        (Bool.to_int pass)
        (String.concat (List.map o.samples ~f:Int.to_string))
        (Option.value o.written ~default:(-1))
        (Bool.to_int o.flags)
        (String.concat ~sep:" " (List.map rules ~f:(fun rule -> Int.to_string (interval_ns ~rule (k1, k2, k3)))))
    | _ -> printf "error: expected 9 integers\n%!")
;;
