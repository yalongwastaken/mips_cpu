`timescale 1ns/10ps

module datapath_testbench;

    // Inputs
    reg clk;
    reg pcen;
    reg iord;
    reg [3:0] irwrite;
    reg regdst;
    reg memtoreg;
    reg regwrite;
    reg alusrca;
    reg [1:0] alusrcb;
    reg [2:0] alucont;
    reg [1:0] pcsource;
    reg [7:0] memdata;

    // Outputs
    wire [5:0] op;
    wire [5:0] funct;
    wire zero;
    wire [7:0] addr;
    wire [7:0] wdata;

    // DUT
    datapath_test_design dut (
        .clk(clk),
        .pcen(pcen),
        .iord(iord),
        .irwrite(irwrite),
        .regdst(regdst),
        .memtoreg(memtoreg),
        .regwrite(regwrite),
        .alusrca(alusrca),
        .alusrcb(alusrcb),
        .alucont(alucont),
        .pcsource(pcsource),
        .memdata(memdata),
        .op(op),
        .funct(funct),
        .zero(zero),
        .addr(addr),
        .wdata(wdata)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10ns period

    // Stimulus
    initial begin
        // Initial values
        pcen = 0;
        iord = 0;
        irwrite = 4'b0000;
        regdst = 0;
        memtoreg = 0;
        regwrite = 0;
        alusrca = 0;
        alusrcb = 2'b00;
        alucont = 3'b010; // ADD
        pcsource = 2'b00;
        memdata = 8'h00;

        // Wait 10ns for initial setup
        #10;
        pcen = 1;

        // === INSTRUCTION LOAD ===
        // Load instruction byte-by-byte
        // Instruction becomes 32'hEFBEADDE after all 4 cycles (Little-endian loading)
        irwrite = 4'b0001; memdata = 8'hDE; #10; // instr[7:0]   = 0xDE
        irwrite = 4'b0010; memdata = 8'hAD; #10; // instr[15:8]  = 0xAD
        irwrite = 4'b0100; memdata = 8'hBE; #10; // instr[23:16] = 0xBE
        irwrite = 4'b1000; memdata = 8'hEF; #10; // instr[31:24] = 0xEF

        // At this point:
        // instr = 32'hEFBEADDE
        // op    = 6'b111011 (0x3B)
        // funct = 6'b011110 (0x1E)

        irwrite = 4'b0000; // stop writing to instr

        // === REGISTER FILE WRITE SETUP ===
        // Using regdst = 1 → wa = instr[15:11] = 0x1B
        // ALU output goes to write data
        regdst = 1;
        memtoreg = 0;     // ALU result written to register
        regwrite = 1;     // enable regfile write
        alusrca = 1;      // ALU input A = reg A
        alusrcb = 2'b00;  // ALU input B = reg B
        alucont = 3'b010; // ALU performs ADD

        // Expected ALU inputs:
        // - reg A (rd1) = whatever was in reg[25:21]
        // - reg B (rd2) = whatever was in reg[20:16]
        // ALU result → aluout → wd → written to reg[wa] = instr[15:11]

        #50;

        // === IMMEDIATE OPERATION ===
        alusrca = 1;
        alusrcb = 2'b10; // select imm = instr[7:0] = 0xDE
        alucont = 3'b010; // ADD

        // ALU does: reg A + imm (8'hDE)
        // Result → aluout

        #50;

        // === PC UPDATE ===
        pcsource = 2'b00; // pcnext = aluout
        pcen = 1;

        // At next clock, pc = aluout

        #50;

        // End of simulation
        $finish;
    end

endmodule