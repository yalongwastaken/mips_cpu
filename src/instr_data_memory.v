`timescale 1ns/10ps

module mem(
    input wire clk,
    input wire memwrite,       // Write enable from control unit
    input [7:0] addr,          // Address to access
    input [7:0] data_in,       // Data to write
    output reg [7:0] data_out  // Data to read
);
    reg [7:0] memory [255:0];  // 256 x 8-bit memory

    // TODO
    initial begin
        // Example: memory[0] = 8'hFF;
    end

    // Synchronous read and write
    always @(posedge clk) begin
        if (memwrite) begin
            memory[addr] <= data_in;     // Write on clk edge
        end
        data_out <= memory[addr];        // Read on clk edge
    end
endmodule