module bubble_sort #(
    parameter int BITWIDTH = 3
) (
    input  logic [BITWIDTH-1:0] din,
    input  logic                sortit,
    input  logic                clk,
    input  logic                resetn,
    output logic [8*BITWIDTH:0] dout
);

  function automatic logic [BITWIDTH-1:0] min_word(input logic [BITWIDTH-1:0] lhs,
                                                   input logic [BITWIDTH-1:0] rhs);
    begin
      min_word = (lhs <= rhs) ? lhs : rhs;
    end
  endfunction

  function automatic logic [BITWIDTH-1:0] max_word(input logic [BITWIDTH-1:0] lhs,
                                                   input logic [BITWIDTH-1:0] rhs);
    begin
      max_word = (lhs <= rhs) ? rhs : lhs;
    end
  endfunction

  logic [BITWIDTH-1:0] sample0;
  logic [BITWIDTH-1:0] sample1;
  logic [BITWIDTH-1:0] sample2;
  logic [BITWIDTH-1:0] sample3;
  logic [BITWIDTH-1:0] sample4;
  logic [BITWIDTH-1:0] sample5;
  logic [BITWIDTH-1:0] sample6;
  logic [BITWIDTH-1:0] sample7;

  logic [BITWIDTH-1:0] stage1_0;
  logic [BITWIDTH-1:0] stage1_1;
  logic [BITWIDTH-1:0] stage1_2;
  logic [BITWIDTH-1:0] stage1_3;
  logic [BITWIDTH-1:0] stage1_4;
  logic [BITWIDTH-1:0] stage1_5;
  logic [BITWIDTH-1:0] stage1_6;
  logic [BITWIDTH-1:0] stage1_7;

  logic [BITWIDTH-1:0] stage2_0;
  logic [BITWIDTH-1:0] stage2_1;
  logic [BITWIDTH-1:0] stage2_2;
  logic [BITWIDTH-1:0] stage2_3;
  logic [BITWIDTH-1:0] stage2_4;
  logic [BITWIDTH-1:0] stage2_5;
  logic [BITWIDTH-1:0] stage2_6;
  logic [BITWIDTH-1:0] stage2_7;

  logic [BITWIDTH-1:0] stage3_0;
  logic [BITWIDTH-1:0] stage3_1;
  logic [BITWIDTH-1:0] stage3_2;
  logic [BITWIDTH-1:0] stage3_3;
  logic [BITWIDTH-1:0] stage3_4;
  logic [BITWIDTH-1:0] stage3_5;
  logic [BITWIDTH-1:0] stage3_6;
  logic [BITWIDTH-1:0] stage3_7;

  logic [BITWIDTH-1:0] stage4_0;
  logic [BITWIDTH-1:0] stage4_1;
  logic [BITWIDTH-1:0] stage4_2;
  logic [BITWIDTH-1:0] stage4_3;
  logic [BITWIDTH-1:0] stage4_4;
  logic [BITWIDTH-1:0] stage4_5;
  logic [BITWIDTH-1:0] stage4_6;
  logic [BITWIDTH-1:0] stage4_7;

  logic [BITWIDTH-1:0] stage5_0;
  logic [BITWIDTH-1:0] stage5_1;
  logic [BITWIDTH-1:0] stage5_2;
  logic [BITWIDTH-1:0] stage5_3;
  logic [BITWIDTH-1:0] stage5_4;
  logic [BITWIDTH-1:0] stage5_5;
  logic [BITWIDTH-1:0] stage5_6;
  logic [BITWIDTH-1:0] stage5_7;

  logic [BITWIDTH-1:0] stage6_0;
  logic [BITWIDTH-1:0] stage6_1;
  logic [BITWIDTH-1:0] stage6_2;
  logic [BITWIDTH-1:0] stage6_3;
  logic [BITWIDTH-1:0] stage6_4;
  logic [BITWIDTH-1:0] stage6_5;
  logic [BITWIDTH-1:0] stage6_6;
  logic [BITWIDTH-1:0] stage6_7;

  logic [8*BITWIDTH:0] sorted_dout;

  assign stage1_0 = min_word(sample0, sample2);
  assign stage1_1 = min_word(sample1, sample3);
  assign stage1_2 = max_word(sample0, sample2);
  assign stage1_3 = max_word(sample1, sample3);
  assign stage1_4 = min_word(sample4, sample6);
  assign stage1_5 = min_word(sample5, sample7);
  assign stage1_6 = max_word(sample4, sample6);
  assign stage1_7 = max_word(sample5, sample7);

  assign stage2_0 = min_word(stage1_0, stage1_4);
  assign stage2_1 = min_word(stage1_1, stage1_5);
  assign stage2_2 = min_word(stage1_2, stage1_6);
  assign stage2_3 = min_word(stage1_3, stage1_7);
  assign stage2_4 = max_word(stage1_0, stage1_4);
  assign stage2_5 = max_word(stage1_1, stage1_5);
  assign stage2_6 = max_word(stage1_2, stage1_6);
  assign stage2_7 = max_word(stage1_3, stage1_7);

  assign stage3_0 = min_word(stage2_0, stage2_1);
  assign stage3_1 = max_word(stage2_0, stage2_1);
  assign stage3_2 = min_word(stage2_2, stage2_3);
  assign stage3_3 = max_word(stage2_2, stage2_3);
  assign stage3_4 = min_word(stage2_4, stage2_5);
  assign stage3_5 = max_word(stage2_4, stage2_5);
  assign stage3_6 = min_word(stage2_6, stage2_7);
  assign stage3_7 = max_word(stage2_6, stage2_7);

  assign stage4_0 = stage3_0;
  assign stage4_1 = stage3_1;
  assign stage4_2 = min_word(stage3_2, stage3_4);
  assign stage4_3 = min_word(stage3_3, stage3_5);
  assign stage4_4 = max_word(stage3_2, stage3_4);
  assign stage4_5 = max_word(stage3_3, stage3_5);
  assign stage4_6 = stage3_6;
  assign stage4_7 = stage3_7;

  assign stage5_0 = stage4_0;
  assign stage5_1 = min_word(stage4_1, stage4_4);
  assign stage5_2 = stage4_2;
  assign stage5_3 = min_word(stage4_3, stage4_6);
  assign stage5_4 = max_word(stage4_1, stage4_4);
  assign stage5_5 = stage4_5;
  assign stage5_6 = max_word(stage4_3, stage4_6);
  assign stage5_7 = stage4_7;

  assign stage6_0 = stage5_0;
  assign stage6_1 = min_word(stage5_1, stage5_2);
  assign stage6_2 = max_word(stage5_1, stage5_2);
  assign stage6_3 = min_word(stage5_3, stage5_4);
  assign stage6_4 = max_word(stage5_3, stage5_4);
  assign stage6_5 = min_word(stage5_5, stage5_6);
  assign stage6_6 = max_word(stage5_5, stage5_6);
  assign stage6_7 = stage5_7;

  assign sorted_dout = {
    1'b0, stage6_0, stage6_1, stage6_2, stage6_3, stage6_4, stage6_5, stage6_6, stage6_7
  };

  always_ff @(posedge clk) begin
    if (!resetn) begin
      sample0 <= '0;
      sample1 <= '0;
      sample2 <= '0;
      sample3 <= '0;
      sample4 <= '0;
      sample5 <= '0;
      sample6 <= '0;
      sample7 <= '0;
      dout <= '0;
    end else if (sortit) begin
      dout <= sorted_dout;
    end else begin
      sample0 <= sample1;
      sample1 <= sample2;
      sample2 <= sample3;
      sample3 <= sample4;
      sample4 <= sample5;
      sample5 <= sample6;
      sample6 <= sample7;
      sample7 <= din;
      dout <= '0;
    end
  end

endmodule
