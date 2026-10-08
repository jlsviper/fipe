(* The chip as SPI master against the SPI device model, cycle by cycle, from
   the proven executor and on-time models (same timing rules as Bus). Checked
   against the RTL loopback before use. *)
open! Base
module C = Fipe_checker
module D = Fipe_model.Spi_device

type outcome =
  { samples : int list (* oldest first *)
  ; late : bool (* the chip could not generate this rate *)
  ; log : string list
  }

let run ?(params = D.typical) ?(tail = 400) ~program () =
  let events, trace =
    C.Exec.run_traced ~pins:C.Firmware.spi_pins ~fifo:C.Firmware.spi_read_id_fifo program
    |> Or_error.ok_exn
  in
  let ev = Array.of_list events in
  let fired = C.Ontime.simulate ~lead:64 ~k:(fun _ -> 0) events trace in
  let by_t = Hashtbl.create (module Int) in
  List.iter fired ~f:(fun f -> Hashtbl.add_multi by_t ~key:f.t ~data:f.seq);
  let last = List.fold fired ~init:0 ~f:(fun m f -> Int.max m f.t) in
  let dev = D.create params in
  let drv = Hashtbl.create (module String) in
  let level p =
    match Hashtbl.find drv p with
    | Some C.Exec.Drive0 -> false
    | _ -> true (* driven high, or released with a pull-up *)
  in
  let miso_drive = ref None in
  let miso_hist = Array.create ~len:(last + tail + 3) true in
  let samples = Queue.create () in
  for c = 1 to last + tail do
    let miso = Option.value !miso_drive ~default:true in
    miso_hist.(c) <- miso;
    List.iter (List.rev (Hashtbl.find_multi by_t c)) ~f:(fun seq ->
      let e = ev.(seq) in
      match e.value with
      | Sample ->
        let b = if c >= 3 then miso_hist.(c - 2) else true in
        Queue.enqueue samples (if b then 1 else 0)
      | v -> Hashtbl.set drv ~key:e.pin ~data:v);
    miso_drive := D.step dev ~cs:(level "CS") ~sclk:(level "SCLK") ~mosi:(level "MOSI")
  done;
  { samples = Queue.to_list samples
  ; late = List.exists fired ~f:(fun f -> f.late)
  ; log = List.rev dev.log
  }
;;

(* The 24-bit ID from the last 24 samples, if 32 were taken. *)
let id_of samples =
  if List.length samples < 32
  then None
  else
    Some
      (List.fold (List.drop samples (List.length samples - 24)) ~init:0 ~f:(fun a b ->
         (a lsl 1) lor b))
;;
