#!/bin/sh
# Formal equivalence: the RTL against a gate netlist synthesized with the IHP
# CMOS5L standard cells (the cells the chip is built from).
#
# Only state and outputs are compared: every register bit of the RTL against
# the same-named register in the gates, and every output. Internal
# combinational wires are excluded, because synthesis restructures them freely
# while preserving behavior. Matched points are proven by SAT (equiv_simple),
# then by induction (equiv_induct), which drops any point it cannot prove from
# its assumptions, so proven points never rest on unproven ones.
#
# Passes when every OUTPUT of the gates is proven equal to the RTL's. Internal
# points left unproven are listed: typically registers synthesis deleted
# because nothing can observe them (if one could be observed, an output would
# fail). Takes about 20 to 40 minutes and 1.3 GB.
set -e
cd "$(dirname "$0")/.."
mkdir -p build
LIB=build/sg13cmos5l_stdcell_typ_1p20V_25C.lib
PDK_REV=2bbec755dc67ca3db0261c3d6163e15735d66710   # the PDK revision CI's flow uses
[ -f $LIB ] || curl -sfL "https://raw.githubusercontent.com/IHP-GmbH/IHP-Open-PDK/$PDK_REV/ihp-sg13cmos5l/libs.ref/sg13cmos5l_stdcell/lib/sg13cmos5l_stdcell_typ_1p20V_25C.lib" -o $LIB
RTL=src/tt_um_jlsviper_fipe.v
echo "== synthesizing to IHP cells"
yosys -q -p "read_verilog $RTL; synth -top tt_um_jlsviper_fipe -flatten; dfflibmap -liberty $LIB; abc -liberty $LIB; opt_clean; write_verilog -noattr build/equiv_gates.v"
# every internal (non-port) wire of the RTL is excluded from matching
grep -oE '^\s*wire( \[[0-9]+:[0-9]+\])? (_[0-9A-Za-z_]+);' $RTL | sed -E 's/.* (_[0-9A-Za-z_]+);/\1/' | sort -u > build/equiv_blacklist.txt
cat > build/equiv.ys <<YS
read_verilog $RTL
prep -flatten -top tt_um_jlsviper_fipe
rename tt_um_jlsviper_fipe gold
design -stash gold
read_liberty -ignore_miss_func $LIB
read_verilog build/equiv_gates.v
hierarchy -top tt_um_jlsviper_fipe
flatten
opt_clean
rename tt_um_jlsviper_fipe gate
design -stash gate
design -copy-from gold -as gold gold
design -copy-from gate -as gate gate
equiv_make -blacklist build/equiv_blacklist.txt gold gate equiv
hierarchy -top equiv
async2sync
equiv_simple -seq 5
equiv_induct -seq 5
equiv_status
YS
echo "== proving (SAT, then induction)"
yosys -q -l build/equiv.log build/equiv.ys > /dev/null 2>&1 || true
total=$(grep -oE 'Found [0-9]+ unproven \$equiv cells \([0-9]+ groups\)' build/equiv.log | head -1 | grep -oE '^Found [0-9]+' | grep -oE '[0-9]+')
left=$(grep -oE 'Found a total of [0-9]+ unproven' build/equiv.log | grep -oE '[0-9]+' || echo 0)
[ -n "$left" ] || left=0
bad=$(grep 'Unproven \$equiv' build/equiv.log | grep -E 'uo_out|uio_out|uio_oe' || true)
echo "matched points: $total; proven: $((total - left)); unproven: $left"
grep 'Unproven \$equiv' build/equiv.log | sed -E 's/.*: (\\[^ ]+_gold( \[[0-9]+\])?).*/  unproven internal point: \1/; s/_gold//' || true
if [ -n "$bad" ] || ! grep -q "Executing EQUIV_STATUS" build/equiv.log; then
  echo "FAILED: an output is not proven equivalent (see build/equiv.log)"; exit 1
fi
echo "PROVEN: every output of the gates equals the RTL's, for all inputs, for all time"
