module dot_prod (
    input  logic [ 7:0] din,
    input  logic        clk,
    input  logic        resetn,
    output logic [17:0] dout,
    output logic        run
);

  // Internal registers to hold vector components
  logic [7:0] a1, a2, a3, b1, b2;
  logic [2:0] count;

  always_ff @(posedge clk) begin
    if (!resetn) begin
      // Synchronous reset: internal registers cleared
      count <= 3'd0;
      dout  <= 18'd0;
      run   <= 1'b1; // When resetn returns high, run is asserted
      a1    <= 8'd0;
      a2    <= 8'd0;
      a3    <= 8'd0;
      b1    <= 8'd0;
      b2    <= 8'd0;
    end else begin
      case (count)
        3'd0: begin
          a1    <= din;
          run   <= 1'b0; // De-assert run as soon as new data starts
          count <= 3'd1;
        end
        3'd1: begin
          a2    <= din;
          count <= 3'd2;
        end
        3'd2: begin
          a3    <= din;
          count <= 3'd3;
        end
        3'd3: begin
          b1    <= din;
          count <= 3'd4;
        end
        3'd4: begin
          b2    <= din;
          count <= 3'd5;
        end
        3'd5: begin
          // Capture b3 (din) and compute result
          // Note: a1*b1 + a2*b2 + a3*b3
          dout  <= (a1 * b1) + (a2 * b2) + (a3 * din);
          run   <= 1'b1;  // Assert run now that dout is valid
          count <= 3'd0;  // Wrap around for next vector
        end
        default: count <= 3'd0;
      endcase
    end
  end

endmodule
