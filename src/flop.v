`timescale 1ns/10ps

module flop(
    input wire clk,
    input wire [7:0] d,
    output reg [7:0] q
);

    always @(posedge clk ) begin
        q <= d;
    end
endmodule