`timescale 1ns/10ps

module flop_en(
    input wire clk,
    input wire reset,
    input wire en,
    input wire [7:0] d,
    output reg [7:0] q
);

    always @(posedge clk) begin
        if (reset) begin
            q <= 8'b0;
        end else begin
            if (en) begin
                q <= d;
            end
        end
    end
endmodule