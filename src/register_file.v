`timescale 1ns/10ps

module register_file(
    input wire clk,
    input wire regwrite,           // write enable (WE3)
    input wire [2:0] ra1,          // read address 1 (A1)
    input wire [2:0] ra2,          // read address 2 (A2)
    input wire [2:0] wa,           // write address (A3)
    input wire [7:0] wd,           // write data (WD3)
    output wire [7:0] rd1,         // read data 1 (RD1)
    output wire [7:0] rd2          // read data 2 (RD2)
);

    reg [7:0] REGS [7:0];          // 8 registers: $0 to $7

    // Read operation (MIPS-style: $0 always returns 0)
    assign rd1 = (ra1 == 3'b000) ? 8'b0 : REGS[ra1];
    assign rd2 = (ra2 == 3'b000) ? 8'b0 : REGS[ra2];

    // Write operation (MIPS-style: $0 is read-only)
    always @(posedge clk) begin
        if (regwrite && wa != 3'b000) begin
            REGS[wa] <= wd;
        end
    end
endmodule
