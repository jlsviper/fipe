<!---
This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.
-->

## How it works

FIPE is a programmable protocol emulator that audits both sides of the wire from one timing spec.

Two ideas set the hardware apart. First, timing comes from data, not instruction count: a
sequencer computes timestamped pin events and commits them, fully resolved, into an event queue;
only a shared 24-bit timebase decides when a pin moves, so branches and stalls never shift an edge.
Per-class skew registers (K1 to K3) move chosen edges by exact amounts, which is how the chip
injects timing faults on purpose. Second, four timing-monitor slots, compiled from the same
protocol spec as the offline checker, watch the bus and flag when the attached device breaks a
rule, recording the tightest and loosest intervals they see.

Everything is controlled over an SPI port: load a program, push data, set skews, configure the
monitors, start, and read back status, sampled bits and monitor results. Protocol pins are uio[7:0];
open-drain behaviour (for I2C) comes from the output enable.

## How to test

SPI mode 0, SCK at most clk/8 for reads. Each transaction is an 8-bit command (bit 7 = write,
bits 6..0 = register) followed by 32 data bits, MSB first. Read register 0x7F: it returns
0x46495045 ("FIPE"). The full register map is in hw/tt_top.ml.

To write an I2C EEPROM: load the I2C firmware into registers 0x00 to 0x26, push the address,
memory address, data and address bytes to 0x43, set PINS (0x41) to data pin 0 and clock pin 1,
write 1 to CTRL (0x40), wait for HALTED, then read SAMPLES (0x45): 0001 means three ACKs and a
busy NACK, which proves the write started.

## External hardware

An I2C device (for example a 24C02 EEPROM) on uio[0] (SDA) and uio[1] (SCL), with 4.7 kOhm
pull-ups to the I/O supply. A logic analyzer on uo_out is helpful: TRIG_OUT pulses on every
monitor violation.
