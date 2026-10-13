#!/usr/bin/env python3
"""Write a copy of the chip's Verilog in which every register powers up to a
seeded random value (time zero, before reset), as real flip-flops do.

  python3 tools/random_init.py src/tt_um_jlsviper_fipe.v build/random_init.v

Simulate with +seed=N. Registers with a reset are overwritten by it; the ones
deliberately left without one (program memory, synchronizers) keep their
random contents, which is exactly what the regression must survive: the
gate-level regression has to reproduce the same golden record from any
power-up state (cd test && make RANDOM_INIT=N COCOTB_TEST_FILTER=test_regress).
"""
import re
import sys

src = open(sys.argv[1]).read()
out = []
for mod in re.split(r'(?=^module )', src, flags=re.M):
    regs = re.findall(r'^\s*reg(?:\s*\[(\d+):(\d+)\])?\s+([A-Za-z_][\w$]*)\s*;', mod, re.M)
    if not regs or 'endmodule' not in mod:
        out.append(mod)
        continue
    init = ['    // random power-up state (tools/random_init.py)',
            '    integer __seed;',
            '    initial begin',
            '        if (!$value$plusargs("seed=%d", __seed)) __seed = 1;']
    for hi, lo, name in regs:
        width = int(hi) - int(lo) + 1 if hi else 1
        words = (width + 31) // 32
        val = ', '.join(['$random(__seed)'] * words)
        init.append(f'        {name} = {{{val}}};')
    init.append('    end')
    i = mod.rindex('endmodule')
    out.append(mod[:i] + '\n'.join(init) + '\n' + mod[i:])
open(sys.argv[2], 'w').write(''.join(out))
print(f"{sys.argv[2]}: random power-up for every register")
