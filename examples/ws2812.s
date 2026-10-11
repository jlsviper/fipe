; WS2812 / NeoPixel LEDs: a protocol this chip was not designed for.
;
; Each bit is one 1.2 us slot of three 400 ns thirds: high, then the bit
; value, then low. So a 0 is high for 400 ns and a 1 is high for 800 ns,
; encoded on chip by three timed events, with no bit expansion by the host.
;
; Pins: data = DIN (push-pull). Prescale x1: dt in cycles (20 ns at 50 MHz).
; Host FIFO: one word per LED, 24-bit GRB colour in bits 31..8, MSB first.
; The line is held low for over 280 us before the first bit (so the LEDs
; discard anything seen while the pin was still released at power-up) and
; after the last bit (so they latch).

        .equ  LEDS_M1, 2               ; LEDs in the chain, minus one
        .equ  THIRD, 20                ; 400 ns

        set   coder, nrz               ; push-pull
        set   prescale, x1
        evt   0, data, drive0
        dly   4000                     ; reset first: low for 4 x 80 us = 320 us
        dly   4000
        dly   4000
        dly   4000
        set   y, LEDS_M1
led:    pull
        set   x, 23                    ; 24 bits per LED
bit:    evt   THIRD, data, drive1      ; rise
        evt   THIRD, data, shift       ; stays high for a 1, falls for a 0
        evt   THIRD, data, drive0      ; fall
        jmp   x--, bit
        jmp   y--, led
        dly   4000                     ; reset: low for 4 x 80 us = 320 us
        dly   4000
        dly   4000
        dly   4000
        evt   1, data, drive0          ; mark the end of the reset period
        halt
