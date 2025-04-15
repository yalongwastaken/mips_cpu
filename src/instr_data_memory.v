`timescale 1ns/10ps

module mem(
    input wire clk,
    input wire reset,          // Reset signal
    input wire memwrite,       // Write enable from control unit
    input [7:0] addr,          // Address to access
    input [7:0] data_in,       // Data to write
    output reg [7:0] data_out  // Data to read
);
    reg [7:0] memory [255:0];  // 256 x 8-bit memory
    integer i;

    // Synchronous read and write
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Initialize memory
            for (i = 0; i < 256; i = i + 1) begin
                memory[i] <= 8'b0;
            end

            // Reset data output
            data_out <= 8'b0;
        end
        else if (memwrite) begin
            memory[addr] <= data_in;         // Write on clk edge
            data_out <= memory[addr];        // Read on clk edge
        end
    end
endmodule