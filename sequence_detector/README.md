# Sequence Detector

Design a module that, given a stream of input bits, pulses a 1 on the output `dout` whenever a b1010 sequence is detected on the input `din`.

When the reset-low signal `resetn` goes active, the module should ignore all previously seen bits when searching for b1010. If two sequences overlap (b101010), `dout` should pulse for both.

Examples:

1. Input sequence 1,0,1,0 produces a single pulse on `dout` when the final 0 arrives (detecting b1010).
2. Input sequence 1,0,1,0,1,0 contains overlapping b1010 patterns; `dout` pulses on both zeros corresponding to the two detections.

SystemVerilog module:

```systemverilog
module seq_detector (
    input  logic clk,
    input  logic resetn,
    input  logic din,
    output logic dout
);

endmodule
```
