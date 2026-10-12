#!/bin/sh
# Formal proofs of FIPE's timing contract, for all time (temporal induction
# with Yosys's built-in SAT solver). Exits non-zero if either proof fails.
#   formal/queue_contract.sv  every event fires once, in order, never early,
#                             and exactly on time unless flagged LATE
#   formal/core_pins.sv       across the whole core, a pin changes only because
#                             an event for it fired in the previous cycle
set -e
cd "$(dirname "$0")/.."
opam exec -- dune exec bin/gen_verilog.exe -- --formal > /dev/null 2>&1 || dune exec bin/gen_verilog.exe -- --formal > /dev/null
prove () {
  name=$1; dut=$2; harness=$3
  if yosys -p "read_verilog $dut; read_verilog -formal -sv $harness; prep -top $name; async2sync; flatten; opt_clean; sat -tempinduct -prove-asserts -set-assumes -set-init-zero -maxsteps 6 -verify" > build/formal_$name.log 2>&1 \
     && grep -q "Induction step proven: SUCCESS" build/formal_$name.log; then
    echo "PROVEN  $name ($(grep -o 'Solving problem with [0-9]* variables' build/formal_$name.log | tail -1 | grep -o '[0-9]*') variables)"
  else
    echo "FAILED  $name: see build/formal_$name.log"; exit 1
  fi
}
prove queue_contract build/fipe_event_queue_formal.v formal/queue_contract.sv
prove core_pins build/fipe_core.v formal/core_pins.sv
