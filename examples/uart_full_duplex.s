; UART full duplex on two sequencers: A transmits while B receives, at the
; same time, on one shared time base. A single sequencer can only alternate.
;
; Run A from address 0 and B from the label rx (ENTRY register), started in
; the same cycle (CTRL bits 0 and 3 together). Sequencer B fetches from the
; upper half of program memory, so its code starts at .org 32.
; Pins: A's data pin = TX (push-pull, idle high); B's input pin = RX. Give B's
; data and clock pins unused pin numbers: B only samples.
; Host FIFO A: one word per byte, bit-reversed into bits 31..24 (LSB first).
; Sample log B: per byte, 8 data bits (LSB first), then the stop bit.
; 115200 baud at 50 MHz = 434 cycles per bit.

        .equ  BYTES_M1, 2
        .equ  TX_BIT_M1, 433           ; bit - 1 (the EVT adds the last cycle)
        .equ  RX_FIRST, 651            ; 1.5 bits: middle of data bit 0
        .equ  RX_BIT, 434

; ---- sequencer A: transmit, bytes back to back -----------------------------
tx:     set   coder, nrz
        set   prescale, x1
        evt   0, data, drive1          ; idle high
        set   y, BYTES_M1
txbyte: pull
        set   x, 7
        dly   TX_BIT_M1
        evt   1, data, drive0          ; start bit
txbit:  dly   TX_BIT_M1
        evt   1, data, shift
        jmp   x--, txbit
        dly   TX_BIT_M1
        evt   1, data, drive1          ; stop bit
        jmp   y--, txbyte
        dly   TX_BIT_M1                ; let the last stop bit finish
        evt   1, data, drive1
        halt

; ---- sequencer B: receive, concurrently -------------------------------------
        .org  32
rx:     set   y, BYTES_M1
rxbyte: wait  in, low                  ; a start bit
        set   x, 7
        dly   RX_FIRST
        evt   0, data, sample
rxbit:  dly   RX_BIT
        evt   0, data, sample          ; 7 more data bits, then the stop bit
        jmp   x--, rxbit
        jmp   y--, rxbyte
        halt
