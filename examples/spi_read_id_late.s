; SPI master, mode 0, with late sampling: MISO is sampled on the FALLING edge,
; which gains half a cycle for the round trip through the slave and roughly
; doubles the usable read rate. MOSI changes one cycle after each falling
; edge, so no cycle holds more than two events.
;
; Pins as in spi_read_id.s. Host FIFO: 0x9F000000.

        .equ  HALF, 10
        .equ  HALF_M1, 9

        set   coder, nrz
        set   prescale, x1
        evt   0, data, aux1            ; CS high
        evt   1, clk, drive0           ; SCLK idles low
        evt   1, data, drive0
        dly   20
        evt   0, data, aux0            ; CS low
        pull
        evt   0, data, shift           ; first bit
        set   x, 31
bit:    evt   HALF_M1, clk, toggle     ; rising edge
        evt   HALF, clk, toggle        ; falling edge
        evt   0, data, sample          ; sample MISO on the falling edge
        evt   1, data, shift           ; next MOSI bit
        jmp   x--, bit
        evt   HALF, data, aux1         ; CS high
        halt
