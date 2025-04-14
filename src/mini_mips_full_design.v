module mini_mips_full_design(
    input clk,
    input reset,
    output memwrite,
    output [7:0] adr,
    output [7:0] writedata
);

    wire zero, branch, pcwrite, alusrca, iord, regdst, memtoreg, regwrite;
    wire [1:0] alusrcb, pcsource;
    wire [2:0] alucont;
    wire [3:0] irwrite;
    wire [5:0] op, funct;

    datapath_full_design dp (
        .clk(clk),
        .pcen((zero & branch) | pcwrite),
        .iord(iord),
        .memwrite(memwrite),
        .irwrite(irwrite),
        .regdst(regdst),
        .memtoreg(memtoreg),
        .regwrite(regwrite),
        .alusrca(alusrca),
        .alusrcb(alusrcb),
        .alucont(alucont),
        .pcsource(pcsource),
        .op(op),
        .funct(funct),
        .zero(zero),
        .addr(adr),
        .wdata(writedata)
    );

    controller cont (
        .clk(clk),
        .reset(reset),
        .op(op),
        .funct(funct),
        .alusrca(alusrca),
        .alusrcb(alusrcb),
        .branch(branch),
        .iord(iord),
        .irwrite(irwrite),
        .memwrite(memwrite),
        .memtoreg(memtoreg),
        .pcwrite(pcwrite),
        .pcsource(pcsource),
        .regwrite(regwrite),
        .regdst(regdst),
        .alucont(alucont)
    );

endmodule