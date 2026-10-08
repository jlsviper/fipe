#!/bin/sh
# Synthesize the top to generic cells with Yosys, then run the CDC check.
# The same checker also runs on post-layout netlists (see tools/cdc_check.py).
set -e
cd "$(dirname "$0")/.."
mkdir -p build
yosys -q -p "read_verilog src/tt_um_jlsviper_fipe.v; synth -flatten -top tt_um_jlsviper_fipe; write_json build/cdc_netlist.json"
python3 tools/cdc_check.py build/cdc_netlist.json
