`timescale 1ns/10ps

module alu(
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [2:0] alucont,       // ALU control
    output reg [7:0] result,        // ALU result
    output reg zero                 // Zero flag
);
    reg [7:0] b2;
    reg [7:0] sum;
    reg [7:0] slt;

    always @(*) begin
        b2 = alucont[2] ? ~b : b;
        sum = a + b2 + alucont[2];
        slt = (sum[7]) ? 8'b1 : 8'b0;

        case (alucont[1:0])
            2'b00: result = a & b;       // AND
            2'b01: result = a | b;       // OR
            2'b10: result = sum;         // ADD or SUB
            2'b11: result = slt;         // SLT
        endcase

        zero = (result == 8'b0);
    end
endmodule
