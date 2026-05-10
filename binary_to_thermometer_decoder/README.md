# Binary to Thermometer Decoder

Thermometer (a.k.a. unary) coding is frequently used in digital systems applications to represent a natural number.
In a thermometer code, a binary number is represented by a $2^N$-bit digital word with value $m$, which has $m$ zeros followed by $(N − m)$ ones or vice-versa.

In this question, implement a binary to thermometer decoder module, where the input `din` is a binary word, and the output `dout` is the thermometer code representation of the input at any time.

Examples:

1. When `din = 0`, `dout` is one-hot with a single 1 at bit 0.
2. When `din = 5`, bits `dout[5:0]` are 1 and the rest are 0 (thermometer up to bit 5).

SystemVerilog module:

```systemverilog
module bin_to_thermo #(
    parameter DIN_WIDTH = 8
) (
    input logic [DIN_WIDTH-1:0] din,
    output logic [2**DIN_WIDTH-1:0] dout
);

endmodule
```
