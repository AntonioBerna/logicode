module one_hot #(
    parameter int DATA_WIDTH = 32
) (
    input logic [DATA_WIDTH-1:0] din,
    output logic onehot
);

  always_comb begin
    onehot = (din != 0) && ((din & (din - 1)) == 0);
  end

endmodule
