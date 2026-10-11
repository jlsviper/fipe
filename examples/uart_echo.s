; UART: send each byte, then receive the reply (an echo device), 8N1.
;
; Pins: data = TX (push-pull, idle high), input = RX. Prescale x1; every bit
; is a DLY plus a one-cycle EVT, so bit periods are exact to one cycle.
; 115200 baud at 50 MHz = 434 cycles per bit.
; Host FIFO: one word per byte, bit-reversed into bits 31..24 (UART is LSB
; first). Sample log per reply: 8 data bits (LSB first), then the stop bit.
;
; Receive uses WAIT, which starts watching only once real time has caught up
; with the schedule, then resynchronizes the schedule to the start edge.

        .equ  BYTES_M1, 1
        .equ  TX_IDLE, 435             ; bit + 1: a short idle before each start
        .equ  TX_BIT_M1, 433           ; bit - 1 (the EVT adds the last cycle)
        .equ  RX_FIRST, 651            ; 1.5 bits: middle of data bit 0
        .equ  RX_BIT, 434

        set   coder, nrz
        set   prescale, x1
        evt   0, data, drive1          ; idle high
        set   y, BYTES_M1
byte:   pull
        set   x, 7
        dly   TX_IDLE
        evt   1, data, drive0          ; start bit
tx_bit: dly   TX_BIT_M1
        evt   1, data, shift
        jmp   x--, tx_bit
        dly   TX_BIT_M1
        evt   1, data, drive1          ; stop bit
        wait  in, low                  ; the reply's start bit
        set   x, 7
        dly   RX_FIRST
        evt   0, data, sample
rx_bit: dly   RX_BIT
        evt   0, data, sample          ; 7 more data bits, then the stop bit
        jmp   x--, rx_bit
        jmp   y--, byte
        halt
