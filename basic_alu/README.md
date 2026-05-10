# Basic ALU

Design a module that acts as an Arithmetic Logic Unit (ALU) and performs a set of operations on input operands `a` and `b`.
The outputs of each operation are sent to the corresponding output signal - `a_plus_b`, `a_minus_b`, `not_a`, `a_and_b`, `a_or_b`, and `a_xor_b`.

The ALU is an important part of many modern computing systems.
Conventional ALUs receive two operands from an external control unit, as well as an opcode which determines the type of calculation to perform.
For this question, we've simplified the behavior such that the ALU produces all outputs at once.

Examples:

1. With `a = 10` and `b = 3`, outputs show `a_plus_b = 13`, `a_minus_b = 7`, `not_a = -11`, `a_and_b = 2`, `a_or_b = 11`, and `a_xor_b = 9`.
2. With unsigned `a = 0xFFFF_0000` and `b = 0x000F_F0F0`, sum overflows.

SystemVerilog module:

```systemverilog
module alu (
    input  logic [31:0] a,
    input  logic [31:0] b,
    output logic [31:0] a_plus_b,
    output logic [31:0] a_minus_b,
    output logic [31:0] not_a,
    output logic [31:0] a_and_b,
    output logic [31:0] a_or_b,
    output logic [31:0] a_xor_b
);

endmodule
```
