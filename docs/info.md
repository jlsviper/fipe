<!---
This file is used to generate your project datasheet.
-->

## How it works

FIPE is a programmable protocol emulator that measures devices instead of just talking to them.

Timing is data, not a side effect of code. A sequencer computes every pin event in advance and
commits it, fully resolved, into an event queue with an exact due time; only a 24-bit timebase
decides when a pin moves, so branches and stalls never shift an edge. Reacting to a device keeps
that property: `wait` and `jmp pin` read pins only once real time has caught up with the schedule,
so every input read happens at a data-determined moment. Skew registers (k1 to k3) move chosen
edges by exact amounts, which is how the chip injects timing faults on purpose and measures a
device's real margins. Four timing-monitor slots, compiled from the same protocol spec as the
offline checker, watch the bus and flag when the device breaks a rule.

Two sequencers share the time base and the program memory, so concurrent programs (for example,
full-duplex UART: one transmits while the other receives) stay on one time axis; if both change
one pin in the same cycle, sequencer A wins and the CONFLICT flag is set.

The full register map is in `docs/registers.md` (generated from `hw/regmap.ml`). A sequencer
that meets an illegal or reserved instruction halts with TRAP (STATUS bit 7); the debug register
shows the address.

Programs are written in FIPE assembly (`examples/*.s`, assembled by `fasm`). Example programs:
I2C (EEPROM write with ACK polling), SPI (READ ID, with normal and late sampling), UART (echo,
115200 baud), open-drain rise time, and three protocols the chip was not designed for: WS2812
LEDs, 1-Wire (READ ROM) and JTAG (IDCODE).

## How to test

Control is over SPI, mode 0, SCK at most clk/8 for reads. Each transaction is an 8-bit command
(bit 7 = write, bits 6..0 = register) followed by 32 data bits, MSB first. Read register 0x7F: it
returns 0x46495045 ("FIPE"). The full register map is in `hw/tt_top.ml`.

To run a program:

1. Assemble it: `dune exec bin/fasm.exe -- asm examples/uart_echo.s -o uart_echo.hex`.
2. Write each hex word to registers 0x00, 0x01, ... (program memory, 64 words).
3. Set PINS (0x41): data pin [2:0], clock pin [5:3], input pin [8:6], auxiliary pin [11:9].
4. Push any data the program pulls into the FIFO (0x43), then write 1 to CTRL (0x40).
   For sequencer B: its pins at 0x64, its start address in ENTRY (0x47, bits 13..8, from
   `fasm labels`; B runs from the upper half of program memory, 32-63, placed with `.org 32`),
   its FIFO at 0x66; CTRL bit 3 starts it (bits 0 and 3 together start both
   in the same cycle). B's status is at 0x65 and its samples at 0x67.
5. Poll STATUS (0x44) until halted; read sampled bits from SAMPLES (0x45).

Debug registers 0x60 to 0x63 show the program counter, run state, flag, queue count, the
schedule time S, the timebase T, and X and Y, for bringing up real silicon. The design is
reloaded after reset or reselection: flops do not start at zero.

## External hardware

Depends on the protocol: an I2C device with 4.7 kOhm pull-ups to 3.3 V on uio[0]/uio[1]; an
SPI flash on uio[0..3] (MOSI, SCLK, MISO, CS); a UART device; WS2812 LEDs; a 1-Wire device with a
pull-up; or a JTAG target. A logic analyzer on uo_out helps: TRIG_OUT pulses on every monitor
violation, and the status pins show halted, late, order and sampled bits.
