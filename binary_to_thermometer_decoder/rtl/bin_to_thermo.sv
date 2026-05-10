// For a given binary input `din`, the thermometer code output `dout` should
// have the first `din` bits set to 1 and the rest set to 0.
// This can be achieved by using the formula:
// dout = (1 << (din + 1)) - 1
// Explanation:
// 1. (1 << (din + 1)) shifts the binary 1 to the left by (din + 1) positions,
// creating a binary number with a single 1 followed by `din` zeros.
// 2. Subtracting 1 from this value turns all the bits to the right of the single
// 1 into 1's, resulting in a thermometer code where the first `din` bits are
// 1 and the rest are 0.
// Example:
// If din = 3 (binary 00000011), then:
// (1 << (3 + 1)) = (1 << 4) = 16 (binary 00010000)
// (1 << (3 + 1)) - 1 = 16 - 1 = 15 (binary 00001111), which is the correct
// thermometer code for an input of 3.
// This approach is efficient and leverages bitwise operations to generate
// the desired output in a single step.

module bin_to_thermo #(
    parameter int DIN_WIDTH = 8
) (
    input logic [DIN_WIDTH-1:0] din,
    output logic [2**DIN_WIDTH-1:0] dout
);
  assign dout = (1 << (din + 1)) - 1;
endmodule
