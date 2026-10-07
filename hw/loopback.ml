(* Core plus monitors on one open-drain bus with pull-ups: a pin reads low if
   the core drives it low or an external device pulls it low, else high. The
   core's inputs and the monitors both see the bus.

   This is the first "device" the chip audits: itself. It lets the tests check
   that the monitors, compiled from the spec, flag exactly the rules the checker
   predicts our own waveform breaks. The EEPROM model plugs in here next. *)
open! Base
open Hardcaml
open Signal

module I = struct
  type 'a t =
    { core : 'a Core.I.t [@rtlprefix "c_"]
    ; mon : 'a Monitors.I.t [@rtlprefix "m_"]
    ; ext_pull_low : 'a [@bits Core.n_pins] (* external devices on the bus *)
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { core : 'a Core.O.t [@rtlprefix "c_"]
    ; mon : 'a Monitors.O.t [@rtlprefix "m_"]
    ; levels : 'a [@bits Core.n_pins]
    }
  [@@deriving sexp_of, hardcaml]
end

let create (i : _ I.t) : _ O.t =
  let bus = wire Core.n_pins in
  let core = Core.create { i.core with pins_in = bus } in
  let ours = (core.pins_oe &: core.pins_out) |: ~:(core.pins_oe) in
  let levels = ours &: ~:(i.ext_pull_low) in
  bus <== levels;
  let mon =
    Monitors.create { i.mon with clock = i.core.clock; clear = i.core.clear; pins = levels }
  in
  { core; mon; levels }
;;
