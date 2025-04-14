`timescale 1ns/10ps

module mux2 #(parameter DATA_WIDTH=8) (
    input wire [DATA_WIDTH-1:0] a,
    input wire [DATA_WIDTH-1:0] b,
    input wire sel,
    output reg [DATA_WIDTH-1:0] y
);
    always @(*) begin
        case (sel)
            1'b0: y <= a;
            1'b1: y <= b;
        endcase
    end
endmodule