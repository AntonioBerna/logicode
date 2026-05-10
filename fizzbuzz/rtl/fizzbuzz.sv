module fizzbuzz #(
    parameter int FIZZ = 3,
    parameter int BUZZ = 5,
    parameter int MAX_CYCLES = 100
) (
    input  logic clk,
    input  logic resetn,
    output logic fizz,
    output logic buzz,
    output logic fizzbuzz
);

  localparam int WIDTH = $clog2(MAX_CYCLES);
  logic [WIDTH-1:0] count;

  always_ff @(posedge clk) begin
    if (!resetn) begin
      count <= '0;
    end else begin
      if (count >= (MAX_CYCLES - 1)) begin
        count <= '0;
      end else begin
        count <= count + 1'b1;
      end
    end
  end

  always_comb begin
    fizz     = (count % FIZZ == 0);
    buzz     = (count % BUZZ == 0);
    fizzbuzz = (fizz && buzz);
  end

endmodule
