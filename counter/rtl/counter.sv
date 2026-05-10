module counter #(
    parameter int MAX = 99,
    parameter int DATA_WIDTH = 16
) (
    input logic clk,
    input logic reset,
    input logic start,
    input logic stop,
    output logic [DATA_WIDTH-1:0] count
);

  // Internal state to track if the counter is active (running)
  logic is_running;

  always_ff @(posedge clk) begin
    if (reset) begin
      // PRIORITY 1: Reset
      // Resets count to 0 and forces the counter to stop.
      count      <= '0;
      is_running <= 1'b0;
    end else if (stop) begin
      // PRIORITY 2: Stop
      // Halts counting and clears the running state.
      // If start is also asserted, stop takes precedence.
      is_running <= 1'b0;
    end else if (start || is_running) begin
      // PRIORITY 3: Start / Continuous Running
      // If start was pulsed (or held) and we aren't stopping/resetting,
      // increment the counter and maintain the running state.
      is_running <= 1'b1;

      if (count >= MAX) begin
        count <= '0;  // Wrap-around behavior
      end else begin
        count <= count + 1'b1;
      end
    end

    // Implicit else: Maintain current count and is_running state
    // if none of the above conditions are met.
  end
endmodule
