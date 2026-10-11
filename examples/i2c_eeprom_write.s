; I2C master: write one byte to a 24-series EEPROM, then prove the write
; started by addressing the part again (a busy EEPROM NACKs: "ACK polling").
;
; Pins: data = SDA, clock = SCL, input = SDA. Open-drain, prescale x4 (80 ns
; per dt unit at 50 MHz), standard mode (100 kHz).
; Host FIFO: address<<1, memory address, data, address<<1 (bits 31..24).
; Sample log after a good write: 0 0 0 1 (three ACKs, then the busy NACK).
;
; Skew classes for characterization: k1 = SCL edges, k2 = SDA data edges,
; k3 = START/STOP edges, k0 = never skewed. Each knob direction shortens
; exactly one I2C rule (see the measured-datasheet sweep).

        .equ  BYTES_M1, 2              ; bytes in the write, minus one

        set   coder, opendrain
        set   prescale, x4
        set   y, BYTES_M1
        evt   0, clk, release          ; idle: both lines high
        evt   0, data, release
        dly   60                       ; bus free time, t_BUF
        evt   0, data, drive0, k3      ; START: SDA falls while SCL is high
        evt   55, clk, drive0, k1      ; t_HD_STA = 4.4 us
byte:   pull
        set   x, 7
bit:    evt   10, data, shift, k2      ; t_HD_DAT = 0.8 us after SCL falls
        evt   52, clk, release, k1     ; t_SU_DAT = 4.16 us; t_LOW = 4.96 us
        evt   55, clk, drive0, k1      ; t_HIGH = 4.4 us
        jmp   x--, bit
        evt   10, data, release, k2    ; ACK clock: release SDA
        evt   52, clk, release, k1
        evt   27, data, sample         ; sample ACK mid-high
        evt   28, clk, drive0, k1
        jmp   y--, byte
        evt   10, data, drive0, k2     ; STOP
        evt   52, clk, release, k1
        evt   55, data, release, k3    ; SDA rises while SCL is high
        dly   60                       ; t_BUF, then poll
        evt   0, data, drive0, k3      ; START
        evt   55, clk, drive0, k1
        pull                           ; address again
        set   x, 7
pbit:   evt   10, data, shift, k2
        evt   52, clk, release, k1
        evt   55, clk, drive0, k1
        jmp   x--, pbit
        evt   10, data, release, k2
        evt   52, clk, release, k1
        evt   27, data, sample         ; 1 here = busy = the write started
        evt   28, clk, drive0, k1
        evt   10, data, drive0, k2     ; STOP
        evt   52, clk, release, k1
        evt   55, data, release, k3
        halt
