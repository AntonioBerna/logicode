# Fizzbuzz

Design a module that counts incrementally every clock cycle and determines whether or not the counter value is evenly divisible by parameters `FIZZ`, `BUZZ`, or both.

The counter value should monotonically increase when the reset signal `resetn` is de-asserted.
The counter sequence is expected to start from 0 and restart when `MAX_CYCLES` is reached.

Examples:

1. Counter wraps every 20 cycles; with `FIZZ = 3` and `BUZZ = 5`, `fizz` asserts on multiples of 3, `buzz` on multiples of 5, and `fizzbuzz` on multiples of 15.

SystemVerilog module:

```systemverilog
module fizzbuzz #(
    parameter FIZZ = 3,
    BUZZ = 5,
    MAX_CYCLES = 100
) (
    input  logic clk,
    input  logic resetn,
    output logic fizz,
    output logic buzz,
    output logic fizzbuzz
);

endmodule
```
