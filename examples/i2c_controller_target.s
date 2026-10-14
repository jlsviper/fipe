; I2C controller and target on one chip: sequencer A writes three bytes as the
; controller while sequencer B acts as the target, acknowledging each byte and
; logging every bit it receives. The two run concurrently on one time base.
;
; Wiring: A uses pins 0 (SDA) and 1 (SCL); B uses pins 2 (SDA) and 3 (SCL).
; Join pin 0 to pin 2 and pin 1 to pin 3 outside the chip, with pull-ups: a
; real wired-AND bus between two independent drivers.
;   A pins: data 0, clock 1, input 0.   B pins: data 2, clock 3, input 2.
; Start A at 0 and B at the label target, in the same cycle (CTRL bits 0, 3).
; Host FIFO A: address<<1, then two data bytes (bits 31..24).
; Sample log A: the three ACKs as the controller saw them (0 = ACK).
; Sample log B: the 24 bits the target received, MSB first.
;
; The target acknowledges every byte (there is no compare instruction; the
; host checks the address byte in B's log). Its acknowledge delay is one DLY,
; so the same program can play a fast, slow or misbehaving device: sweeping it
; finds the controller's ACK sampling point.

        .equ  BYTES_M1, 2              ; bytes in the write, minus one
        .equ  T_VD, 20                 ; target: SCL fall to ACK, cycles (400 ns; >= 2)
        .equ  T_HD, 10                 ; target: ACK held after SCL falls (200 ns)

; ---- sequencer A: controller, standard mode (100 kHz) -------------------------
ctl:    set   coder, opendrain
        set   prescale, x4             ; 80 ns per dt unit
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
        halt

; ---- sequencer B: target (upper half of program memory) -----------------------
        .org  32
target: set   y, BYTES_M1
        evt   0, data, release         ; never hold the bus by default
        wait  data, low                ; START: SDA falls on an idle bus
        wait  clk, low
tbyte:  set   x, 7
tbit:   wait  clk, high                ; SDA is stable while SCL is high
        evt   2, data, sample          ; not 0: a WAIT ends with S = now, and an
                                       ; event due now is issued a cycle late (LATE)
        wait  clk, low
        jmp   x--, tbit
        dly   T_VD                     ; the acknowledge delay (12-bit range)
        evt   0, data, drive0          ; ACK
        wait  clk, high                ; the ninth clock
        wait  clk, low
        evt   T_HD, data, release
        jmp   y--, tbyte
        halt
