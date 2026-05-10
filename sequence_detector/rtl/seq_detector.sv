module seq_detector (
    input  logic clk,
    input  logic resetn,
    input  logic din,
    output logic dout
);

  typedef enum logic [2:0] {
    IDLE = 3'b000,
    S1   = 3'b001,
    S10  = 3'b010,
    S101 = 3'b011
  } state_t;

  state_t state, next_state;

  // Synchronous reset: state clears at the posedge where resetn=0 is sampled.
  // Until that posedge the Mealy comb still sees the old state, so a detection
  // that completes in the same cycle as reset fires once — which matches the
  // reference model.
  always_ff @(posedge clk) begin
    if (!resetn) state <= IDLE;
    else state <= next_state;
  end

  always_comb begin
    next_state = state;
    dout       = 1'b0;

    case (state)
      IDLE: begin
        if (din) next_state = S1;
        else next_state = IDLE;
      end
      S1: begin
        if (din) next_state = S1;
        else next_state = S10;
      end
      S10: begin
        if (din) next_state = S101;
        else next_state = IDLE;
      end
      S101: begin
        if (!din) begin
          dout       = 1'b1;
          next_state = S10;
        end else begin
          next_state = S1;
        end
      end
      default: next_state = IDLE;
    endcase
  end

endmodule
