# FIPE host register map

Generated from `hw/regmap.ml` by `bin/gen_verilog.ml`; do not edit by hand.
Access is over the host SPI port: an 8-bit command (bit 7 = write, bits 6..0 =
address) and 32 data bits, MSB first, SPI mode 0.

| Address | Name | Access | Contents |
| --- | --- | --- | --- |
| 0x00 | PROGRAM | W | Program memory, 0x00-0x3F: one 16-bit instruction word per address (data bits 15..0). Sequencer B fetches from 0x20-0x3F. |
| 0x40 | CTRL | W | Bit 0 start A, bit 1 clear monitors, bit 2 clear sample logs, bit 3 start B (bits 0 and 3 together start both in the same cycle), bit 4 clear FRAME. |
| 0x41 | PINS | RW | Sequencer A's pin roles: data pin [2:0], clock pin [5:3], input pin [8:6], auxiliary pin [11:9]. |
| 0x42 | SKEW | RW | Skew classes, signed cycles: K1 [7:0], K2 [15:8], K3 [23:16]. Shared by both sequencers. |
| 0x43 | FIFO | W | Push one word into sequencer A's 4-deep host data FIFO. |
| 0x44 | STATUS | R | [0] halted [1] late [2] order [3] window [6:4] queue count [7] TRAP (halted on an illegal or reserved instruction; DEBUG shows where) [10:8] FIFO count [21:16] samples logged [27:24] monitor violations (sticky) [28] ena [29] CONFLICT (A and B changed one pin in one cycle; A wins) [30] FRAME (a host SPI frame was not exactly 40 clocks; cleared by CTRL bit 4). |
| 0x45 | SAMPLES | R | Sequencer A's last 32 sampled bits, newest in bit 0. |
| 0x46 | INPUTS | R | IN0..IN4 levels [4:0]. |
| 0x47 | ENTRY | RW | Start addresses: sequencer A [5:0], sequencer B [13:8] (B runs from the upper half, 32..63). |
| 0x48 | MON0_A | RW | Monitor slot 0 triggers: [0] keep first [10:1] start [20:11] stop [21] abort enable [31:22] abort. Each trigger: [2:0] pin [4:3] edge (rise, fall, any) [5] qualifier enable [8:6] qualifier pin [9] qualifier level. |
| 0x49 | MON0_B | RW | Monitor slot 0 limits: min [15:0], max [31:16], in ticks. |
| 0x4A | MON0_C | RW | Monitor slot 0 options: [0] enable [1] min enable [2] max enable [3] start, [4] stop, [5] abort on device edges only (FIPE's driver released) [7:6] prescale: a tick every 1, 16, 256 or 4096 cycles. |
| 0x4B | MON1_A | RW | Monitor slot 1 triggers: [0] keep first [10:1] start [20:11] stop [21] abort enable [31:22] abort. Each trigger: [2:0] pin [4:3] edge (rise, fall, any) [5] qualifier enable [8:6] qualifier pin [9] qualifier level. |
| 0x4C | MON1_B | RW | Monitor slot 1 limits: min [15:0], max [31:16], in ticks. |
| 0x4D | MON1_C | RW | Monitor slot 1 options: [0] enable [1] min enable [2] max enable [3] start, [4] stop, [5] abort on device edges only (FIPE's driver released) [7:6] prescale: a tick every 1, 16, 256 or 4096 cycles. |
| 0x4E | MON2_A | RW | Monitor slot 2 triggers: [0] keep first [10:1] start [20:11] stop [21] abort enable [31:22] abort. Each trigger: [2:0] pin [4:3] edge (rise, fall, any) [5] qualifier enable [8:6] qualifier pin [9] qualifier level. |
| 0x4F | MON2_B | RW | Monitor slot 2 limits: min [15:0], max [31:16], in ticks. |
| 0x50 | MON2_C | RW | Monitor slot 2 options: [0] enable [1] min enable [2] max enable [3] start, [4] stop, [5] abort on device edges only (FIPE's driver released) [7:6] prescale: a tick every 1, 16, 256 or 4096 cycles. |
| 0x51 | MON3_A | RW | Monitor slot 3 triggers: [0] keep first [10:1] start [20:11] stop [21] abort enable [31:22] abort. Each trigger: [2:0] pin [4:3] edge (rise, fall, any) [5] qualifier enable [8:6] qualifier pin [9] qualifier level. |
| 0x52 | MON3_B | RW | Monitor slot 3 limits: min [15:0], max [31:16], in ticks. |
| 0x53 | MON3_C | RW | Monitor slot 3 options: [0] enable [1] min enable [2] max enable [3] start, [4] stop, [5] abort on device edges only (FIPE's driver released) [7:6] prescale: a tick every 1, 16, 256 or 4096 cycles. |
| 0x58 | MON0_SEEN | R | Monitor slot 0: smallest interval measured [15:0], largest [31:16]. |
| 0x59 | MON1_SEEN | R | Monitor slot 1: smallest interval measured [15:0], largest [31:16]. |
| 0x5A | MON2_SEEN | R | Monitor slot 2: smallest interval measured [15:0], largest [31:16]. |
| 0x5B | MON3_SEEN | R | Monitor slot 3: smallest interval measured [15:0], largest [31:16]. |
| 0x5C | MON_COUNTS | R | Intervals measured, saturating at 255: slot s in bits [8s+7:8s]. |
| 0x60 | DEBUG | R | Sequencer A: [5:0] program counter [6] running [7] halted [8] flag [14:12] queue count. |
| 0x61 | DEBUG_S | R | Sequencer A's schedule time S [23:0]. |
| 0x62 | DEBUG_T | R | The timebase T [23:0]. |
| 0x63 | DEBUG_XY | R | Sequencer A: X [15:0], Y [31:16]. |
| 0x64 | PINS_B | RW | Sequencer B's pin roles, laid out as PINS. |
| 0x65 | STATUS_B | R | Sequencer B's halted, late, order, window, queue count, TRAP, FIFO count and samples logged, in STATUS's layout; [29] CONFLICT. |
| 0x66 | FIFO_B | W | Push one word into sequencer B's 4-deep host data FIFO. |
| 0x67 | SAMPLES_B | R | Sequencer B's last 32 sampled bits, newest in bit 0. |
| 0x68 | DEBUG_B | R | Sequencer B, laid out as DEBUG. |
| 0x69 | DEBUG_B_S | R | Sequencer B's schedule time S [23:0]. |
| 0x6A | DEBUG_B_XY | R | Sequencer B: X [15:0], Y [31:16]. |
| 0x7F | ID | R | 0x46495045, ASCII "FIPE". |
