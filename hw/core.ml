(* Core: timebase, program memory, one sequencer, its event queue, and the pin
   drivers. This is the unit the end-to-end tests drive; the Tiny Tapeout top
   and the second sequencer wrap around it later.

   Pins: a fired event drives 0, drives 1, or releases (output enable off).
   If two events fire on the same pin in one cycle, the later one in queue
   order wins. Sample events are reported to the testbench; ISR comes with the
   receive path. Fault flags are sticky until the next start. *)
open! Base
open Hardcaml
open Signal

let n_pins = 8
let imem_words = 64

module I = struct
  type 'a t =
    { clock : 'a
    ; clear : 'a
    ; start : 'a
    ; imem_we : 'a
    ; imem_addr : 'a [@bits 6]
    ; imem_data : 'a [@bits 16]
    ; fifo_valid : 'a
    ; fifo_data : 'a [@bits 32]
    ; cfg_data_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_clk_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_k1 : 'a [@bits 8]
    ; cfg_k2 : 'a [@bits 8]
    ; cfg_k3 : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { t_now : 'a [@bits Event_queue.time_bits]
    ; pins_out : 'a [@bits n_pins]
    ; pins_oe : 'a [@bits n_pins]
    ; fifo_ready : 'a
    ; halted : 'a
    ; queue_count : 'a [@bits Event_queue.count_bits]
    ; fire0_valid : 'a
    ; fire0_pin : 'a [@bits Event_queue.pin_bits]
    ; fire0_value : 'a [@bits Event_queue.value_bits]
    ; fire1_valid : 'a
    ; fire1_pin : 'a [@bits Event_queue.pin_bits]
    ; fire1_value : 'a [@bits Event_queue.value_bits]
    ; late : 'a
    ; order_err : 'a
    ; window_err : 'a
    }
  [@@deriving sexp_of, hardcaml]
end

let create (i : _ I.t) : _ O.t =
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.clear () in
  let t_now = reg_fb spec ~width:Event_queue.time_bits ~f:(fun t -> t +:. 1) in
  let imem =
    List.init imem_words ~f:(fun k ->
      reg spec ~enable:(i.imem_we &: (i.imem_addr ==:. k)) i.imem_data)
  in
  let q_ready = wire 1 in
  (* The pc comes straight from a register, so feeding the fetched instruction
     back into the sequencer is not a combinational loop. *)
  let instr = wire 16 in
  let seq =
    Sequencer.create
      { clock = i.clock
      ; clear = i.clear
      ; start = i.start
      ; t_now
      ; instr
      ; q_ready
      ; fifo_valid = i.fifo_valid
      ; fifo_data = i.fifo_data
      ; cfg_data_pin = i.cfg_data_pin
      ; cfg_clk_pin = i.cfg_clk_pin
      ; cfg_k1 = i.cfg_k1
      ; cfg_k2 = i.cfg_k2
      ; cfg_k3 = i.cfg_k3
      }
  in
  instr <== mux seq.pc imem;
  let q =
    Event_queue.create
      { clock = i.clock
      ; clear = i.clear |: i.start
      ; t_now
      ; enq_valid = seq.enq_valid
      ; enq_due = seq.enq_due
      ; enq_pin = seq.enq_pin
      ; enq_value = seq.enq_value
      }
  in
  q_ready <== q.enq_ready;
  (* pin drivers *)
  let apply ~valid ~pin ~value k (out, oe) =
    let hit = valid &: (pin ==:. k) in
    let is v = value ==:. v in
    let drive = is Sequencer.Value.drive0 |: is Sequencer.Value.drive1 in
    ( mux2 (hit &: drive) (is Sequencer.Value.drive1) out
    , mux2 (hit &: (drive |: is Sequencer.Value.release)) drive oe )
  in
  let pins =
    List.init n_pins ~f:(fun k ->
      let out = wire 1 and oe = wire 1 in
      let out_q = reg spec out and oe_q = reg spec oe in
      let o0, e0 =
        apply ~valid:q.fire0_valid ~pin:q.fire0_pin ~value:q.fire0_value k (out_q, oe_q)
      in
      let o1, e1 = apply ~valid:q.fire1_valid ~pin:q.fire1_pin ~value:q.fire1_value k (o0, e0) in
      out <== o1;
      oe <== e1;
      out_q, oe_q)
  in
  let sticky x = reg_fb spec ~width:1 ~f:(fun q -> mux2 i.start gnd (q |: x)) in
  { t_now
  ; pins_out = concat_lsb (List.map pins ~f:fst)
  ; pins_oe = concat_lsb (List.map pins ~f:snd)
  ; fifo_ready = seq.fifo_ready
  ; halted = seq.halted
  ; queue_count = q.count
  ; fire0_valid = q.fire0_valid
  ; fire0_pin = q.fire0_pin
  ; fire0_value = q.fire0_value
  ; fire1_valid = q.fire1_valid
  ; fire1_pin = q.fire1_pin
  ; fire1_value = q.fire1_value
  ; late = sticky (q.fire0_late |: q.fire1_late)
  ; order_err = sticky q.order_err
  ; window_err = sticky q.window_err
  }
;;

let circuit () =
  let module C = Circuit.With_interface (I) (O) in
  C.create_exn ~name:"fipe_core" create
;;
