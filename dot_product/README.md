# Dot Product

Implement a module that produces the dot product (scalar product) of two length-3 vectors, A = [a1, a2, a3] and B = [b1, b2, b3].
The module has one port `din` for entering the input sequence and two outputs, `run` and `dout`, which return the computation status and dot product.

Assume inputs arrive in the following order: a1, a2, a3, b1, b2, b3.
Once the 6th number has been registered, run is asserted and dout returns the value $a_1 \cdot b_1 + a_2 \cdot b_2 + a_3 \cdot b_3$.
In subsequent cycles, run is de-asserted while dout holds its previous valid value until the next six inputs are captured.

On any rising edge of `clk`, if `resetn` is low, internal registers are cleared.
When `resetn` returns high, `run` is asserted and `dout` is 0.

Examples:

1. Inputs stream `1,2,3,4,5,6` (`A = [1,2,3]`, `B = [4,5,6]`); `run` asserts and `dout = 1*4 + 2*5 + 3*6 = 32`.
2. Inputs stream `9,8,7` then `resetn` clears state; next stream `7,0,2,3,8,1` yields `dout = 7*3 + 0*8 + 2*1 = 23`.

SystemVerilog module:

```systemverilog
module dot_prod (
    input logic [7:0] din,
    input logic clk,
    input logic resetn,
    output logic [17:0] dout,
    output logic run
);

endmodule
```
