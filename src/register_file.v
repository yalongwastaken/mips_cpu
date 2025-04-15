`timescale 1ns/10ps

module register_file(
    input wire clk,
    input wire reset,              // reset signal
    input wire regwrite,           // write enable (WE3)
    input wire [4:0] ra1,          // read address 1 (A1)
    input wire [4:0] ra2,          // read address 2 (A2)
    input wire [4:0] wa,           // write address (A3)
    input wire [7:0] wd,           // write data (WD3)
    output reg [7:0] rd1,         // read data 1 (RD1)
    output reg [7:0] rd2          // read data 2 (RD2)
);

    reg [7:0] REGS [7:0];          // 8 registers: $0 to $7
    reg [7:0] rd1_next, rd2_next;  // Next values for read data

    // Read operation
    always @ (*) begin
        rd1_next = (ra1 == 5'b0) ? 8'b0 : REGS[ra1];
        rd2_next = (ra2 == 5'b0) ? 8'b0 : REGS[ra2];
    end

    // Write operation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Initialize
            REGS[0] <= 8'b0;
            REGS[1] <= 8'b0;
            REGS[2] <= 8'b0;
            REGS[3] <= 8'b0;
            REGS[4] <= 8'b0;
            REGS[5] <= 8'b0;
            REGS[6] <= 8'b0;
            REGS[7] <= 8'b0;
            rd1 <= 8'b0;
            rd2 <= 8'b0;
        end else begin
            if (regwrite && wa != 5'b0) begin
                REGS[wa] <= wd;
            end
            rd1 <= rd1_next;
            rd2 <= rd2_next;
        end
    end
endmodule
