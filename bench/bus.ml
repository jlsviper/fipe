(* A fast, cycle-level simulation of the chip on an I2C bus, built only from
   models already proven against the RTL: the executor gives the events, the
   on-time cycle model gives the exact fire cycles (late events included), and
   the EEPROM model is stepped once per cycle. Tests check it against the RTL
   loopback before it is trusted for large sweeps.

   Timing, matching the RTL core and loopback exactly:
   - an event fired in cycle t changes its pin from cycle t + 1;
   - a sample fired in cycle t reads the bus as it was in cycle t - 2 (the
     two-flop input synchronizer);
   - the device sees the bus in cycle t and its pull applies from cycle t + 1. *)
open! Base
module C = Fipe_checker
module E = Fipe_model.I2c_eeprom

type outcome =
  { samples : int list (* what the chip sampled, oldest first *)
  ; written : int option (* device memory at 0x00: ground truth *)
  ; flags : bool (* the chip would raise LATE or ORDER *)
  ; log : string list (* device log, oldest first *)
  }

let pins = C.Firmware.i2c_pins

let run ?(params = E.default) ?(tail = 2_000) ~program ~fifo ~k () =
  let events, trace = C.Exec.run_traced ~pins ~fifo program |> Or_error.ok_exn in
  let ev = Array.of_list events in
  let fired = C.Ontime.simulate ~lead:64 ~k events trace in
  let by_t = Hashtbl.create (module Int) in
  List.iter fired ~f:(fun f -> Hashtbl.add_multi by_t ~key:f.t ~data:f.seq);
  let last = List.fold fired ~init:0 ~f:(fun m f -> Int.max m f.t) in
  let dev = E.create params in
  let drv = Hashtbl.create (module String) in
  let driven_low p =
    match Hashtbl.find drv p with
    | Some C.Exec.Drive0 -> true
    | _ -> false
  in
  let pull = ref false in
  let sda_hist = Array.create ~len:(last + tail + 3) true in
  let samples = Queue.create () in
  for c = 1 to last + tail do
    let scl = not (driven_low "SCL") in
    let sda = (not (driven_low "SDA")) && not !pull in
    sda_hist.(c) <- sda;
    (* this cycle's fires: samples read the synchronized bus; outputs take
       effect next cycle, in queue order *)
    List.iter (List.rev (Hashtbl.find_multi by_t c)) ~f:(fun seq ->
      let e = ev.(seq) in
      match e.value with
      | Sample ->
        let b = if c >= 3 then sda_hist.(c - 2) else true in
        Queue.enqueue samples (if b then 1 else 0)
      | v -> Hashtbl.set drv ~key:e.pin ~data:v);
    pull := E.step dev ~scl ~sda
  done;
  { samples = Queue.to_list samples
  ; written = Hashtbl.find dev.memory 0x00
  ; flags = List.exists fired ~f:(fun f -> f.late)
  ; log = List.rev dev.log
  }
;;
