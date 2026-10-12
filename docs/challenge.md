# FIPE against the competition brief

Every requirement and judging criterion from Jane Street's announcement and FAQ, with where to
find the evidence in this repository. Gaps are listed as gaps.

## The brief

| Requirement | Status | Evidence |
| --- | --- | --- |
| Open-source, general-purpose protocol emulator ASIC | Met | This repository (Apache-2.0). Protocols are programs, not fixed blocks. |
| IHP 130 nm CMOS5L through the Tiny Tapeout template, 6x4 tiles | Met | `info.yaml` (6x4, 50 MHz); the `gds` workflow builds from `src/` with the CMOS5L action. |
| Passing GDS and precheck from the Tiny Tapeout flow | Met | `gds` workflow: DRC 0, LVS 0, precheck green, gate-level cocotb test green. Timing closes at 50 MHz at every corner (slow-corner setup slack about +4.6 ns). |
| A CPU-style engine built for reading pins, writing pins and counting cycles | Met | ISA in `isa/isa.ml` and the spec: timestamped pin events (`evt`), delays, `wait` on a pin, `jmp pin`, counters, a host FIFO. |
| Reprogrammable for protocols it was not designed for | Met | `examples/ws2812.s`, `examples/onewire_read_rom.s`, `examples/jtag_idcode.s`: assembly only, each verified against a device model and the RTL (`tests/test_flex.ml`). |
| Start with UART, SPI and I2C | Met | `examples/uart_echo.s`, `spi_read_id.s`, `spi_read_id_late.s`, `i2c_eeprom_write.s`; tests in `tests/test_uart.ml`, `test_spi.ml`, `test_core.ml`, `test_tt_top.ml`. |
| Standard settings: common UART baud rates | Met | Bit periods exact to one 20 ns cycle (115,200 baud is 434 cycles), tested at 115,200. |
| Standard settings: SPI modes 0 to 3 | Met | Frequency-by-mode sweeps cover all four modes (`tests/test_spi.ml`). |
| Standard settings: I2C at 100 and 400 kHz | Partial | 100 kHz (standard mode) is implemented and characterized; 400 kHz (fast mode) is not yet demonstrated. |
| Stretch: low-speed USB, 10 Mbit Ethernet | Not attempted | Deliberately out of scope; depth over breadth. |
| Other protocols worth considering: JTAG, SWD, PS/2, CAN | Partial | JTAG demonstrated (IDCODE). 1-Wire and WS2812 also demonstrated. |
| Running protocols concurrently; controller and target roles | Not yet | Planned: a second sequencer on the shared timebase (full-duplex UART, controller plus target). |
| Use rst_n to reach a known state; reload after reselection | Met | `rst_n` passes a two-flop synchronizer; the host reloads programs (`docs/info.md`). |
| Program loading through a documented host | Met | SPI host interface and register map (`hw/tt_top.ml`, `docs/info.md`); the demo board's RP2040 is the intended host. |

## What to submit

| Item | Where |
| --- | --- |
| RTL | `hw/*.ml` (Hardcaml, the source) generating `src/tt_um_jlsviper_fipe.v` |
| Tests | `tests/` (OCaml, run by `dune runtest` in CI), `test/` (cocotb, RTL and gate level) |
| Passing GDS and precheck | `gds` workflow on every chip change |
| Architecture and ISA documentation | The spec, `README.md`, `docs/info.md`, comments in `isa/isa.ml` and `hw/*.ml` |
| Assembler or toolchain, with example programs | `asm/` and `bin/fasm.ml` (`dune exec bin/fasm.exe -- asm FILE.s`); `examples/*.s` |
| Write-up of the verification approach | Below, and the spec's status sections |
| How AI tools were used | To be written in the final write-up |

## Judging

**Flexibility.** Protocols are programs on one engine. Three protocols the chip was not designed
for run from assembly alone, each verified. Because every protocol lowers to the same timed
events, every protocol also inherits the same fault injection (skew classes) and measurement
tools without protocol-specific hardware.

**Protocols demonstrated.** UART, SPI (modes 0 to 3, with late sampling), I2C, WS2812, 1-Wire,
JTAG.

**Something unique the architecture makes possible.** Measured datasheets: the chip moves chosen
edges by exact amounts, watches the device, and reports what the device actually needs against
what the spec promises. Demonstrated in simulation for I2C (hidden parameters recovered;
population statistics with 6-sigma limits), SPI (frequency-by-mode shmoos, MISO data-valid
windows), UART (a device's real bit period and sample point) and open-drain rise time.

**Design and verification.**

- **Formal proofs, for all time** (`formal/`, run in CI): the event queue fires every event once,
  in order, never early, and exactly on time unless it flags LATE; across the whole core, a pin
  changes only because an event for it fired. Proven by temporal induction with Yosys.
- **The proofs are tested too:** seven planted bugs (early firing, held-back events, phantom
  events, a wrong late flag, a pointer-wrap bug, a stray pin path, misordered same-cycle fires)
  each make a proof fail (`tools/formal_mutants.sh`, in CI).
- **Three independent models of the chip**, each matched against the RTL cycle for cycle: the
  executor and on-time model, and a cycle-accurate simulator for reactive programs. Over 850
  random, stress and reactive programs agree with the RTL in every fire, sample and flag.
- **Clock-domain crossing:** a netlist checker proves every asynchronous input passes a two-flop
  synchronizer, on the post-layout netlist as well (`tools/cdc_check.py`, in CI).
- **A machine-checked timing spec** drives a symbolic checker and the on-chip monitors; the two
  are cross-checked.
- **Bugs found by the cross-checks are documented:** in a checker rule, in device models, and in
  a fast bench, each caught because two independent views disagreed.

## Known limits

- Everything is verified in simulation and formally; nothing has run on an FPGA or silicon yet.
- Timing resolution is one 20 ns cycle; the sequencer generates SPI up to about 8 MHz.
- One sequencer: UART is half-duplex until the second sequencer lands.
- I/O pad timing for CMOS5L is uncharacterized (no silicon data exists yet for anyone).
