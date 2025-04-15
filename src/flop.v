`timescale 1ns/10ps

module flop(
    input wire clk,
    input wire reset,
    input wire [7:0] d,
    output reg [7:0] q
);

    always @(posedge clk ) begin
        if (reset)
            q <= 8'b0;
        else
            q <= d;
    end
endmodule