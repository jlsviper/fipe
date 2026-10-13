(* Core: timebase, program memory, two sequencers (A and B) with their event
   queues, and the pin drivers. This is the unit the end-to-end tests drive.

   The sequencers share the timebase and the program memory (each has its own
   read port and starts at its own entry address; B's port covers the upper 32
   words, addresses 32..63), so their events land on one time axis:
   concurrency without interleaving. If both fire on the same pin in
   the same cycle, A wins and CONFLICT is set (sticky until either starts).
   With B idle, the core behaves exactly as the single-sequencer core did.

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
    ; start : 'a (* start sequencer A *)
    ; start_b : 'a (* start sequencer B (both in one cycle: same time base) *)
    ; entry_a : 'a [@bits 6]
    ; entry_b : 'a [@bits 6]
    ; imem_we : 'a
    ; imem_addr : 'a [@bits 6]
    ; imem_data : 'a [@bits 16]
    ; fifo_valid : 'a
    ; fifo_data : 'a [@bits 32]
    ; fifo_b_valid : 'a
    ; fifo_b_data : 'a [@bits 32]
    ; cfg_data_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_clk_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_in_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_aux_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_b_data_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_b_clk_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_b_in_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_b_aux_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_k1 : 'a [@bits 8]
    ; cfg_k2 : 'a [@bits 8]
    ; cfg_k3 : 'a [@bits 8]
    ; pins_in : 'a [@bits n_pins] (* bus levels, asynchronous *)
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
    ; trapped : 'a (* A halted on an illegal or reserved instruction *)
    ; queue_count : 'a [@bits Event_queue.count_bits]
    ; fire0_valid : 'a
    ; fire0_pin : 'a [@bits Event_queue.pin_bits]
    ; fire0_value : 'a [@bits Event_queue.value_bits]
    ; fire1_valid : 'a
    ; fire1_pin : 'a [@bits Event_queue.pin_bits]
    ; fire1_value : 'a [@bits Event_queue.value_bits]
    ; sample_valid : 'a (* a sample event fired this cycle *)
    ; sample_bit : 'a (* the synchronized level it read *)
    ; late : 'a
    ; order_err : 'a
    ; window_err : 'a
    ; dbg_pc : 'a [@bits 6]
    ; dbg_running : 'a
    ; dbg_flag : 'a
    ; dbg_s : 'a [@bits Event_queue.time_bits]
    ; dbg_x : 'a [@bits 16]
    ; dbg_y : 'a [@bits 16]
    ; (* sequencer B *)
      fifo_b_ready : 'a
    ; halted_b : 'a
    ; trapped_b : 'a
    ; queue_count_b : 'a [@bits Event_queue.count_bits]
    ; fire0_b_valid : 'a
    ; fire0_b_pin : 'a [@bits Event_queue.pin_bits]
    ; fire0_b_value : 'a [@bits Event_queue.value_bits]
    ; fire1_b_valid : 'a
    ; fire1_b_pin : 'a [@bits Event_queue.pin_bits]
    ; fire1_b_value : 'a [@bits Event_queue.value_bits]
    ; sample_valid_b : 'a
    ; sample_bit_b : 'a
    ; late_b : 'a
    ; order_err_b : 'a
    ; window_err_b : 'a
    ; dbg_b_pc : 'a [@bits 6]
    ; dbg_b_running : 'a
    ; dbg_b_flag : 'a
    ; dbg_b_s : 'a [@bits Event_queue.time_bits]
    ; dbg_b_x : 'a [@bits 16]
    ; dbg_b_y : 'a [@bits 16]
    ; conflict : 'a (* A and B fired on the same pin in one cycle *)
    }
  [@@deriving sexp_of, hardcaml]
end

let create (i : _ I.t) : _ O.t =
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.clear () in
  let t_now = reg_fb spec ~width:Event_queue.time_bits ~f:(fun t -> t +:. 1) -- "timebase" in
  (* Program memory has no clear: the host loads a program before every start
     (state is lost when the design is deselected anyway), so clearing it would
     only cost a gate in front of each of its 1,024 flip-flops and a reset net
     reaching all of them. Unwritten words are undefined after power-up. *)
  let imem_spec = Reg_spec.create ~clock:i.clock () in
  let imem =
    List.init imem_words ~f:(fun k ->
      reg imem_spec ~enable:(i.imem_we &: (i.imem_addr ==:. k)) i.imem_data
      -- Printf.sprintf "imem_%02d" k)
  in
  (* synchronized inputs, shared by samples, WAIT and JMP Pin *)
  let sync_spec = Reg_spec.create ~clock:i.clock () in
  let synced = reg sync_spec (reg sync_spec i.pins_in -- "pins_sync1") -- "pins_sync" in
  (* no clear: see Host_spi *)
  (* One sequencer and its queue. The sequencer computes its next fetch address
     from registers (its instruction register, IR_PC, X, Y) and its start
     strobe, never from the fetched word, so feeding the word back is not a
     loop. Each sequencer has its own read port on the shared memory. *)
  let lane ~name ~upper_half ~start ~entry ~fifo_valid ~fifo_data ~data ~clk ~inp ~aux =
    let q_ready = wire 1 in
    let fetch_data = wire 16 in
    let seq =
      Sequencer.create
        ~name:("seq_" ^ name)
        { clock = i.clock
        ; clear = i.clear
        ; start
        ; entry
        ; t_now
        ; fetch_data
        ; q_ready
        ; fifo_valid
        ; fifo_data
        ; cfg_data_pin = data
        ; cfg_clk_pin = clk
        ; cfg_in_pin = inp
        ; cfg_aux_pin = aux
        ; cfg_k1 = i.cfg_k1
        ; cfg_k2 = i.cfg_k2
        ; cfg_k3 = i.cfg_k3
        ; pins_sync = synced
        }
    in
    (* B reads only the upper 32 words: half the read multiplexer and half the
       memory wiring of a full second port (the dual-sequencer layout was
       routing-limited). A reads all 64 words. *)
    (if upper_half
     then fetch_data <== mux (select seq.fetch_addr 4 0) (List.drop imem 32)
     else fetch_data <== mux seq.fetch_addr imem);
    let q =
      Event_queue.create
        ~name:("queue_" ^ name)
        { clock = i.clock
        ; clear = i.clear |: start
        ; t_now
        ; enq_valid = seq.enq_valid
        ; enq_due = seq.enq_due
        ; enq_pin = seq.enq_pin
        ; enq_value = seq.enq_value
        }
    in
    q_ready <== q.enq_ready;
    seq, q
  in
  let seq, q =
    lane
      ~name:"a"
      ~upper_half:false
      ~start:i.start
      ~entry:i.entry_a
      ~fifo_valid:i.fifo_valid
      ~fifo_data:i.fifo_data
      ~data:i.cfg_data_pin
      ~clk:i.cfg_clk_pin
      ~inp:i.cfg_in_pin
      ~aux:i.cfg_aux_pin
  in
  let seq_b, q_b =
    lane
      ~name:"b"
      ~upper_half:true
      ~start:i.start_b
      ~entry:(i.entry_b |: of_int ~width:6 32)
      ~fifo_valid:i.fifo_b_valid
      ~fifo_data:i.fifo_b_data
      ~data:i.cfg_b_data_pin
      ~clk:i.cfg_b_clk_pin
      ~inp:i.cfg_b_in_pin
      ~aux:i.cfg_b_aux_pin
  in
  (* pin drivers: B's fires first, then A's, so A wins a same-cycle conflict *)
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
      let out_q = reg spec out -- Printf.sprintf "pin%d_out" k
      and oe_q = reg spec oe -- Printf.sprintf "pin%d_oe" k in
      let st = out_q, oe_q in
      let st = apply ~valid:q_b.fire0_valid ~pin:q_b.fire0_pin ~value:q_b.fire0_value k st in
      let st = apply ~valid:q_b.fire1_valid ~pin:q_b.fire1_pin ~value:q_b.fire1_value k st in
      let st = apply ~valid:q.fire0_valid ~pin:q.fire0_pin ~value:q.fire0_value k st in
      let o1, e1 = apply ~valid:q.fire1_valid ~pin:q.fire1_pin ~value:q.fire1_value k st in
      out <== o1;
      oe <== e1;
      out_q, oe_q)
  in
  (* samples read the synchronized inputs (spec v0.2, input synchronization) *)
  let is_sample v = v ==:. Sequencer.Value.sample in
  let bit_at p = mux p (bits_lsb synced) in
  let sampled (q : _ Event_queue.O.t) =
    let s0 = q.fire0_valid &: is_sample q.fire0_value in
    let s1 = q.fire1_valid &: is_sample q.fire1_value in
    s0 |: s1, mux2 s0 (bit_at q.fire0_pin) (bit_at q.fire1_pin)
  in
  let sample_valid, sample_bit = sampled q in
  let sample_valid_b, sample_bit_b = sampled q_b in
  (* CONFLICT: A and B change the same pin in the same cycle *)
  let changes valid value = valid &: ~:(is_sample value) in
  let conflict_now =
    List.concat_map
      [ q.fire0_valid, q.fire0_pin, q.fire0_value; q.fire1_valid, q.fire1_pin, q.fire1_value ]
      ~f:(fun (va, pa, xa) ->
        List.map
          [ q_b.fire0_valid, q_b.fire0_pin, q_b.fire0_value
          ; q_b.fire1_valid, q_b.fire1_pin, q_b.fire1_value
          ]
          ~f:(fun (vb, pb, xb) -> changes va xa &: changes vb xb &: (pa ==: pb)))
    |> reduce ~f:( |: )
  in
  let sticky_on start x = reg_fb spec ~width:1 ~f:(fun q -> mux2 start gnd (q |: x)) in
  let sticky = sticky_on i.start in
  let sticky_b = sticky_on i.start_b in
  { t_now
  ; pins_out = concat_lsb (List.map pins ~f:fst)
  ; pins_oe = concat_lsb (List.map pins ~f:snd)
  ; fifo_ready = seq.fifo_ready
  ; halted = seq.halted
  ; trapped = seq.trapped
  ; queue_count = q.count
  ; fire0_valid = q.fire0_valid
  ; fire0_pin = q.fire0_pin
  ; fire0_value = q.fire0_value
  ; fire1_valid = q.fire1_valid
  ; fire1_pin = q.fire1_pin
  ; fire1_value = q.fire1_value
  ; sample_valid
  ; sample_bit
  ; late = sticky (q.fire0_late |: q.fire1_late)
  ; order_err = sticky q.order_err
  ; window_err = sticky q.window_err
  ; dbg_pc = seq.pc
  ; dbg_running = seq.running
  ; dbg_flag = seq.flag
  ; dbg_s = seq.s
  ; dbg_x = seq.x
  ; dbg_y = seq.y
  ; fifo_b_ready = seq_b.fifo_ready
  ; halted_b = seq_b.halted
  ; trapped_b = seq_b.trapped
  ; queue_count_b = q_b.count
  ; fire0_b_valid = q_b.fire0_valid
  ; fire0_b_pin = q_b.fire0_pin
  ; fire0_b_value = q_b.fire0_value
  ; fire1_b_valid = q_b.fire1_valid
  ; fire1_b_pin = q_b.fire1_pin
  ; fire1_b_value = q_b.fire1_value
  ; sample_valid_b
  ; sample_bit_b
  ; late_b = sticky_b (q_b.fire0_late |: q_b.fire1_late)
  ; order_err_b = sticky_b q_b.order_err
  ; window_err_b = sticky_b q_b.window_err
  ; dbg_b_pc = seq_b.pc
  ; dbg_b_running = seq_b.running
  ; dbg_b_flag = seq_b.flag
  ; dbg_b_s = seq_b.s
  ; dbg_b_x = seq_b.x
  ; dbg_b_y = seq_b.y
  ; conflict = sticky_on (i.start |: i.start_b) conflict_now
  }
;;

let circuit () =
  let module C = Circuit.With_interface (I) (O) in
  C.create_exn ~name:"fipe_core" create
;;
