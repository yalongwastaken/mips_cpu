`timescale 1ns/10ps

module mini_mips_testbench;

    // Testbench signals
    reg clk;
    reg reset;
    reg [7:0] memdata;  // Memory data for testing (one byte at a time)
    wire memwrite;
    wire [7:0] adr;
    wire [7:0] writedata;
    wire [5:0] op;
    wire [5:0] funct;
    wire zero;

    // Instantiate the mini_mips module
    mini_mips uut (
        .clk(clk),
        .reset(reset),
        .memdata(memdata),
        .memwrite(memwrite),
        .adr(adr),
        .writedata(writedata),
        .op(op),
        .funct(funct),
        .zero(zero)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle the clock every 5 ns
    end

    // Initial block for reset and stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        memdata = 8'b0;

        // Apply reset
        reset = 1;
        #10 reset = 0;

        // Test case 1: Load Byte (LB) instruction
        // opcode: 6'b100000
        // funct: 6'b000000
        memdata = 8'b00000000;  // Byte 1
        #10;
        memdata = 8'b10111111;  // Byte 2
        #10;
        memdata = 8'b11001100;  // Byte 3
        #10;
        memdata = 8'b10000000;  // Byte 4
        #10;
        // Full instruction: 10000000 11001100 10111111 00000000
        #40;

        // Test case 2: Store Byte (SB) instruction
        // opcode: 6'b101000
        // funct: 6'b000000
        memdata = 8'b0000000;  // Byte 1
        #10;
        memdata = 8'b01100110;  // Byte 2
        #10;
        memdata = 8'b01110111;  // Byte 3
        #10;
        memdata = 8'b10100000;  // Byte 4
        #10;
        // Full instruction: 10100000 01110111 01100110 00000000
        #40;

        // Test case 3: R-Type instruction (ADD)
        // opcode: 6'b000000
        // funct: 6'b100000
        memdata = 8'b00100000;  // Byte 1
        #10;
        memdata = 8'b00000001;  // Byte 2
        #10;
        memdata = 8'b00000010;  // Byte 3
        #10;
        memdata = 8'b00000000;  // Byte 4
        #10;
        // Full instruction: 00000000 00000010 00000001 00100000
        #30;

        // Test case 4: BEQ instruction
        // opcode: 6'b000010
        // funct: 6'b000000
        memdata = 8'b00000000;  // Byte 1
        #10;
        memdata = 8'b01010101;  // Byte 2
        #10;
        memdata = 8'b11110000;  // Byte 3
        #10;
        memdata = 8'b00001011;  // Byte 4
        #10;
        // Full instruction: 00001011 11110000 01010101 00000000
        #30;

        // Test case 5: Jump (J) instruction
        // opcode: 6'b001000
        // funct: 6'b000000
        memdata = 8'b00000000;  // Byte 1
        #10;
        memdata = 8'b10101101;  // Byte 2
        #10;
        memdata = 8'b10111110;  // Byte 3
        #10;
        memdata = 8'b00100000;  // Byte 4
        #10;
        // Full instruction: 00100000 10111110 10101101 00000000
        #20;

        $finish;
    end

    initial begin
        $monitor("Time: %t | memwrite: %b | adr: %h | writedata: %h | memdata: %b | op: %h | funct: %h | zero: %b",
                 $time, memwrite, adr, writedata, memdata, op, funct, zero);
    end

endmodule