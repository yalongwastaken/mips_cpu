`timescale 1ns/10ps

module register_file_tb;

    // Testbench signals
    reg clk;
    reg regwrite;
    reg [4:0] ra1, ra2, wa;
    reg [7:0] wd;
    wire [7:0] rd1, rd2;

    // Instantiate the register file
    register_file uut (
        .clk(clk),
        .regwrite(regwrite),
        .ra1(ra1),
        .ra2(ra2),
        .wa(wa),
        .wd(wd),
        .rd1(rd1),
        .rd2(rd2)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize
        clk = 0;
        regwrite = 0;
        ra1 = 0; ra2 = 0; wa = 0;
        wd = 0;

        // Wait a bit
        #10;

        // Write 0xAA to register 1
        regwrite = 1;
        wa = 5'd1;
        wd = 8'b10101010;
        #10;

        // Write 0x55 to register 2
        wa = 5'd2;
        wd = 8'b01010101;
        #10;

        // Try writing to register 0 (should not change)
        wa = 5'd0;
        wd = 8'b11111111;
        #10;

        regwrite = 0; // Disable writing

        // Read from reg 1 and reg 2
        ra1 = 5'd1;
        ra2 = 5'd2;
        #5;

        $display("rd1 = %b (expected 10101010)", rd1);
        $display("rd2 = %b (expected 01010101)", rd2);

        // Read from reg 0
        ra1 = 5'd0;
        ra2 = 5'd0;
        #5;

        $display("rd1 = %b (expected 00000000)", rd1);
        $display("rd2 = %b (expected 00000000)", rd2);

        $finish;
    end
endmodule
