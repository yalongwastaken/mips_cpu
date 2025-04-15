module datapath_test_design_tb;

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

    // Instantiate the datapath module
    datapath_test_design uut (
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

    // Initialize signals
    initial begin
        clk = 0;
        pcen = 1;
        iord = 0;
        irwrite = 4'b1111; // Write all bits of instruction
        regdst = 0;
        memtoreg = 0;
        regwrite = 1; // Enable write to register file
        alusrca = 0;
        alusrcb = 2'b00;
        alucont = 3'b000;
        pcsource = 2'b00;
        memdata = 8'hAA; // Memory data value for instructions or data

        // Initialize the instruction
        instr = 32'b000000_00000_00001_00010_00000_100000; // Sample instruction (R-type)
        
        // Write to register before read
        #10;
        regwrite = 1; // Ensure regwrite is enabled
        instr = 32'b000000_00000_00001_00010_00000_100000; // Example instruction to write values
        // Wait for the clock cycle to propagate
        #10;
        
        // Now you can read from the register file
        regwrite = 0; // Disable writing to registers
        // Set up other control signals as needed
    end

    // Clock generation
    always begin
        #5 clk = ~clk;  // 100 MHz clock
    end

    // Monitor outputs for debugging
    initial begin
        $monitor("time=%t | addr=%h | wdata=%h | zero=%b | op=%h | funct=%h", $time, addr, wdata, zero, op, funct);
    end

endmodule