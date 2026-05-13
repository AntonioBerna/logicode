# Bubble Sort

Design a module that implements the bubble sort algorithm within one cycle.
The module takes `din`, an unsigned word; `sortit`, a signal asserted to start a new sort operation; and `resetn`, a synchronous active-low reset.
The output `dout` is a concatenated vector of 8 unsigned words captured in the module's memory when `sortit` is asserted.

Input `sortit` is asynchronous from another module, so assume there is no need to flop it.
Inputs are registered only when `sortit = 1`; otherwise `dout` must be 0.
The output vector is sorted in descending order: the most significant chunk corresponds to the smallest value, while the least significant chunk corresponds to the largest value.

During reset, `dout` must be 0.

Examples:

1. Load values `3,1,7,0,6,2,5,4` then assert `sortit`; `dout` outputs the 8 values sorted descending in 3-bit chunks.
2. Load values `4,4,2,7,1,3,0,6` with duplicates; after `sortit`, `dout` shows the multiset sorted descending.

SystemVerilog module:

```systemverilog
module bubble_sort #(
    parameter BITWIDTH = 3
) (
    input logic [BITWIDTH-1:0] din,
    input logic sortit,
    input logic clk,
    input logic resetn,
    output logic [8*BITWIDTH:0] dout
);

endmodule
```
