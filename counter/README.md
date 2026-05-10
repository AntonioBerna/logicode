# Counter

Build a module which controls a counter.

The counter starts counting when the `start` button is pressed and increases by 1 every clock cycle.
When the `stop` button is pressed, the counter stops counting.
When the `reset` button is pressed, the `count` resets to 0 and the counter stops counting.

If `count` ever reaches `MAX`, then it restarts from 0 on the next cycle.

`stop`'s functionality takes priority over `start`'s functionality, and `reset`'s functionality takes priority over both `stop` and `start`'s functionality.

Examples:

1. After `reset`, assert `start`; `count` increments each cycle until `stop` is asserted, then holds.
2. With `MAX = 12`, asserting `start` for 15 cycles drives `count` up to 12 then wraps to 0 and continues (wrap-around behavior).
3. When stop and start are both asserted, the counter stops. When stop, start, and reset are all asserted, the counter resets to 0.

SystemVerilog module:

```systemverilog
module counter #(
    parameter MAX = 99,
    parameter DATA_WIDTH = 16
) (
    input logic clk,
    input logic reset,
    input logic start,
    input logic stop,
    output logic [DATA_WIDTH-1:0] count
);

endmodule
```
