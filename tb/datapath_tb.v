module datapath_test_design_tb;

    // Inputs
    reg clk;
    reg reset;
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

    datapath_test_design uut (
        .clk(clk),
        .reset(reset),
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

    reg [31:0] instr;

    always #5 clk = ~clk;

    initial begin
        $monitor("time=%t | addr=%h | wdata=%h | zero=%b | op=%h | funct=%h", $time, addr, wdata, zero, op, funct);

        // Initialize inputs
        reset = 1;
        #10;

        reset = 0;
        clk = 0;
        pcen = 1;
        iord = 0;
        irwrite = 4'b1111;
        regdst = 0;
        memtoreg = 0;
        regwrite = 1;
        alusrca = 0;
        alusrcb = 2'b00;
        alucont = 3'b000;
        pcsource = 2'b00;
        memdata = 8'hAA;

        // Initialize instruction
        instr = 32'b000000_00000_00001_00010_00000_100000; // review
        
        // Write to register
        #10;
        regwrite = 1;
        instr = 32'b000000_00000_00001_00010_00000_100000; // review
        #10;
        
        // Read from register
        regwrite = 0;
        #50;

        $finish;
    end

endmodule