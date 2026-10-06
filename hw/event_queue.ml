(* One event queue (spec v0.2, Timing model).

   Entries arrive fully committed: {due; pin; value}. The skew was added and the
   transmit path ran at enqueue, so this block only stores, compares and fires.

   - Up to two events fire per cycle, so simultaneous edges cost nothing.
   - An event fires when [due - t_now <= 0] in signed 24-bit arithmetic. That is
     only meaningful while |due - t_now| < 2^23; the sequencer keeps every event
     within 2^22 of T, and [window_err] double-checks it here.
   - [late] marks a fired event whose due time had already passed.
   - [order_err] marks an enqueue whose due time is earlier than the previously
     enqueued one (the order invariant). *)
open! Base
open Hardcaml
open Signal

let time_bits = 24
let depth = 4
let pin_bits = 3
let value_bits = 2
let ptr_bits = 2
let count_bits = 3
let entry_bits = time_bits + pin_bits + value_bits

module I = struct
  type 'a t =
    { clock : 'a
    ; clear : 'a
    ; t_now : 'a [@bits time_bits]
    ; enq_valid : 'a
    ; enq_due : 'a [@bits time_bits]
    ; enq_pin : 'a [@bits pin_bits]
    ; enq_value : 'a [@bits value_bits]
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { enq_ready : 'a
    ; fire0_valid : 'a
    ; fire0_pin : 'a [@bits pin_bits]
    ; fire0_value : 'a [@bits value_bits]
    ; fire0_late : 'a
    ; fire1_valid : 'a
    ; fire1_pin : 'a [@bits pin_bits]
    ; fire1_value : 'a [@bits value_bits]
    ; fire1_late : 'a
    ; order_err : 'a
    ; window_err : 'a
    ; count : 'a [@bits count_bits]
    }
  [@@deriving sexp_of, hardcaml]
end

let due_of e = select e (entry_bits - 1) (pin_bits + value_bits)
let pin_of e = select e (pin_bits + value_bits - 1) value_bits
let value_of e = select e (value_bits - 1) 0

let create (i : _ I.t) : _ O.t =
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.clear () in
  let open Always in
  let entries = Array.init depth ~f:(fun _ -> Variable.reg spec ~width:entry_bits) in
  let rp = Variable.reg spec ~width:ptr_bits in
  let wp = Variable.reg spec ~width:ptr_bits in
  let count = Variable.reg spec ~width:count_bits in
  let last_due = Variable.reg spec ~width:time_bits in
  let last_valid = Variable.reg spec ~width:1 in
  let entry_at idx = mux idx (Array.to_list entries |> List.map ~f:(fun v -> v.value)) in
  let e0 = entry_at rp.value in
  let e1 = entry_at (rp.value +:. 1) in
  let diff e = due_of e -: i.t_now in
  let is_due e = msb (diff e) |: (diff e ==:. 0) in
  let is_late e = msb (diff e) in
  let fire0 = count.value >:. 0 &: is_due e0 in
  let fire1 = fire0 &: (count.value >:. 1) &: is_due e1 in
  let n_fire = uresize fire0 count_bits +: uresize fire1 count_bits in
  let enq_ready = count.value <:. depth in
  let accept = i.enq_valid &: enq_ready in
  let order_err = accept &: last_valid.value &: msb (i.enq_due -: last_due.value) in
  (* |d| < 2^22 in signed 24-bit iff bits 23 and 22 agree, except d = -2^22. *)
  let d = i.enq_due -: i.t_now in
  let window_err =
    accept
    &: (bit d (time_bits - 1) ^: bit d (time_bits - 2) |: (d ==:. 3 lsl (time_bits - 2)))
  in
  let packed = concat_msb [ i.enq_due; i.enq_pin; i.enq_value ] in
  compile
    [ rp <-- rp.value +: uresize n_fire ptr_bits
    ; count <-- count.value +: uresize accept count_bits -: n_fire
    ; when_
        accept
        ([ wp <-- wp.value +:. 1; last_due <-- i.enq_due; last_valid <-- vdd ]
         @ List.init depth ~f:(fun k ->
           when_ (wp.value ==:. k) [ entries.(k) <-- packed ]))
    ];
  { enq_ready
  ; fire0_valid = fire0
  ; fire0_pin = pin_of e0
  ; fire0_value = value_of e0
  ; fire0_late = fire0 &: is_late e0
  ; fire1_valid = fire1
  ; fire1_pin = pin_of e1
  ; fire1_value = value_of e1
  ; fire1_late = fire1 &: is_late e1
  ; order_err
  ; window_err
  ; count = count.value
  }
;;

let circuit () =
  let module C = Circuit.With_interface (I) (O) in
  C.create_exn ~name:"fipe_event_queue" create
;;
