#!/usr/bin/env python3
"""Clock-domain-crossing check on a synthesized netlist (Yosys JSON).

FIPE has one clock; every other top-level input is asynchronous to it. The rule
checked, for every bit of every asynchronous input:

  1. it reaches only D pins of plain flip-flops (first stage): no logic, no
     reset or enable gating, no other fan-out;
  2. each first-stage flip-flop's Q reaches only D pins of plain flip-flops
     (second stage).

Buffers and delay cells (as inserted by place-and-route and hold fixing) are
treated as wires. Works on Yosys's generic cells and on IHP standard cells.

usage: cdc_check.py netlist.json [--clock clk]
"""
import json, re, sys
from collections import defaultdict

def main():
    path = sys.argv[1]
    clock = sys.argv[sys.argv.index('--clock') + 1] if '--clock' in sys.argv else 'clk'
    mod = None
    for name, m in json.load(open(path))['modules'].items():
        if m.get('attributes', {}).get('top') or name.startswith('tt_um_'):
            mod = m
    if mod is None:
        sys.exit('no top module found')

    def is_flop(t): return t in ('$_DFF_P_', '$_DFF_N_') or re.search(r'_df\w*_\d', t)
    def is_wire(t): return t == '$_BUF_' or re.search(r'_(buf|dlygate|dlyb|clkbuf)\w*_\d', t)

    # sinks: bit -> list of (cell, type, pin)
    sinks = defaultdict(list)
    drivers = {}
    cells = mod['cells']
    for cname, c in cells.items():
        dirs = c.get('port_directions', {})
        for pin, bits in c['connections'].items():
            d = dirs.get(pin, 'input')
            for b in bits:
                if not isinstance(b, int):
                    continue
                if d == 'output':
                    drivers[b] = (cname, pin)
                else:
                    sinks[b].append((cname, c['type'], pin))

    def reach(bit, seen=None):
        """Sink pins reached from a net bit, looking through buffers."""
        seen = seen or set()
        out = []
        for cname, ctype, pin in sinks.get(bit, []):
            if is_wire(ctype):
                for b in cells[cname]['connections'].get('X', cells[cname]['connections'].get('Y', [])):
                    if isinstance(b, int) and b not in seen:
                        seen.add(b)
                        out += reach(b, seen)
            else:
                out.append((cname, ctype, pin))
        return out

    def plain_flop_d(cname, ctype, pin):
        if not (is_flop(ctype) and pin == 'D'):
            return False
        conn = cells[cname]['connections']
        rb = conn.get('RESET_B')  # IHP flops: async reset must be tied off
        def tied(b):
            if not isinstance(b, int):
                return True  # literal constant
            drv = drivers.get(b)  # after layout, a tie-high cell drives it
            return drv is not None and 'tiehi' in cells[drv[0]]['type']
        return rb is None or all(tied(b) for b in rb)

    def q_bit(cname):
        return [b for b in cells[cname]['connections']['Q'] if isinstance(b, int)][0]

    ports = mod['ports']
    failures = 0
    checked = 0
    for pname, p in sorted(ports.items()):
        if p['direction'] != 'input' or pname == clock:
            continue
        for idx, bit in enumerate(p['bits']):
            if not isinstance(bit, int):
                continue
            checked += 1
            label = f"{pname}[{idx}]" if len(p['bits']) > 1 else pname
            first = reach(bit)
            if not first:
                print(f"  {label:10s} unused (no sinks): ok")
                continue
            bad = [s for s in first if not plain_flop_d(*s)]
            if bad:
                failures += 1
                print(f"  {label:10s} FAIL: reaches logic before a flip-flop: {bad[:3]}")
                continue
            second_bad = []
            for (cname, ctype, pin) in first:
                nxt = reach(q_bit(cname))
                second_bad += [s for s in nxt if not plain_flop_d(*s)]
            if second_bad:
                failures += 1
                print(f"  {label:10s} FAIL: first flip-flop feeds logic: {second_bad[:3]}")
            else:
                print(f"  {label:10s} ok: {len(first)} two-flop synchronizer(s)")
    print(f"{checked} asynchronous input bits checked, {failures} violations")
    sys.exit(1 if failures else 0)

main()
