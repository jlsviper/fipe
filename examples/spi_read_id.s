; SPI master, mode 0: READ ID (0x9F) from a flash or sensor, 24-bit answer.
;
; Pins: data = MOSI, clock = SCLK, input = MISO, auxiliary = CS.
; Prescale x1: dt in core cycles (20 ns at 50 MHz). SCLK = 50 MHz / (2*HALF).
; Host FIFO: 0x9F000000. The last 24 bits of the sample log are the ID.

        .equ  HALF, 10                 ; SCLK half period: 2.5 MHz

        set   coder, nrz               ; push-pull
        set   prescale, x1
        evt   0, data, aux1            ; CS high
        evt   1, clk, drive0           ; SCLK idles low (CPOL = 0)
        evt   1, data, drive0          ; one event per cycle while setting up
        dly   20
        evt   0, data, aux0            ; CS low
        pull
        set   x, 31                    ; 32 bits: command, then 24 in
bit:    evt   0, data, shift           ; MOSI valid half a period early
        evt   HALF, clk, toggle        ; rising edge: both sides sample
        evt   0, data, sample          ; MISO
        evt   HALF, clk, toggle        ; falling edge: both sides change
        jmp   x--, bit
        evt   HALF, data, aux1         ; CS high
        halt
