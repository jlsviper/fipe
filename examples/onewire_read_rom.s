; 1-Wire: reset, presence detect, READ ROM (0x33), 64-bit device ID.
; Another protocol this chip was not designed for.
;
; Pins: data = the 1-Wire line (open-drain, external pull-up), input = the
; same line. Prescale x1: 50 cycles per microsecond at 50 MHz.
; Host FIFO: 0x33 bit-reversed into bits 31..24 (1-Wire is LSB first).
; Sample log: the presence bit (0 = a device answered), then 64 ROM bits,
; LSB first: family code, 48-bit serial, CRC-8.
;
; Presence uses a schedule-synchronous JMP PIN: the pin is read exactly 70 us
; after the reset pulse ends, however far ahead the sequencer runs. With no
; device, the program halts at "absent" (the host sees it in DEBUG pc).

        set   coder, opendrain
        evt   0, data, release
        dly   100
        evt   1, data, drive0          ; reset pulse: 480 us low
        dly   4000
        dly   4000
        dly   4000
        dly   4000
        dly   4000
        dly   4000
        evt   1, data, release
        dly   3500                     ; 70 us later:
        evt   0, data, sample          ; log the presence bit
        jmp   pin, absent              ; still high: nobody answered
        dly   4000                     ; finish the 480 us reset period
        dly   4000
        dly   4000
        dly   4000
        dly   4000
        dly   500
        pull                           ; command 0x33, READ ROM
        set   x, 7
wbit:   evt   1, data, drive0          ; write slot: low...
        dly   249
        evt   1, data, shift           ; ...5 us: release for a 1, stay low for a 0
        dly   2999
        evt   1, data, release         ; 65 us
        dly   249                      ; recovery
        jmp   x--, wbit
        set   x, 63                    ; 64 read slots
rbit:   evt   1, data, drive0          ; read slot: 3 us low
        dly   149
        evt   1, data, release
        dly   449
        evt   1, data, sample          ; 12 us: the device holds the line low for a 0
        dly   2899
        jmp   x--, rbit
        halt
absent: halt
