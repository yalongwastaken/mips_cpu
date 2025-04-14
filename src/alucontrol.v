`timescale 1ns/10ps

module alucontrol(
    input wire [1:0] aluop,
    input wire [5:0] funct,
    output reg [2:0] alucont
);

    always @(*) begin
        case (aluop)
            2'b00: alucont <= 3'b010; // ADD
            2'b01: alucont <= 3'b110; // SUB
            default: begin
                case (funct)
                    6'b100000: alucont <= 3'b010; // ADD
                    6'b100010: alucont <= 3'b110; // SUB
                    6'b100100: alucont <= 3'b000; // AND
                    6'b100101: alucont <= 3'b001; // OR
                    6'b101010: alucont <= 3'b111; // SLT
                    default:   alucont <= 3'bxxx; // Invalid funct code
                endcase
            end
        endcase
    end
endmodule