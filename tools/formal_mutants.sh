#!/bin/sh
# Mutation tests for the formal proofs: each planted bug must make a proof
# FAIL, showing the proofs are not vacuous. Sources are restored afterwards.
cd "$(dirname "$0")/.."
cp hw/event_queue.ml build/eq.orig; cp hw/core.ml build/core.orig
missed=0
mutant () {
  file=$1; name=$2; proof=$3; dut=$4; harness=$5
  python3 - "$file" <<PY
import sys
p=sys.argv[1]; s=open(p).read()
a=open('build/mut_from').read(); b=open('build/mut_to').read()
assert a in s, a
open(p,'w').write(s.replace(a,b,1))
PY
  opam exec -- dune exec bin/gen_verilog.exe -- --formal > /dev/null 2>&1 || dune exec bin/gen_verilog.exe -- --formal > /dev/null 2>&1
  if yosys -p "read_verilog $dut; read_verilog -formal -sv $harness; prep -top $proof; async2sync; flatten; opt_clean; sat -tempinduct -prove-asserts -set-assumes -set-init-zero -maxsteps 6 -verify" 2>&1 | grep -q "SUCCESS"; then
    echo "MISSED  $name"; missed=1
  else
    echo "caught  $name"
  fi
  cp build/eq.orig hw/event_queue.ml; cp build/core.orig hw/core.ml
}
q () { printf '%s' "$2" > build/mut_from; printf '%s' "$3" > build/mut_to; mutant hw/event_queue.ml "$1" queue_contract build/fipe_event_queue_formal.v formal/queue_contract.sv; }
c () { printf '%s' "$2" > build/mut_from; printf '%s' "$3" > build/mut_to; mutant hw/core.ml "$1" core_pins build/fipe_core.v formal/core_pins.sv; }
mkdir -p build
q "queue fires one cycle early" "let is_due e = msb (diff e) |: (diff e ==:. 0) in" "let is_due e = msb (diff e) |: (diff e ==:. 0) |: (diff e ==:. 1) in"
q "queue holds a due event back" "let is_due e = msb (diff e) |: (diff e ==:. 0) in" "let is_due e = msb (diff e) in"
q "queue fires a phantom second event" "let fire1 = fire0 &: (count.value >:. 1) &: is_due e1 in" "let fire1 = fire0 &: is_due e1 in"
q "late flag set when exactly on time" "  ; fire0_late = fire0 &: is_late e0" "  ; fire0_late = fire0 &: is_due e0"
q "queue writes the wrong slot on wrap" "when_ (wp.value ==:. k) [ entries.(k) <-- packed ]" "when_ (wp.value ==:. k &: (if k < 3 then vdd else gnd)) [ entries.(k) <-- packed ]"
c "start pulses a pin directly" "      out <== o1;" "      out <== (if k = 0 then o1 |: i.start else o1);"
c "A's same-cycle fires applied out of order" "      let st = apply ~valid:q.fire0_valid ~pin:q.fire0_pin ~value:q.fire0_value k st in
      let o1, e1 = apply ~valid:q.fire1_valid ~pin:q.fire1_pin ~value:q.fire1_value k st in" "      let st = apply ~valid:q.fire1_valid ~pin:q.fire1_pin ~value:q.fire1_value k st in
      let o1, e1 = apply ~valid:q.fire0_valid ~pin:q.fire0_pin ~value:q.fire0_value k st in"
c "B overrides A in a same-cycle conflict" "      let st = out_q, oe_q in
      let st = apply ~valid:q_b.fire0_valid ~pin:q_b.fire0_pin ~value:q_b.fire0_value k st in
      let st = apply ~valid:q_b.fire1_valid ~pin:q_b.fire1_pin ~value:q_b.fire1_value k st in
      let st = apply ~valid:q.fire0_valid ~pin:q.fire0_pin ~value:q.fire0_value k st in
      let o1, e1 = apply ~valid:q.fire1_valid ~pin:q.fire1_pin ~value:q.fire1_value k st in" "      let st = out_q, oe_q in
      let st = apply ~valid:q.fire0_valid ~pin:q.fire0_pin ~value:q.fire0_value k st in
      let st = apply ~valid:q.fire1_valid ~pin:q.fire1_pin ~value:q.fire1_value k st in
      let st = apply ~valid:q_b.fire0_valid ~pin:q_b.fire0_pin ~value:q_b.fire0_value k st in
      let o1, e1 = apply ~valid:q_b.fire1_valid ~pin:q_b.fire1_pin ~value:q_b.fire1_value k st in"
opam exec -- dune exec bin/gen_verilog.exe -- --formal > /dev/null 2>&1 || dune exec bin/gen_verilog.exe -- --formal > /dev/null 2>&1
exit $missed
