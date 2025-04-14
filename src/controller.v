`timescale 1ns/10ps

module controller(
    input clk, reset,
    input [5:0] op,
    input [5:0] funct,

    output reg alusrca, 
    output reg [1:0] alusrcb,
    output reg branch,
    output reg iord,
    output reg [3:0] irwrite,
    output reg memwrite,
    output reg memtoreg,
    output reg pcwrite,
    output reg [1:0] pcsource,
    output reg regwrite,
    output reg regdst,
    output wire [2:0] alucont
);

// STATES
parameter FETCH1 = 4'b0001;      // State 0
parameter FETCH2 = 4'b0010;      // State 1
parameter FETCH3 = 4'b0011;      // State 2
parameter FETCH4 = 4'b0100;      // State 3
parameter DECODE = 4'b0101;      // State 4
parameter MEMADR = 4'b0110;      // State 5
parameter LBRD = 4'b0111;        // State 6
parameter LBWR = 4'b1000;        // State 7
parameter SBWR = 4'b1001;        // State 8
parameter RTYPEEX = 4'b1010;     // State 9
parameter RTYPEWR = 4'b1011;     // State 10
parameter BEQEX = 4'b1100;       // State 11
parameter JEX = 4'b1101;         // State 12

// OPCODES
parameter LB = 6'b100000;        // Load Byte
parameter SB = 6'b101000;        // Store Byte
parameter RTYPE = 6'b000000;     // R-Type
parameter BEQ = 6'b000010;       // Branch Equal
parameter J = 6'b001000;         // Jump

// REGISTERS
reg [3:0] state, nextstate;
reg [1:0] aluop;

// ALU CONTROL
alucontrol alucontt(
    .aluop(aluop),
    .funct(funct),
    .alucont(alucont)
);

// state register logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= FETCH1;
    end 
    else begin
        state <= nextstate;
    end
end

// next state logic
always @(*) begin
    nextstate = state;

    case (state)
        FETCH1: nextstate = FETCH2;
        FETCH2: nextstate = FETCH3;
        FETCH3: nextstate = FETCH4;
        FETCH4: nextstate = DECODE;
        DECODE: begin
            case (op)
                LB: nextstate = MEMADR;
                SB: nextstate = MEMADR;
                RTYPE: nextstate = RTYPEEX;
                BEQ: nextstate = BEQEX;
                J: nextstate = JEX;
                default: nextstate = FETCH1; // Default to fetch if invalid opcode
            endcase
        end
        MEMADR: begin
            case (op)
                LB: nextstate = LBRD;
                SB: nextstate = SBWR;
                default: nextstate = FETCH1; // Default to fetch if invalid opcode
            endcase
        end
        LBRD: nextstate = LBWR;
        LBWR: nextstate = FETCH1;
        SBWR: nextstate = FETCH1;
        RTYPEEX: nextstate = RTYPEWR;
        RTYPEWR: nextstate = FETCH1;
        BEQEX: nextstate = FETCH1;
        JEX: nextstate = FETCH1;
        default: nextstate = FETCH1; // Default to fetch if invalid state
    endcase
end

// register output logic
always @(*) begin
    // Default values
    irwrite = 4'b0000;
    pcwrite = 1'b0;
    regwrite = 1'b0;
    regdst = 1'b0;
    memwrite = 1'b0;
    alusrca = 1'b0;
    alusrcb = 2'b00;
    aluop = 2'b00;
    pcsource = 2'b00;
    iord = 1'b0;
    memtoreg = 1'b0;
    branch = 1'b0;

    case (state)
        FETCH1: begin
            alusrca = 1'b0;
            iord = 1'b0;
            irwrite = 4'b0001; // Review
            alusrcb = 2'b01;
            aluop = 2'b00;
            pcwrite = 1'b1;
            pcsource = 2'b00;
        end
        FETCH2: begin
            alusrca = 1'b0;
            iord = 1'b0;
            irwrite = 4'b0010; // Review
            alusrcb = 2'b01;
            aluop = 2'b00;
            pcwrite = 1'b1;
            pcsource = 2'b00;
        end
        FETCH3: begin
            alusrca = 1'b0;
            iord = 1'b0;
            irwrite = 4'b0100; // Review
            alusrcb = 2'b01;
            aluop = 2'b00;
            pcwrite = 1'b1;
            pcsource = 2'b00;
        end
        FETCH4: begin
            alusrca = 1'b0;
            iord = 1'b0;
            irwrite = 4'b1000; // Review
            alusrcb = 2'b01;
            aluop = 2'b00;
            pcwrite = 1'b1;
            pcsource = 2'b00;
        end
        DECODE: begin
            alusrca = 1'b0;
            alusrcb = 2'b11;
            aluop = 2'b00;
        end
        MEMADR: begin
            alusrca = 1'b1;
            alusrcb = 2'b10;
            aluop = 2'b00;
        end
        LBRD: begin
            iord = 1'b1;
        end
        LBWR: begin
            regdst = 1'b0;
            regwrite = 1'b1;
            memtoreg = 1'b1;
        end
        SBWR: begin
            memwrite = 1'b1;
            iord = 1'b1;
        end
        RTYPEEX: begin
            alusrca = 1'b1;
            alusrcb = 2'b00;
            aluop = 2'b10;
        end
        RTYPEWR: begin
            regdst = 1'b1;
            regwrite = 1'b1;
            memtoreg = 1'b0;
        end
        BEQEX: begin
            alusrca = 1'b1;
            alusrcb = 2'b00;
            aluop = 2'b01;
            branch = 1'b1;
            pcsource = 2'b01;
        end
        JEX: begin
            pcwrite = 1'b1;
            pcsource = 2'b10;
        end
    endcase
end
endmodule