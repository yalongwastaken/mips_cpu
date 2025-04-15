`timescale 1ns/10ps

module register_file_tb;

    reg clk;
    reg reset;
    reg regwrite;
    reg [4:0] ra1, ra2, wa;
    reg [7:0] wd;
    wire [7:0] rd1, rd2;

    register_file uut (
        .clk(clk),
        .reset(reset),
        .regwrite(regwrite),
        .ra1(ra1),
        .ra2(ra2),
        .wa(wa),
        .wd(wd),
        .rd1(rd1),
        .rd2(rd2)
    );

    always #5 clk = ~clk;

    initial begin
        // Reset
        reset = 1;
        #10;

        // Initialize
        reset = 0;
        clk = 0;
        regwrite = 0;
        ra1 = 0; ra2 = 0; wa = 0;
        wd = 0;
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

        // Attempt write to register 0
        wa = 5'd0;
        wd = 8'b11111111;
        #10;

        // Read from register 1 and 2
        regwrite = 0;
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
