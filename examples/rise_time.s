; Open-drain rise time: hold the line low, release it, and sample it k3
; cycles later. The host sweeps k3 (SKEW register bits 23..16) to find the
; first sample that reads high; a no-load run calibrates out fixed latency.
;
; Pins: data = the line under test, input = the same line. Prescale x1.

        set   coder, opendrain
        evt   0, data, drive0
        dly   100                      ; 2 us: fully discharged
        evt   0, data, release
        evt   0, data, sample, k3      ; at release + k3 cycles
        halt
