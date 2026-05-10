# Polynomial 1

Design a module that computes $y$ as $$x^2 + 2x + 1$$

Examples:

1. With $x = 3$, $y = (3^2 + 2 \cdot 3 + 1) = 16$.
2. With $x = -2$, $y = ((-2)^2 + 2 \cdot (-2) + 1) = 1$.

SystemVerilog module:

```systemverilog
module polynomial_1 (
    input  logic signed [ 7:0] x,
    output logic signed [15:0] y
);

endmodule
```
