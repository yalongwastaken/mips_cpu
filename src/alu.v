`timescale 1ns/10ps

module alu(
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [2:0] alucont,       // ALU control
    output reg [7:0] aluout,        // ALU result
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
            2'b00: aluout = a & b;       // AND
            2'b01: aluout = a | b;       // OR
            2'b10: aluout = sum;         // ADD or SUB
            2'b11: aluout = slt;         // SLT
        endcase

        zero = (aluout == 8'b0);
    end
endmodule
