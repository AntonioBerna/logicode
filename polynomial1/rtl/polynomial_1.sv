// The original polynomial is y = x^2 + 2x + 1, which requires 3 multiplications (x*x, 2*x, and 1*1).
// Factors the polynomial y = (x + 1)^2 to reduce the number of multiplications from 3 to 1.
// The input x is signed 8-bit, this means it can represent values from -128 to 127.
// If x = 127, then x + 1 = 128, which cannot be represented in 8 bits.
// Therefore, we need to use a wider type (9 bits) to store x + 1.
// We use {x[7], x} to sign-extend x to 9 bits, and then add 1 to it.
// Finally y is signed 16-bit, and it can represent values from -32768 to 32767.
// The multiplication of two 9-bit numbers can produce an 18-bit result.
// But, the maximum value of (x + 1)^2 is 128^2 = 16384, which can be represented in 16 bits,
// so we can safely assign the result to y without overflow.
module polynomial_1 (
    input  logic signed [ 7:0] x,
    output logic signed [15:0] y
);
  logic signed [8:0] x_plus_one;

  assign x_plus_one = {x[7], x} + 9'sd1;
  assign y = x_plus_one * x_plus_one;
endmodule
