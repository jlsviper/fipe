# fipe: fault-injecting protocol emulator

Entry for the Jane Street protocol emulator ASIC competition (Tiny Tapeout, IHP 130nm CMOS5L).
The architecture spec is the source of design intent; this repo implements it.

## Layout

| Path | What it is |
| --- | --- |
| `isa/` | The ISA, defined once: types, field positions, strict encode/decode. Every other part uses it. |
| `spec/` | Protocol timing specs, the single source of truth for "correct" (I2C standard mode so far). |
| `checker/` | Executor, symbolic and concrete checker, on-time cycle model, monitor compiler, assembler, firmware. |
| `model/` | Reference models: event queue, I2C EEPROM with realistic failure mechanisms (and an optional non-monotonic deglitch bug). |
| `tools/cdc_check.py` | Netlist proof that every asynchronous input passes a two-flop synchronizer (runs in CI; also on post-layout netlists). |
| `bench/` | Simulated bench: a fast bus model proven against the RTL, sweep strategies, hole detection, population statistics. |
| `hw/` | Hardcaml RTL: event queue, sequencer, core, monitors, host SPI, Tiny Tapeout top. |
| `tests/` | The OCaml regression (`dune runtest`). |
| `bin/gen_verilog.ml` | Writes `src/tt_um_jlsviper_fipe.v`. `--components` also writes blocks to `build/`. |
| `src/` | Generated Verilog plus the Tiny Tapeout flow config. Do not edit the `.v` by hand. |
| `test/` | Tiny Tapeout's cocotb smoke test (also runs on the gate-level netlist). |
| `info.yaml`, `docs/info.md` | Tiny Tapeout project metadata and datasheet. |
| `.github/workflows/` | `gds` (RTL to GDS, precheck, gate-level test), `test` (cocotb), `docs`, `ocaml` (our regression). |

## Status

**SPI and the synchronizer proof (chip change: needs a GDS run).** Samples read a configurable
input pin (MISO) and actions 6/7 drive an auxiliary pin (chip select): four-wire SPI. A
frequency-by-mode READ ID sweep (`tests/test_spi.ml`) against an SPI device model with
real-silicon failure modes finds a low-frequency hole (fails below 625 kHz), mode-0-only logic,
and a mode that passes only by accident. The fast SPI bench matches the RTL on 7 of 7 points.
All 18 asynchronous input bits now pass pure two-flop synchronizers; `tools/cdc_check.py` found
17 of 18 violating on the previous post-layout netlist, and 0 now.

**Timing closed (second GDS).** Setup slack at 50 MHz: +3.63 ns slow (1.08 V, 125 C), +8.64 ns
typical, +11.09 ns fast; hold met everywhere; DRC, LVS, antenna, precheck and gate-level test clean.
The registered instruction fetch moved the slow corner by 7.0 ns.

**Characterization the industry way** (`bench/`, `tests/test_characterize.ml`): a fast bus model
that reproduces the RTL exactly; a full sweep that finds non-monotonic failure holes binary search
misses; 31-part population statistics (median, robust sigma, 6-sigma limits, outliers) with the
hidden truth inside 124 of 124 measured brackets; self-characterization of our SPI port (passes
50 kHz to 8.33 MHz, guaranteed at 6.25 MHz); open-drain rise time from the pins with a two-load
method that recovers the pull-up and bus capacitance.

CI: the layout, cocotb and docs workflows run only when the chip, its tests or its metadata change;
the OCaml regression runs on every push.

**Timing closure, round 1.** First GDS: setup slack at 50 MHz +10.35 ns fast, +5.37 ns typical,
**-3.37 ns slow** (1.08 V, 125 C; 274 endpoints); hold met everywhere; LVS, DRC, antenna and
precheck clean. Reproduced exactly with OpenSTA on the post-layout netlist and SPEF. Every failing
endpoint sat behind the single-cycle instruction fetch, so the fetch is now registered
(`hw/sequencer.ml`): same cycle for every instruction, proven by the unchanged cycle-exact suite.
The lead bound is a registered flag, and due = S + (dt + K) * prescale. The next GDS run measures it.

**First GDS and review fixes.** The first RTL-to-GDS run on GitHub Actions succeeded (synthesis,
placement, routing to zero violations, DRC). The gate-level test failed only because the CMOS5L
template's `test/Makefile` never loads `sg13cmos5l_udp.v`, which defines the primitives the cell
models use; one added line fixes it, verified locally with CI's Icarus 13 build and PDK revision.
`rst_n` now passes through a two-flop synchronizer before driving the synchronous clears.

**Tiny Tapeout integration.** `hw/tt_top.ml` generates `tt_um_jlsviper_fipe` (6x4 tiles,
50 MHz): host SPI port, register map, 4-deep host FIFO, sample log, monitors behind registers.

- Full chip over its pins only (`tests/test_tt_top.ml`): SPI loads firmware and monitor
  configuration, an EEPROM on uio acknowledges, the chip logs `0001`, the device stores 0x5A.
  The monitors measure the device's own ACK edge (t_SU_DAT minimum 192 cycles).
- Verilator lint with LibreLane's exact flags: 0 errors, latches or multiple drivers.
- cocotb smoke test passes under Icarus; it also runs on the gate-level netlist in CI.
- Synthesized area: 221,520 um^2 in 13,445 cells, 24% of the 916,214 um^2 6x4 die.

**Measured datasheet (the Nov 15 gate, met in simulation).** `tests/test_sweep.ml` sweeps one
skew knob per I2C rule against `model/i2c_eeprom.ml`, a cycle-level EEPROM with realistic
failure mechanisms, and recovers every hidden device parameter from the ACK bits the chip
samples itself (29 transactions, binary search):

| Rule     | Spec      | Device needs (measured) | Hidden truth |
|----------|-----------|-------------------------|--------------|
| t_HD_STA | >= 4000 ns | 880 to 960 ns          | 900 ns       |
| t_SU_STO | >= 4000 ns | 960 to 1040 ns         | 1000 ns      |
| t_HD_DAT | >= 0 ns    | 240 to 320 ns          | 300 ns       |
| t_SU_DAT | >= 250 ns  | 80 to 160 ns           | 100 ns       |

The t_HD_DAT row flags the part as non-compliant: it needs ~300 ns of hold the spec does not
guarantee from the bus. Pass/fail uses ACK polling (`Firmware.i2c_write_and_poll`), so a missed
STOP cannot pass silently. `checker/asm.ml` is a minimal labelled assembler; the core now has
synchronized inputs and reports sampled bits.

**On-time check and timing monitors.**

- `checker/ontime.ml`: a cycle model of instruction issue and queue firing. Every RTL run
  matches it cycle for cycle, late events included: 207 on time, 36 order violations,
  and 122 stress programs where the sequencer falls behind. 0 mismatches.
- `hw/monitors.ml`: four timing-monitor slots, loaded from rules compiled out of the spec.
  `hw/loopback.ml` feeds the core's own I2C output back into them.
- Monitors vs checker: 10 skew points x 8 rules, 0 disagreements. At K = 0 the monitors
  measure every interval exactly as the checker predicts (the measured datasheet of our
  own output).
- The cross-check found a semantic gap: same-cycle edges on SDA and SCL are ambiguous
  on the wire. The checker now has a concrete mode (ground truth, hardware semantics)
  and a PATTERN validity condition on its symbolic ranges.
- Monitors area: 34,534 um^2 (twice the estimate, before config registers). Trims planned.

**Sequencer and core.** One sequencer with the enqueue stage, decoded straight from
`Isa.Field`, runs on the event queue with a timebase, program memory and pin drivers
(`hw/sequencer.ml`, `hw/core.ml`). The checker's executor is the golden model:

- The I2C firmware on the RTL fires all 91 events at exactly the predicted cycles.
- Sweeping K1, K2 across the checker's ORDER boundaries, the hardware flags agree at every
  point, on both sides of each boundary.
- 300 random programs with random skews and pins: 207 cycle-exact, 36 order violations
  predicted and flagged, 57 skipped (unbounded loops), 0 mismatches.
- Core area: 125,410 um^2, of which ~95,000 is the flip-flop program memory
  (latches planned); the sequencer is ~12,600 um^2.

**Checker v0 (spec v0.3).** The I2C master write firmware is checked against all eight
I2C standard-mode rules plus the hardware order invariant, with skews K1 (SCL) and K2 (SDA)
symbolic. Safe region: -5 <= K2 - K1 <= 5; START and STOP are the tightest rules (400 ns).
The test prints the predicted shmoo. All eight rules compile into monitor slots.

**Milestone 1.**

- ISA v0.2 encodings: 10,614 legal words; every one round-trips (checked exhaustively over all 2^16).
- Event queue (spec v0.2: committed entries, 2 fires per cycle, LATE, ORDER, window check):
  0 mismatches against the reference model over 25,000 random cycles, including runs across the
  24-bit timer wrap, with every fault class exercised.
- Synthesized area of the real queue: 17,595 um^2, 1,294 cells (IHP sg13cmos5l, typical corner).

## Setup: GitHub Codespaces (recommended)

Push this repo to GitHub, then Code > Codespaces > Create codespace on main.
`.devcontainer/setup.sh` installs the exact toolchain the code was tested with
(Ubuntu 24.04, OCaml 4.14.1, Hardcaml v0.16, yosys) and finishes by running the tests.
The first build takes about 15 to 30 minutes; after that the codespace starts in seconds.
Stop the codespace when you are done so it does not use your free hours.

## Setup: local macOS (optional)

Homebrew no longer fully supports macOS 14, so local setup may fail. If you try it,
pin the same versions as the codespace:

```sh
opam switch create fipe 4.14.2
eval $(opam env --switch=fipe)
opam install -y dune hardcaml.v0.16.0 hardcaml_waveterm.v0.16.0 \
  ppx_deriving_hardcaml.v0.16.0 ppx_jane.v0.16.0 ppx_expect.v0.16.0
```

## Everyday commands

```sh
dune build                    # compile everything
dune runtest                  # run all tests; silence means pass
dune promote                  # accept new expected output after an intended change
dune exec bin/gen_verilog.exe # regenerate src/*.v (CI fails if you forget)
cd test && make               # Tiny Tapeout cocotb smoke test (needs iverilog + cocotb)
```

An expect test that fails prints a diff of what changed. Waveform tests print ASCII waveforms,
so a timing change shows up in code review as a picture.

## Next

1. GDS run for this batch; run tools/cdc_check.py on its post-layout netlist.
1b. Formal proof of the timing contract; reduce hold-fix cells.
2. Device-side monitors: count an edge only while our own driver is released, so the monitors
   measure the device's outputs (ACK delay, clock stretching).
3. Area: latch-based program memory, monitor trims.
4. Read-back verification, UART and SPI firmware, formal properties.
