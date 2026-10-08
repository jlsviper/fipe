(* The ISA, defined once. The assembler, the reference model, the timing checker
   and the Hardcaml decoder all use this module, so they cannot disagree about
   what a bit pattern means. Encodings follow spec v0.2, section "Sequencer ISA". *)
open! Base

(* Helper for small enums whose encoding is their position in a fixed list. *)
module Indexed (X : sig
    type t [@@deriving equal]

    val all_in_order : t list
  end) =
struct
  let to_int x = fst (List.findi_exn X.all_in_order ~f:(fun _ y -> X.equal x y))
  let of_int i = List.nth X.all_in_order i
end

(* Coder mode register (SET Coder_mode imm). Bits [1:0] select the line code;
   bit 2 inverts; bit 3 selects open-drain output, where a 1 bit releases the
   pin (pulled high externally) instead of driving it, as I2C requires. *)
module Coder_mode = struct
  let nrz = 0
  let nrzi = 1
  let manchester = 2
  let invert = 4
  let open_drain = 8
end

module Act = struct
  module T = struct
    type t =
      | Drive0
      | Drive1
      | Release
      | Toggle
      | Shift_out
      | Sample
      | Aux0 (* drive the auxiliary pin low, e.g. SPI chip select *)
      | Aux1 (* drive the auxiliary pin high *)
    [@@deriving sexp, compare, equal, enumerate]

    let all_in_order = [ Drive0; Drive1; Release; Toggle; Shift_out; Sample; Aux0; Aux1 ]
  end

  include T
  include Indexed (T)

  (* Spec v0.2: everything except Sample is resolved when the event is enqueued.
     Sample reads the configured input pin; Aux0/Aux1 drive the configured
     auxiliary pin; the others act on the data or clock pin. *)
  let resolved_at_enqueue = function
    | Sample -> false
    | _ -> true
end

module Cond = struct
  module T = struct
    type t =
      | Always
      | X_dec_nz
      | Y_dec_nz
      | Flag
      | Pin
      | Osr_empty
      | Isr_full
      | Cap_ready
    [@@deriving sexp, compare, equal, enumerate]

    let all_in_order =
      [ Always; X_dec_nz; Y_dec_nz; Flag; Pin; Osr_empty; Isr_full; Cap_ready ]
  end

  include T
  include Indexed (T)
end

module Set_dst = struct
  module T = struct
    type t =
      | X
      | Y
      | K1
      | K2
      | K3
      | Coder_mode
      | Pin_dir
      | Prescale
    [@@deriving sexp, compare, equal, enumerate]

    let all_in_order = [ X; Y; K1; K2; K3; Coder_mode; Pin_dir; Prescale ]
  end

  include T
  include Indexed (T)
end

module Loc = struct
  module T = struct
    type t =
      | X
      | Y
      | Osr
      | Isr
      | Crc
      | Cap
    [@@deriving sexp, compare, equal, enumerate]

    let all_in_order = [ X; Y; Osr; Isr; Crc; Cap ]
  end

  include T
  include Indexed (T)
end

module Crc_cmd = struct
  module T = struct
    type t =
      | Feed_tx
      | Feed_rx
      | Reset
      | Load_osr
      | Arm_corrupt
    [@@deriving sexp, compare, equal, enumerate]

    let all_in_order = [ Feed_tx; Feed_rx; Reset; Load_osr; Arm_corrupt ]
  end

  include T
  include Indexed (T)
end

module Cap_cmd = struct
  module T = struct
    type t =
      | On
      | Off
      | Marker
    [@@deriving sexp, compare, equal, enumerate]

    let all_in_order = [ On; Off; Marker ]
  end

  include T
  include Indexed (T)
end

type t =
  | Nop
  | Evt of
      { dt : int (* 6 bits *)
      ; clk_pin : bool (* target: data pin (false) or clock pin (true) *)
      ; cls : int (* skew class, 2 bits; class 0 has K = 0 *)
      ; act : Act.t
      }
  | Dly of { dt : int (* 12 bits *) }
  | Wait of
      { pin : int (* 3 bits *)
      ; pol : bool
      ; timeout : int (* timeout select, 2 bits *)
      }
  | Jmp of
      { cond : Cond.t
      ; addr : int (* 6 bits *)
      }
  | Set of
      { dst : Set_dst.t
      ; imm : int (* 8 bits *)
      }
  | Mov of
      { dst : Loc.t
      ; src : Loc.t
      }
  | Pull of { block : bool }
  | Push of { block : bool }
  | Crc of Crc_cmd.t
  | Sync of
      { wait : bool
      ; id : int (* 2 bits *)
      }
  | Cap of
      { cmd : Cap_cmd.t
      ; mask : int (* 8 bits *)
      }
[@@deriving sexp, compare, equal]

(* Field positions, shared with the Hardcaml decoder. *)
module Field = struct
  type f =
    { lo : int
    ; width : int
    }

  let op = { lo = 12; width = 4 }
  let evt_dt = { lo = 6; width = 6 }
  let evt_tgt = { lo = 5; width = 1 }
  let evt_cls = { lo = 3; width = 2 }
  let evt_act = { lo = 0; width = 3 }
  let dly_dt = { lo = 0; width = 12 }
  let wait_pin = { lo = 9; width = 3 }
  let wait_pol = { lo = 8; width = 1 }
  let wait_tsel = { lo = 6; width = 2 }
  let jmp_cond = { lo = 8; width = 4 }
  let jmp_addr = { lo = 0; width = 6 }
  let set_dst = { lo = 8; width = 4 }
  let set_imm = { lo = 0; width = 8 }
  let mov_dst = { lo = 9; width = 3 }
  let mov_src = { lo = 6; width = 3 }
  let pp_push = { lo = 11; width = 1 }
  let pp_block = { lo = 10; width = 1 }
  let crc_cmd = { lo = 9; width = 3 }
  let sync_wait = { lo = 11; width = 1 }
  let sync_id = { lo = 9; width = 2 }
  let cap_cmd = { lo = 10; width = 2 }
  let cap_mask = { lo = 0; width = 8 }
  let get f w = (w lsr f.lo) land ((1 lsl f.width) - 1)

  let put f v =
    if v < 0 || v >= 1 lsl f.width
    then raise_s [%message "field value out of range" (v : int) (f.width : int)];
    v lsl f.lo
end

module Opcode = struct
  let nop = 0x0
  let evt = 0x1
  let dly = 0x2
  let wait = 0x3
  let jmp = 0x4
  let set = 0x5
  let mov = 0x6
  let pullpush = 0x7
  let crc = 0x8
  let sync = 0x9
  let cap = 0xA
end

let bit x = if x then 1 else 0

let encode t =
  let open Field in
  let op o = put op o in
  match t with
  | Nop -> op Opcode.nop
  | Evt { dt; clk_pin; cls; act } ->
    op Opcode.evt
    lor put evt_dt dt
    lor put evt_tgt (bit clk_pin)
    lor put evt_cls cls
    lor put evt_act (Act.to_int act)
  | Dly { dt } -> op Opcode.dly lor put dly_dt dt
  | Wait { pin; pol; timeout } ->
    op Opcode.wait lor put wait_pin pin lor put wait_pol (bit pol) lor put wait_tsel timeout
  | Jmp { cond; addr } ->
    op Opcode.jmp lor put jmp_cond (Cond.to_int cond) lor put jmp_addr addr
  | Set { dst; imm } ->
    op Opcode.set lor put set_dst (Set_dst.to_int dst) lor put set_imm imm
  | Mov { dst; src } ->
    op Opcode.mov lor put mov_dst (Loc.to_int dst) lor put mov_src (Loc.to_int src)
  | Pull { block } -> op Opcode.pullpush lor put pp_push 0 lor put pp_block (bit block)
  | Push { block } -> op Opcode.pullpush lor put pp_push 1 lor put pp_block (bit block)
  | Crc c -> op Opcode.crc lor put crc_cmd (Crc_cmd.to_int c)
  | Sync { wait; id } -> op Opcode.sync lor put sync_wait (bit wait) lor put sync_id id
  | Cap { cmd; mask } ->
    op Opcode.cap lor put cap_cmd (Cap_cmd.to_int cmd) lor put cap_mask mask

(* Decoding is strict: unused bits must be zero, so [encode (decode w) = w] for
   every word that decodes. Any other word is an illegal instruction. *)
let decode w =
  let open Field in
  let open Option.Let_syntax in
  let g f = get f w in
  let candidate =
    match g op with
    | 0x0 -> Some Nop
    | 0x1 ->
      let%map act = Act.of_int (g evt_act) in
      Evt { dt = g evt_dt; clk_pin = g evt_tgt = 1; cls = g evt_cls; act }
    | 0x2 -> Some (Dly { dt = g dly_dt })
    | 0x3 -> Some (Wait { pin = g wait_pin; pol = g wait_pol = 1; timeout = g wait_tsel })
    | 0x4 ->
      let%map cond = Cond.of_int (g jmp_cond) in
      Jmp { cond; addr = g jmp_addr }
    | 0x5 ->
      let%map dst = Set_dst.of_int (g set_dst) in
      Set { dst; imm = g set_imm }
    | 0x6 ->
      let%bind dst = Loc.of_int (g mov_dst) in
      let%map src = Loc.of_int (g mov_src) in
      Mov { dst; src }
    | 0x7 ->
      let block = g pp_block = 1 in
      Some (if g pp_push = 1 then Push { block } else Pull { block })
    | 0x8 -> Crc_cmd.of_int (g crc_cmd) |> Option.map ~f:(fun c -> Crc c)
    | 0x9 -> Some (Sync { wait = g sync_wait = 1; id = g sync_id })
    | 0xA ->
      let%map cmd = Cap_cmd.of_int (g cap_cmd) in
      Cap { cmd; mask = g cap_mask }
    | _ -> None
  in
  match candidate with
  | Some i when w land lnot 0xFFFF = 0 && encode i = w -> Some i
  | _ -> None
