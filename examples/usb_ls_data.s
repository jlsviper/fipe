; USB low-speed (1.5 Mbit/s) DATA0 packet, with the chip doing the line
; coding: NRZI, bit stuffing and CRC16 in hardware. Sequencer A drives D+ and
; sequencer B drives D-; both run the same instruction stream from opposite
; idle levels, so NRZI (which encodes transitions) makes them an exact
; differential pair. Start both in the same cycle (CTRL bits 0 and 3).
;
; Pins: A data = D+ (pin 0); B data = D- (pin 1). Low speed idles in J:
; D+ low, D- high. 33 cycles per bit at 50 MHz is 1% fast (USB allows 1.5%).
; Host FIFO, the same words to A and to B: the CRC16 configuration
; 0x8005FC00 (polynomial 0x8005, width 16, all-ones start, inverted output),
; then SYNC (0x80) and the PID (DATA0, 0xC3), then the payload: one byte per
; word, LSB first (bit-reversed into bits 31..24). The CRC covers the payload.
; A stuff bit owed after the CRC's last bits goes out before the end of
; packet automatically.

        .equ  T, 33                    ; cycles per bit
        .equ  PAYLOAD_M1, 4            ; payload bytes, minus one

; ---- sequencer A: D+ ------------------------------------------------------------
dp:     set   coder, nrzi|stuff_usb
        set   prescale, x1
        evt   0, data, drive0          ; idle J: D+ low
        pull                           ; the CRC configuration
        crc   reset
        dly   200
        set   y, 1                     ; SYNC and PID: not in the CRC
dphdr:  pull
        set   x, 7
dphb:   evt   T, data, shift
        jmp   x--, dphb
        jmp   y--, dphdr
        crc   feed_tx
        set   y, PAYLOAD_M1
dpby:   pull
        set   x, 7
dpbit:  evt   T, data, shift
        jmp   x--, dpbit
        jmp   y--, dpby
        crc   load_osr
        set   x, 15
dpcrc:  evt   T, data, shift
        jmp   x--, dpcrc
        evt   T, data, drive0          ; end of packet: SE0 for two bits
        dly   T
        evt   T, data, drive0          ; then J: D+ stays low
        halt

; ---- sequencer B: D- (the same stream, opposite idle level) -----------------------
        .org  32
dm:     set   coder, nrzi|stuff_usb
        set   prescale, x1
        evt   0, data, drive1          ; idle J: D- high
        pull
        crc   reset
        dly   200
        set   y, 1
dmhdr:  pull
        set   x, 7
dmhb:   evt   T, data, shift
        jmp   x--, dmhb
        jmp   y--, dmhdr
        crc   feed_tx
        set   y, PAYLOAD_M1
dmby:   pull
        set   x, 7
dmbit:  evt   T, data, shift
        jmp   x--, dmbit
        jmp   y--, dmby
        crc   load_osr
        set   x, 15
dmcrc:  evt   T, data, shift
        jmp   x--, dmcrc
        evt   T, data, drive0          ; SE0: D- low too
        dly   T
        evt   T, data, drive1          ; then J: D- high
        halt
