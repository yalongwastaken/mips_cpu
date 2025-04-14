`timescale 1ns/10ps

module datapath_full_design(
    input wire clk,
    input wire pcen,
    input wire iord,
    input wire memwrite,
    input wire [3:0] irwrite,
    input wire regdst,
    input wire memtoreg,
    input wire regwrite,
    input wire alusrca,
    input wire [1:0] alusrcb,
    input wire [2:0] alucont,
    input wire [1:0] pcsource,
    output reg [5:0] op,
    output reg [5:0] funct,
    output wire zero,
    output wire [7:0] addr,
    output wire [7:0] wdata
);

    // Internal signals
    wire [7:0] pc, pcnext, memdata, data, a;
    wire [7:0] aluout, aluout_flop, aluin1, aluin2, wd, rd1, rd2;
    wire [4:0] wa;
    reg  [31:0] instr;
    wire [7:0] imm = instr[7:0];
    wire [7:0] immx4 = {instr[5:0], 2'b00};

    // PC Register
    flop_en pc_flop(.clk(clk), .en(pcen), .d(pcnext), .q(pc));

    // Address selection
    mux2 mux2_pc(.a(pc), .b(aluout), .sel(iord), .y(addr));

    // Instruction/Data memory
    mem instr_data_mem(
        .clk(clk),
        .memwrite(memwrite),
        .addr(addr),
        .data_in(wdata),
        .data_out(memdata)
    );

    // Instruction Register (4 bytes)
    always @(posedge clk) begin
        if (irwrite[0]) instr[7:0]   <= memdata;
        if (irwrite[1]) instr[15:8]  <= memdata;
        if (irwrite[2]) instr[23:16] <= memdata;
        if (irwrite[3]) instr[31:24] <= memdata;
    end

    // Data register from memory
    flop memdata_flop(.clk(clk), .d(memdata), .q(data));

    // MUXes for register file inputs
    mux2 #(.DATA_WIDTH(5)) mux2_a3(.a(instr[20:16]), .b(instr[15:11]), .sel(regdst), .y(wa));
    mux2 mux2_w3(.a(aluout), .b(data), .sel(memtoreg), .y(wd));

    // Register File
    register_file regfile(
        .clk(clk),
        .regwrite(regwrite),
        .ra1(instr[25:21]),
        .ra2(instr[20:16]),
        .wa(wa),
        .wd(wd),
        .rd1(rd1),
        .rd2(rd2)
    );

    // Register read flops
    flop rdata1_flop(.clk(clk), .d(rd1), .q(a));
    flop rdata2_flop(.clk(clk), .d(rd2), .q(wdata));

    // ALU operand muxes
    mux2 mux2_a(.a(pc), .b(a), .sel(alusrca), .y(aluin1));
    mux4 mux4_b(.a(wdata), .b(8'b00000001), .c(imm), .d(immx4[7:0]), .sel(alusrcb), .y(aluin2));

    // ALU
    alu alu(.alucont(alucont), .a(aluin1), .b(aluin2), .aluout(aluout), .zero(zero));

    // ALUOUT flop
    flop aluout_flopp(.clk(clk), .d(aluout), .q(aluout_flop));

    // Next PC selection
    mux3 mux3_pc(.a(aluout), .b(aluout_flop), .c(immx4), .sel(pcsource), .y(pcnext));

    // Decode fields
    always @(*) begin
        op    = instr[31:26];
        funct = instr[5:0];
    end

endmodule