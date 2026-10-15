; CAN 2.0A data frame at 500 kbit/s, with the chip doing the protocol work:
; bit stuffing (the complement after five equal bits) and CRC-15 in hardware.
; The bus is open drain: 0 is dominant (driven), 1 recessive (released).
;
; Pins: data = the CAN bus (through a transceiver), input = the same pin.
; Host FIFO: the CRC-15 configuration 0x4599E000 (polynomial 0x4599, width
; 15, zero start, not inverted); then start of frame, the 11-bit identifier,
; RTR, IDE, r0 and the 4-bit DLC as 19 bits, MSB first, in bits 31..13; then
; the data bytes, one per word in bits 31..24. DATA_M1 must match the DLC.
; Sample log: the ACK slot (0 = a receiver acknowledged the frame).
;
; Stuffing covers start of frame through the CRC; a stuff bit owed after the
; CRC's last bit goes out before the delimiter automatically.

        .equ  T, 25                    ; one bit: 25 units of 80 ns (100 cycles)
        .equ  DATA_M1, 1               ; data bytes, minus one

can:    set   coder, opendrain|stuff_can
        set   prescale, x4             ; 80 ns per dt unit
        evt   0, data, release         ; recessive
        pull                           ; the CRC configuration
        crc   reset
        dly   275                      ; bus idle: 11 recessive bits
        crc   feed_tx                  ; the CRC covers start of frame to the data
        pull                           ; start of frame to DLC
        set   x, 18
hdr:    evt   T, data, shift
        jmp   x--, hdr
        set   y, DATA_M1
byte:   pull
        set   x, 7
bit:    evt   T, data, shift
        jmp   x--, bit
        jmp   y--, byte
        crc   load_osr
        set   x, 14
crcb:   evt   T, data, shift
        jmp   x--, crcb
        evt   T, data, release         ; CRC delimiter (after any stuff bit owed)
        set   coder, opendrain         ; stuffing ends with the CRC
        evt   T, data, release         ; ACK slot: recessive from us
        evt   19, data, sample         ; 76% in: dominant if a receiver accepted
        evt   6, data, release         ; ACK delimiter
        dly   175                      ; end of frame: 7 recessive bits
        halt
