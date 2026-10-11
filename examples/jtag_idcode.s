; JTAG: read a device's 32-bit IDCODE. A protocol this chip was not designed
; for: the four JTAG signals map onto the four pin roles.
;
; Pins: clock = TCK, data = TDI, auxiliary = TMS, input = TDO.
; Prescale x1: TCK = 50 MHz / (2*HALF). TMS and TDI change with TCK's falling
; edge; the device steps its TAP state machine and samples them on the rising
; edge, and changes TDO on the falling edge; we sample TDO on the rising edge.
; Sample log: 32 bits, LSB first. IDCODE bit 0 is always 1.

        .equ  HALF, 10                 ; TCK 2.5 MHz

        set   coder, nrz
        set   prescale, x1
        evt   0, clk, drive0           ; TCK low
        evt   1, data, drive0          ; TDI low
        evt   1, data, aux1            ; TMS high
        set   x, 4
rst:    evt   HALF, clk, toggle        ; five TCKs with TMS high:
        evt   HALF, clk, toggle        ; Test-Logic-Reset from any state
        jmp   x--, rst
        evt   0, data, aux0            ; TMS 0
        evt   HALF, clk, toggle
        evt   HALF, clk, toggle        ; -> Run-Test/Idle
        evt   0, data, aux1            ; TMS 1
        evt   HALF, clk, toggle
        evt   HALF, clk, toggle        ; -> Select-DR-Scan
        evt   0, data, aux0            ; TMS 0
        evt   HALF, clk, toggle
        evt   HALF, clk, toggle        ; -> Capture-DR
        evt   HALF, clk, toggle
        evt   HALF, clk, toggle        ; -> Shift-DR (IDCODE captured)
        set   x, 30
shift:  evt   HALF, clk, toggle        ; rising edge:
        evt   0, data, sample          ; sample TDO
        evt   HALF, clk, toggle
        jmp   x--, shift               ; 31 bits
        evt   0, data, aux1            ; TMS 1 on the last bit
        evt   HALF, clk, toggle
        evt   0, data, sample          ; bit 31; -> Exit1-DR
        evt   HALF, clk, toggle
        evt   HALF, clk, toggle
        evt   HALF, clk, toggle        ; -> Update-DR
        halt
