# Formal proofs of FIPE's timing contract

FIPE's architecture rests on one promise: timing is data. Every pin event is
computed ahead of time with an exact due time, and nothing else moves a pin.
These proofs establish that promise for all time, for every program and every
input, by temporal induction with Yosys's built-in SAT solver.

## The theorem

1. **The event queue** (`queue_contract.sv`) fires every event exactly once,
   in the order it was accepted, never before its due time, and either exactly
   at its due time or with the LATE flag set. Nothing is lost, duplicated or
   reordered.
2. **The whole core** (`core_pins.sv`) changes an output pin only because an
   event targeting that pin fired in the previous cycle (or the core was
   cleared). No other path, from the sequencer, the program memory or the host
   interface, can move a pin.

Together: every pin edge FIPE produces is an event the program scheduled,
delivered on time or flagged.

## How it is proven

`queue_contract.sv` runs an ideal reference queue (a "shadow") beside the real
one and asserts, every cycle, that the real queue holds exactly the shadow's
events in order, fires if and only if the head (or the second entry, behind a
firing head) is due, and sets LATE exactly when an event fires after its due
time. Asserting that the internal state matches the shadow makes the property
inductive: it holds in the initial state, and if it holds in any state, it
holds in the next, so it holds forever.

`core_pins.sv` instantiates the entire core with every input left free (any
pair of programs, any host traffic, any pin waveform) and asserts that each
cycle's pin registers equal the previous ones updated by the previous cycle's
fires, B's then A's.

## Assumptions

- The timebase advances by one every cycle (it is the chip's free-running
  counter).
- Every enqueued due time lies within 2^22 cycles of the timebase. The
  sequencer guarantees this (it stalls when the schedule runs too far ahead),
  and the queue's WINDOW_ERR flag checks it in hardware.

## The proofs can fail

A proof that cannot fail proves nothing; a wrong assumption could make it pass
vacuously. `tools/formal_mutants.sh` plants bugs, one at a time, and
checks that each of these eight makes a proof fail:

| Planted bug | Caught by |
| --- | --- |
| The queue fires an event one cycle early | queue contract |
| The queue holds a due event back a cycle | queue contract |
| The queue fires a second event that is not there | queue contract |
| The late flag is set when an event is exactly on time | queue contract |
| The queue writes the wrong slot when its pointer wraps | queue contract |
| The start signal pulses a pin directly | pin contract |
| A's two same-cycle fires are applied in the wrong order | pin contract |
| B overrides A in a same-cycle conflict | pin contract |

## Running them

```
./tools/formal.sh            # both proofs (needs Yosys; generates the Verilog first)
./tools/formal_mutants.sh    # the eight planted bugs; every one must be caught
```

Both run in CI on every push (the `ocaml` workflow).

## What the proofs do not cover

- The sequencer's own arithmetic (due-time computation, skews), which is
  checked by three independent models cycle for cycle against the RTL rather
  than proven.
- The host SPI interface and the timing monitors (simulation and model checks).
- Analog behavior: pad delays, rise times, metastability itself (the
  synchronizers are checked structurally by `tools/cdc_check.py`).
- The gates: `tools/equiv.sh` proves that a netlist synthesized with the IHP
  CMOS5L cells is equivalent to the RTL at every output (12,486 of 12,487
  register and output points proven; the remaining one is a shift-register
  bit nothing can read, which synthesis deletes). The post-layout netlist,
  where the layout flow renames registers, is checked by simulation instead:
  20 random programs on the real post-layout netlist must reproduce the RTL's
  output record exactly (`test/test.py`, `test_regress`, run by CI's gate-level
  test on every GDS build).
