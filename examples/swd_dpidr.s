; SWD host: line reset, then read the debug port's ID register (DPIDR), with
; the 3-bit acknowledge decoded on-chip by branching on the pin.
;
; Pins: data = SWDIO, clock = SWCLK, input = SWDIO. SWCLK = 1 MHz.
; Host FIFO: the request byte, LSB first (bit-reversed into bits 31..24); a
; DPIDR read is 0xA5 (start, DP, read, A[3:2] = 0, parity 1, stop, park).
; Result: Y = 1 OK, 2 WAIT, 4 FAULT, 7 nothing answered (read from DEBUG_XY).
; Sample log after OK: the 32 DPIDR bits, LSB first. The parity bit is clocked
; but not checked on-chip (there is no XOR instruction): the host checks it.
;
; The SWD bus changes data while SWCLK is low; both sides sample on the
; rising edge, and the port drives its bits shortly after a rising edge, so
; the host samples them at the falling edge.

        .equ  H, 25                    ; half period, cycles
        .equ  RESET_M1, 55             ; 56 clocks with SWDIO high (>= 50)

swd:    set   coder, nrz
        set   prescale, x1
        evt   0, clk, drive0
        evt   0, data, drive1
        set   x, RESET_M1
lreset: evt   H, clk, drive1           ; line reset
        evt   H, clk, drive0
        jmp   x--, lreset
        evt   0, data, drive0          ; idle, SWDIO low
        set   x, 3
idle:   evt   H, clk, drive1
        evt   H, clk, drive0
        jmp   x--, idle
        pull                           ; the request
        set   x, 7
req:    evt   0, data, shift           ; set while SWCLK is low
        evt   H, clk, drive1           ; the port samples on the rising edge
        evt   H, clk, drive0
        jmp   x--, req
        evt   0, data, release         ; turnaround: the port will drive
        evt   H, clk, drive1
        evt   H, clk, drive0
        evt   H, clk, drive1           ; ACK bit 0
        evt   H, clk, drive0
        jmp   pin, a0                  ; read at the falling edge
        evt   H, clk, drive1           ; 0 . . : ACK bit 1
        evt   H, clk, drive0
        jmp   pin, wait_
        evt   H, clk, drive1           ; 0 0 . : ACK bit 2
        evt   H, clk, drive0
        set   y, 4                     ; FAULT
        jmp   fin
wait_:  evt   H, clk, drive1           ; 0 1 . : ACK bit 2
        evt   H, clk, drive0
        set   y, 2                     ; WAIT
        jmp   fin
a0:     evt   H, clk, drive1           ; 1 . . : ACK bit 1
        evt   H, clk, drive0
        jmp   pin, silent              ; 1 1 . : only the pull-up
        evt   H, clk, drive1           ; 1 0 . : ACK bit 2
        evt   H, clk, drive0
        set   x, 31
data:   evt   H, clk, drive1           ; DPIDR, LSB first
        evt   H, clk, drive0
        evt   0, data, sample
        jmp   x--, data
        evt   H, clk, drive1           ; parity (the host checks it)
        evt   H, clk, drive0
        set   y, 1                     ; OK
        jmp   fin
silent: set   y, 7
fin:    evt   H, clk, drive1           ; turnaround back to the host
        evt   H, clk, drive0
        evt   0, data, drive0          ; idle
        evt   H, clk, drive1
        evt   H, clk, drive0
        halt
