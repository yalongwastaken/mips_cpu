`timescale 1ns/10ps

module controller_tb;
    // Inputs
    reg clk, reset;
    reg [5:0] op, funct;

    // Outputs
    wire alusrca;
    wire [1:0] alusrcb;
    wire branch;
    wire iord;
    wire [3:0] irwrite;
    wire memwrite;
    wire memtoreg;
    wire pcwrite;
    wire [1:0] pcsource;
    wire regwrite;
    wire regdst;
    wire [2:0] alucont;

    controller dut (
        .clk(clk),
        .reset(reset),
        .op(op),
        .funct(funct),
        .alusrca(alusrca),
        .alusrcb(alusrcb),
        .branch(branch),
        .iord(iord),
        .irwrite(irwrite),
        .memwrite(memwrite),
        .memtoreg(memtoreg),
        .pcwrite(pcwrite),
        .pcsource(pcsource),
        .regwrite(regwrite),
        .regdst(regdst),
        .alucont(alucont)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Starting controller test...");
        clk = 0;
        reset = 1;
        op = 6'b000000;
        funct = 6'b000000;
        #10;

        reset = 0;

        // Test LB
        op = 6'b100000; // LB opcode
        #50;

        // Test SB
        op = 6'b101000; // SB opcode
        #50;

        // Test R-Type
        op = 6'b000000; funct = 6'b100000;
        #40;

        // Test BEQ
        op = 6'b000010; // BEQ opcode
        #30;

        // Test JUMP
        op = 6'b001000; // J opcode
        #20;

        $finish;
    end
endmodule
