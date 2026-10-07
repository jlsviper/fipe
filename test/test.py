# SPDX-FileCopyrightText: © 2026 Jack
# SPDX-License-Identifier: Apache-2.0
#
# Smoke test for the Tiny Tapeout flow; it also runs on the gate-level netlist.
# The real regression is in OCaml (tests/, dune runtest), which checks the RTL
# cycle for cycle against the checker's models. This test proves the chip is
# alive through its pins: SPI works, registers work, and a tiny program drives
# a protocol pin.

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

HALF = 4  # SCK half period in core cycles (SCK = clk/8)


async def spi(dut, cmd, data=0):
    """One transaction: 8-bit command, 32 data bits. Returns the 32 bits read."""
    ui = 0b010  # CS_n high, SCK low
    dut.ui_in.value = ui
    ui &= ~0b010  # CS_n low
    dut.ui_in.value = ui
    await ClockCycles(dut.clk, HALF)
    word = (cmd << 32) | data
    got = 0
    for k in range(40):
        bit = (word >> (39 - k)) & 1
        ui = (ui & ~0b100) | (bit << 2)
        dut.ui_in.value = ui
        await ClockCycles(dut.clk, HALF)
        if k >= 8:
            got = (got << 1) | ((int(dut.uo_out.value) >> 7) & 1)
        dut.ui_in.value = ui | 1  # SCK high
        await ClockCycles(dut.clk, HALF)
        dut.ui_in.value = ui
    await ClockCycles(dut.clk, HALF)
    dut.ui_in.value = 0b010
    await ClockCycles(dut.clk, HALF)
    return got


async def write(dut, addr, data):
    await spi(dut, 0x80 | addr, data)


async def read(dut, addr):
    return await spi(dut, addr)


@cocotb.test()
async def test_project(dut):
    clock = Clock(dut.clk, 20, unit="ns")  # 50 MHz
    cocotb.start_soon(clock.start())

    dut.ena.value = 1
    dut.ui_in.value = 0b010
    dut.uio_in.value = 0xFF  # pulled up
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 10)

    ident = await read(dut, 0x7F)
    dut._log.info(f"ID = {ident:#010x}")
    assert ident == 0x46495045, "ID register should read 'FIPE'"

    await write(dut, 0x41, 0b001_000)  # data pin 0, clock pin 1
    assert await read(dut, 0x41) == 0b001_000

    # Program: drive P0 low 10 cycles after start-up lead, release it 8 later, halt.
    #   EVT dt=10 data cls0 Drive0  -> 0x1280
    #   EVT dt=8  data cls0 Release -> 0x1202
    #   JMP always to itself (addr 2) -> 0x4002
    for addr, word in enumerate([0x1280, 0x1202, 0x4002]):
        await write(dut, addr, word)
    await write(dut, 0x40, 1)  # start

    saw_low = False
    for _ in range(400):
        await ClockCycles(dut.clk, 1)
        if (int(dut.uio_oe.value) & 1) and not (int(dut.uio_out.value) & 1):
            saw_low = True
    assert saw_low, "P0 should have been driven low"
    assert int(dut.uio_oe.value) & 1 == 0, "P0 should be released again"

    status = await read(dut, 0x44)
    dut._log.info(f"STATUS = {status:#010x}")
    assert status & 1 == 1, "sequencer should have halted"
    assert status & 0b1110 == 0, "no late, order or window faults"
