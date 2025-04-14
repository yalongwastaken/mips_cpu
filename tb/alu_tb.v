`timescale 1ns/10ps

module alu_tb;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] alucont;

    // Outputs
    wire [7:0] aluout;
    wire zero;

    // Instantiate the ALU
    alu uut (
        .a(a),
        .b(b),
        .alucont(alucont),
        .aluout(aluout),
        .zero(zero)
    );

    initial begin
        // Display header
        $display("Time\talucont\ta\tb\taluout\tzero");

        // Monitor outputs
        $monitor("%0t\t%b\t%h\t%h\t%h\t%b", $time, alucont, a, b, aluout, zero);

        // Test AND: alucont = 3'b000
        // Expected alu output: aluout = a & b = 8'b11110000 & 8'b00001111 = 8'b00000000
        // Expected zero flag: zero = 1'b1
        a = 8'b11110000; b = 8'b00001111; alucont = 3'b000; #10;

        // Test OR: alucont = 3'b001
        // Expected alu output: aluout = a | b = 8'b11110000 | 8'b00001111 = 8'b11111111
        // Expected zero flag: zero = 1'b0
        a = 8'b11110000; b = 8'b00001111; alucont = 3'b001; #10;

        // Test ADD: alucont = 3'b010
        // Expected output: aluout = a + b = 8'b00010000 + 8'b00100000 = 8'b00110000
        // Expected zero flag: zero = 1'b0
        a = 8'b00010000; b = 8'b00100000; alucont = 3'b010; #10;

        // Test SUB: alucont = 3'b110
        // Expected output: aluout = a - b = 8'b00100000 - 8'b00010000 = 8'b00010000
        // Expected zero flag: zero = 1'b0
        a = 8'b00100000; b = 8'b00010000; alucont = 3'b110; #10;

        // Test SLT (a < b): alucont = 3'b111
        // Expected output: aluout = 8'b00000001 (true)
        // Expected zero flag: zero = 1'b0
        a = 8'b00000101; b = 8'b00010000; alucont = 3'b111; #10;

        // Test SLT (a > b): alucont = 3'b111
        // Expected output: aluout = 8'b00000000 (false)
        // Expected zero flag: zero = 1'b1
        a = 8'b00010000; b = 8'b00000101; alucont = 3'b111; #10;

        // Test zero flag: ADD result = 0
        // Expected output: aluout = 8'b00000000, zero = 1
        a = 8'b00010000; b = 8'b11110000; alucont = 3'b010; #10;

        $finish;
    end

endmodule