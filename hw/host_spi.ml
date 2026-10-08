(* Host SPI target (spec v0.2, Host interface).

   Mode 0, MSB first. Every transaction: an 8-bit command, then 32 data bits.
   Command bit 7 = 1 writes, 0 reads; bits 6..0 are the register address.

   SCK, CS_n and MOSI are asynchronous to the core clock, so each goes through
   an identical two-flop synchronizer (MOSI stays aligned with SCK) and edges
   are detected in the core clock domain. There is no second clock domain.

   Timing: MISO changes on SCK falling edges, about three core cycles after
   the edge at the pin. SCK must therefore be at most clk/8 (6.25 MHz at
   50 MHz) for reads; writes work up to clk/4.

   Writes: after the 40th SCK rise, [wr_strobe] pulses with [addr] and [wdata].
   Reads: after the 8th rise, the register at [addr] is captured on the next
   cycle and shifted out on the following 32 falling edges. *)
open! Base
open Hardcaml
open Signal

module I = struct
  type 'a t =
    { clock : 'a
    ; clear : 'a
    ; sck : 'a
    ; cs_n : 'a
    ; mosi : 'a
    ; rdata : 'a [@bits 32] (* register at [addr], combinational *)
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { miso : 'a
    ; addr : 'a [@bits 7]
    ; wr_strobe : 'a
    ; wdata : 'a [@bits 32]
    }
  [@@deriving sexp_of, hardcaml]
end

let create (i : _ I.t) : _ O.t =
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.clear () in
  (* Synchronizers have no clear: no logic may sit between an asynchronous
     input and its first flip-flop. They flush within two cycles of reset. *)
  let sync_spec = Reg_spec.create ~clock:i.clock () in
  let sync x = reg sync_spec (reg sync_spec x) in
  let sck = sync i.sck and cs_n = sync i.cs_n and mosi = sync i.mosi in
  let sck_prev = reg spec sck in
  let rise = sck &: ~:sck_prev &: ~:cs_n in
  let fall = ~:sck &: sck_prev &: ~:cs_n in
  let open Always in
  let bitcnt = Variable.reg spec ~width:6 in
  let shift_in = Variable.reg spec ~width:32 in
  let cmd = Variable.reg spec ~width:8 in
  let load = Variable.reg spec ~width:1 in
  let out = Variable.reg spec ~width:32 in
  let miso = Variable.reg spec ~width:1 in
  let wr = Variable.reg spec ~width:1 in
  let wdata = Variable.reg spec ~width:32 in
  let next_in = lsbs shift_in.value @: mosi in
  let is_write = msb cmd.value in
  compile
    [ wr <-- gnd
    ; load <-- gnd
    ; if_
        cs_n
        [ bitcnt <--. 0 ]
        [ when_
            rise
            [ shift_in <-- next_in
            ; when_ (bitcnt.value <>:. 63) [ bitcnt <-- bitcnt.value +:. 1 ]
            ; when_ (bitcnt.value ==:. 7) [ cmd <-- select next_in 7 0; load <-- vdd ]
            ; when_
                (bitcnt.value ==:. 39 &: is_write)
                [ wr <-- vdd; wdata <-- next_in ]
            ]
        ; (* capture read data the cycle after the command byte *)
          when_ (load.value &: ~:is_write) [ out <-- i.rdata ]
        ; when_
            (fall &: (bitcnt.value >=:. 8) &: ~:is_write)
            [ miso <-- msb out.value; out <-- sll out.value 1 ]
        ]
    ];
  { miso = miso.value
  ; addr = select cmd.value 6 0
  ; wr_strobe = wr.value
  ; wdata = wdata.value
  }
;;
