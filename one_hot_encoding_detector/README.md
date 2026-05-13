# One Hot Encoding Detector

Design a module that outputs 1 if the input `din` is a one-hot value, and outputs 0 otherwise.
One-hot values have a single bit that is a 1 with all other bits being 0.

Examples:

1. With `din = 0x0000_0001`, exactly one bit is high so `onehot = 1`.
2. With `din = 0x0000_0011`, two bits are high so `onehot = 0` (not one-hot).

SystemVerilog module:

```systemverilog
module one_hot #(
    parameter DATA_WIDTH = 32
) (
    input logic [DATA_WIDTH-1:0] din,
    output logic onehot
);

endmodule
```
