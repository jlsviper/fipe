# fipe: fault-injecting protocol emulator

Entry for the Jane Street protocol emulator ASIC competition (Tiny Tapeout, IHP 130nm CMOS5L).
The architecture spec is the source of design intent; this repo implements it.

## Layout

| Path | What it is |
| --- | --- |
| `isa/` | The ISA, defined once: types, field positions, strict encode/decode. Every other part uses it. |
| `model/` | Reference models (golden), written independently of the RTL. |
| `hw/` | Hardcaml RTL. |
| `test/` | Expect tests: exhaustive ISA round-trip, RTL vs model differential tests, waveforms. |
| `bin/gen_verilog.ml` | Writes `src/*.v` for the Tiny Tapeout template. |
| `src/` | Generated Verilog. Do not edit by hand. |

## Status (milestone 1)

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
dune exec bin/gen_verilog.exe # regenerate src/*.v
```

An expect test that fails prints a diff of what changed. Waveform tests print ASCII waveforms,
so a timing change shows up in code review as a picture.

## Next (milestone 2, to Nov 1)

1. Timebase + skew registers, and the enqueue stage (S + dt, snapshot K, resolve the value).
2. One sequencer: fetch, decode from `Isa.Field`, EVT/DLY/JMP/SET, lead-bound stall at 2^22.
3. Reference model of the sequencer; random-program differential test against the RTL.
4. UART transmit from firmware as the first end-to-end test.
5. Tiny Tapeout wrapper `tt_um_fipe` generated from Hardcaml, then the first CI run on the template.
