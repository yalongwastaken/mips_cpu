/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Apr 16 21:39:08 2025
/////////////////////////////////////////////////////////////


module alucontrol ( aluop, funct, alucont );
  input [1:0] aluop;
  input [5:0] funct;
  output [2:0] alucont;
  wire   n3, n4, n5, n6;

  INVX2 U3 ( .A(n5), .Y(alucont[0]) );
  OAI21X1 U5 ( .A(n3), .B(n6), .C(n4), .Y(alucont[2]) );
  NAND2X1 U6 ( .A(aluop[0]), .B(n6), .Y(n4) );
  NAND3X1 U7 ( .A(n3), .B(aluop[1]), .C(funct[2]), .Y(alucont[1]) );
  NOR2X1 U8 ( .A(funct[1]), .B(funct[3]), .Y(n3) );
  OAI21X1 U9 ( .A(funct[0]), .B(funct[3]), .C(aluop[1]), .Y(n5) );
  INVX2 U4 ( .A(aluop[1]), .Y(n6) );
endmodule


module controller ( clk, reset, op, funct, alusrca, alusrcb, branch, iord, 
        irwrite, memwrite, memtoreg, pcwrite, pcsource, regwrite, regdst, 
        alucont );
  input [5:0] op;
  input [5:0] funct;
  output [1:0] alusrcb;
  output [3:0] irwrite;
  output [1:0] pcsource;
  output [2:0] alucont;
  input clk, reset;
  output alusrca, branch, iord, memwrite, memtoreg, pcwrite, regwrite, regdst;
  wire   n19, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91;
  wire   [3:0] state;
  wire   [3:0] nextstate;

  DFFSR state_reg_1_ ( .D(nextstate[1]), .CLK(clk), .R(n91), .S(1'b1), .Q(
        state[1]) );
  DFFSR state_reg_2_ ( .D(nextstate[2]), .CLK(clk), .R(n91), .S(1'b1), .Q(
        state[2]) );
  DFFSR state_reg_0_ ( .D(nextstate[0]), .CLK(clk), .R(1'b1), .S(n91), .Q(
        state[0]) );
  INVX2 U6 ( .A(n29), .Y(regdst) );
  INVX2 U7 ( .A(n31), .Y(pcsource[1]) );
  AND2X2 U8 ( .A(n36), .B(n37), .Y(n35) );
  INVX2 U9 ( .A(n60), .Y(irwrite[3]) );
  INVX2 U10 ( .A(n52), .Y(irwrite[1]) );
  INVX2 U11 ( .A(n61), .Y(branch) );
  AND2X2 U12 ( .A(n55), .B(n30), .Y(irwrite[2]) );
  INVX2 U13 ( .A(n53), .Y(irwrite[0]) );
  INVX2 U23 ( .A(n61), .Y(pcsource[0]) );
  INVX2 U24 ( .A(n37), .Y(n19) );
  OR2X1 U33 ( .A(regdst), .B(memtoreg), .Y(regwrite) );
  NAND3X1 U34 ( .A(n30), .B(state[3]), .C(state[0]), .Y(n29) );
  NAND2X1 U35 ( .A(n80), .B(n31), .Y(pcwrite) );
  NAND3X1 U36 ( .A(state[0]), .B(state[3]), .C(n32), .Y(n31) );
  NAND3X1 U37 ( .A(n33), .B(n34), .C(n35), .Y(nextstate[3]) );
  NAND3X1 U38 ( .A(n88), .B(n83), .C(op[5]), .Y(n34) );
  OAI21X1 U39 ( .A(n89), .B(n90), .C(n81), .Y(n33) );
  NAND3X1 U40 ( .A(n39), .B(n40), .C(n41), .Y(nextstate[2]) );
  AOI22X1 U41 ( .A(n42), .B(n81), .C(n82), .D(n88), .Y(n41) );
  NAND3X1 U42 ( .A(n44), .B(n90), .C(op[3]), .Y(n43) );
  NOR2X1 U43 ( .A(op[3]), .B(n90), .Y(n42) );
  NOR2X1 U44 ( .A(irwrite[2]), .B(irwrite[3]), .Y(n39) );
  OR2X1 U45 ( .A(n45), .B(n46), .Y(nextstate[1]) );
  OAI21X1 U46 ( .A(n47), .B(n48), .C(n40), .Y(n46) );
  NAND3X1 U47 ( .A(op[5]), .B(n44), .C(n49), .Y(n40) );
  AOI21X1 U48 ( .A(op[3]), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U49 ( .A(alusrcb[1]), .B(n90), .Y(n51) );
  NAND2X1 U50 ( .A(n82), .B(n44), .Y(n48) );
  NAND2X1 U51 ( .A(n90), .B(n89), .Y(n47) );
  NAND3X1 U52 ( .A(n52), .B(n53), .C(n37), .Y(n45) );
  NAND2X1 U53 ( .A(n54), .B(n55), .Y(nextstate[0]) );
  AOI22X1 U54 ( .A(n82), .B(n56), .C(n81), .D(op[3]), .Y(n54) );
  NAND3X1 U55 ( .A(n44), .B(n87), .C(n82), .Y(n57) );
  OAI21X1 U56 ( .A(n87), .B(n90), .C(n44), .Y(n56) );
  NOR2X1 U57 ( .A(op[0]), .B(n58), .Y(n44) );
  OR2X1 U58 ( .A(op[4]), .B(op[2]), .Y(n58) );
  NOR2X1 U59 ( .A(n59), .B(state[0]), .Y(memtoreg) );
  NAND2X1 U60 ( .A(n79), .B(n36), .Y(iord) );
  NAND3X1 U61 ( .A(state[2]), .B(state[1]), .C(n55), .Y(n36) );
  NOR2X1 U62 ( .A(n86), .B(n59), .Y(memwrite) );
  NAND3X1 U63 ( .A(n84), .B(n85), .C(state[3]), .Y(n59) );
  NAND2X1 U64 ( .A(n38), .B(n50), .Y(alusrcb[1]) );
  NAND2X1 U65 ( .A(n80), .B(n50), .Y(alusrcb[0]) );
  NAND2X1 U66 ( .A(n55), .B(n32), .Y(n50) );
  NAND3X1 U67 ( .A(n52), .B(n60), .C(n63), .Y(n62) );
  NOR2X1 U68 ( .A(irwrite[0]), .B(irwrite[2]), .Y(n63) );
  NAND3X1 U69 ( .A(n84), .B(n85), .C(n55), .Y(n53) );
  NOR2X1 U70 ( .A(n86), .B(state[3]), .Y(n55) );
  NAND2X1 U71 ( .A(n64), .B(n32), .Y(n60) );
  NAND2X1 U72 ( .A(n64), .B(n30), .Y(n52) );
  NAND3X1 U73 ( .A(n37), .B(n61), .C(n38), .Y(alusrca) );
  NAND3X1 U74 ( .A(state[2]), .B(state[1]), .C(n64), .Y(n38) );
  NOR2X1 U75 ( .A(state[3]), .B(state[0]), .Y(n64) );
  NAND3X1 U76 ( .A(state[3]), .B(n86), .C(n32), .Y(n61) );
  NOR2X1 U77 ( .A(n85), .B(state[1]), .Y(n32) );
  NAND3X1 U78 ( .A(state[3]), .B(n86), .C(n30), .Y(n37) );
  NOR2X1 U79 ( .A(n84), .B(state[2]), .Y(n30) );
  alucontrol alucontt ( .aluop({n19, pcsource[0]}), .funct(funct), .alucont(
        alucont) );
  DFFSR state_reg_3_ ( .D(nextstate[3]), .CLK(clk), .R(n91), .S(1'b1), .Q(
        state[3]) );
  INVX2 U14 ( .A(memwrite), .Y(n79) );
  INVX2 U15 ( .A(n62), .Y(n80) );
  INVX2 U16 ( .A(n57), .Y(n81) );
  INVX2 U18 ( .A(n50), .Y(n82) );
  INVX2 U19 ( .A(n38), .Y(n83) );
  INVX2 U20 ( .A(state[1]), .Y(n84) );
  INVX2 U21 ( .A(state[2]), .Y(n85) );
  INVX2 U22 ( .A(state[0]), .Y(n86) );
  INVX2 U25 ( .A(op[5]), .Y(n87) );
  INVX2 U26 ( .A(n43), .Y(n88) );
  INVX2 U27 ( .A(op[3]), .Y(n89) );
  INVX2 U28 ( .A(op[1]), .Y(n90) );
  INVX2 U29 ( .A(reset), .Y(n91) );
endmodule


module mux2_2 ( a, b, sel, y );
  input [7:0] a;
  input [7:0] b;
  output [7:0] y;
  input sel;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n3;

  INVX2 U1 ( .A(n10), .Y(y[7]) );
  INVX2 U2 ( .A(n11), .Y(y[6]) );
  INVX2 U3 ( .A(n12), .Y(y[5]) );
  INVX2 U4 ( .A(n13), .Y(y[4]) );
  INVX2 U5 ( .A(n14), .Y(y[3]) );
  INVX2 U6 ( .A(n15), .Y(y[2]) );
  INVX2 U7 ( .A(n16), .Y(y[1]) );
  INVX2 U8 ( .A(n17), .Y(y[0]) );
  AOI22X1 U10 ( .A(a[7]), .B(n3), .C(sel), .D(b[7]), .Y(n10) );
  AOI22X1 U11 ( .A(a[6]), .B(n3), .C(b[6]), .D(sel), .Y(n11) );
  AOI22X1 U12 ( .A(a[5]), .B(n3), .C(b[5]), .D(sel), .Y(n12) );
  AOI22X1 U13 ( .A(a[4]), .B(n3), .C(b[4]), .D(sel), .Y(n13) );
  AOI22X1 U14 ( .A(a[3]), .B(n3), .C(b[3]), .D(sel), .Y(n14) );
  AOI22X1 U15 ( .A(a[2]), .B(n3), .C(b[2]), .D(sel), .Y(n15) );
  AOI22X1 U16 ( .A(a[1]), .B(n3), .C(b[1]), .D(sel), .Y(n16) );
  AOI22X1 U17 ( .A(a[0]), .B(n3), .C(b[0]), .D(sel), .Y(n17) );
  INVX2 U9 ( .A(sel), .Y(n3) );
endmodule


module mux2_DATA_WIDTH5 ( a, b, sel, y );
  input [4:0] a;
  input [4:0] b;
  output [4:0] y;
  input sel;
  wire   n7, n8, n9, n10, n11, n3;

  INVX2 U1 ( .A(n7), .Y(y[4]) );
  INVX2 U2 ( .A(n8), .Y(y[3]) );
  INVX2 U3 ( .A(n9), .Y(y[2]) );
  INVX2 U4 ( .A(n10), .Y(y[1]) );
  INVX2 U5 ( .A(n11), .Y(y[0]) );
  AOI22X1 U7 ( .A(a[4]), .B(n3), .C(sel), .D(b[4]), .Y(n7) );
  AOI22X1 U8 ( .A(a[3]), .B(n3), .C(b[3]), .D(sel), .Y(n8) );
  AOI22X1 U9 ( .A(a[2]), .B(n3), .C(b[2]), .D(sel), .Y(n9) );
  AOI22X1 U10 ( .A(a[1]), .B(n3), .C(b[1]), .D(sel), .Y(n10) );
  AOI22X1 U11 ( .A(a[0]), .B(n3), .C(b[0]), .D(sel), .Y(n11) );
  INVX2 U6 ( .A(sel), .Y(n3) );
endmodule


module mux2_1 ( a, b, sel, y );
  input [7:0] a;
  input [7:0] b;
  output [7:0] y;
  input sel;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n19, n20;

  INVX2 U1 ( .A(n10), .Y(y[7]) );
  INVX2 U2 ( .A(n11), .Y(y[6]) );
  INVX2 U3 ( .A(n12), .Y(y[5]) );
  INVX2 U4 ( .A(n13), .Y(y[4]) );
  INVX2 U5 ( .A(n14), .Y(y[3]) );
  INVX2 U6 ( .A(n15), .Y(y[2]) );
  INVX2 U7 ( .A(n16), .Y(y[1]) );
  INVX2 U8 ( .A(n17), .Y(y[0]) );
  AOI22X1 U10 ( .A(a[7]), .B(n20), .C(n19), .D(b[7]), .Y(n10) );
  AOI22X1 U11 ( .A(a[6]), .B(n20), .C(b[6]), .D(n19), .Y(n11) );
  AOI22X1 U12 ( .A(a[5]), .B(n20), .C(b[5]), .D(n19), .Y(n12) );
  AOI22X1 U13 ( .A(a[4]), .B(n20), .C(b[4]), .D(n19), .Y(n13) );
  AOI22X1 U14 ( .A(a[3]), .B(n20), .C(b[3]), .D(n19), .Y(n14) );
  AOI22X1 U15 ( .A(a[2]), .B(n20), .C(b[2]), .D(n19), .Y(n15) );
  AOI22X1 U16 ( .A(a[1]), .B(n20), .C(b[1]), .D(n19), .Y(n16) );
  AOI22X1 U17 ( .A(a[0]), .B(n20), .C(b[0]), .D(n19), .Y(n17) );
  BUFX2 U9 ( .A(sel), .Y(n19) );
  INVX2 U18 ( .A(n19), .Y(n20) );
endmodule


module register_file ( clk, reset, regwrite, ra1, ra2, wa, wd, rd1, rd2 );
  input [4:0] ra1;
  input [4:0] ra2;
  input [4:0] wa;
  input [7:0] wd;
  output [7:0] rd1;
  output [7:0] rd2;
  input clk, reset, regwrite;
  wire   n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n152, n153, n154, n155, n158, n159, n160,
         n161, n162, n163, n188, n189, n190, n191, n192, n193, n194, n195,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561;
  wire   [7:0] rd1_next;
  wire   [55:0] REGS;
  wire   [7:0] rd2_next;

  DFFSR rd1_reg_7_ ( .D(rd1_next[7]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd1[7]) );
  DFFSR rd1_reg_6_ ( .D(rd1_next[6]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd1[6]) );
  DFFSR rd1_reg_5_ ( .D(rd1_next[5]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd1[5]) );
  DFFSR rd1_reg_4_ ( .D(rd1_next[4]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd1[4]) );
  DFFSR rd1_reg_3_ ( .D(rd1_next[3]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd1[3]) );
  DFFSR rd1_reg_2_ ( .D(rd1_next[2]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd1[2]) );
  DFFSR rd1_reg_1_ ( .D(rd1_next[1]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd1[1]) );
  DFFSR rd1_reg_0_ ( .D(rd1_next[0]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd1[0]) );
  DFFSR rd2_reg_7_ ( .D(rd2_next[7]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd2[7]) );
  DFFSR rd2_reg_6_ ( .D(rd2_next[6]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd2[6]) );
  DFFSR rd2_reg_5_ ( .D(rd2_next[5]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd2[5]) );
  DFFSR rd2_reg_4_ ( .D(rd2_next[4]), .CLK(n488), .R(n478), .S(1'b1), .Q(
        rd2[4]) );
  DFFSR rd2_reg_3_ ( .D(rd2_next[3]), .CLK(n488), .R(n479), .S(1'b1), .Q(
        rd2[3]) );
  DFFSR rd2_reg_2_ ( .D(rd2_next[2]), .CLK(n487), .R(n479), .S(1'b1), .Q(
        rd2[2]) );
  DFFSR rd2_reg_1_ ( .D(rd2_next[1]), .CLK(n487), .R(n479), .S(1'b1), .Q(
        rd2[1]) );
  DFFSR rd2_reg_0_ ( .D(rd2_next[0]), .CLK(n487), .R(n479), .S(1'b1), .Q(
        rd2[0]) );
  DFFSR REGS_reg_7__7_ ( .D(n219), .CLK(n487), .R(n479), .S(1'b1), .Q(REGS[55]) );
  DFFSR REGS_reg_7__6_ ( .D(n218), .CLK(n487), .R(n479), .S(1'b1), .Q(REGS[54]) );
  DFFSR REGS_reg_7__5_ ( .D(n217), .CLK(n487), .R(n479), .S(1'b1), .Q(REGS[53]) );
  DFFSR REGS_reg_7__4_ ( .D(n216), .CLK(n487), .R(n479), .S(1'b1), .Q(REGS[52]) );
  DFFSR REGS_reg_7__3_ ( .D(n215), .CLK(n487), .R(n479), .S(1'b1), .Q(REGS[51]) );
  DFFSR REGS_reg_7__2_ ( .D(n214), .CLK(n487), .R(n479), .S(1'b1), .Q(REGS[50]) );
  DFFSR REGS_reg_7__1_ ( .D(n213), .CLK(n487), .R(n479), .S(1'b1), .Q(REGS[49]) );
  DFFSR REGS_reg_7__0_ ( .D(n212), .CLK(n487), .R(n479), .S(1'b1), .Q(REGS[48]) );
  DFFSR REGS_reg_6__7_ ( .D(n211), .CLK(n487), .R(n480), .S(1'b1), .Q(REGS[47]) );
  DFFSR REGS_reg_6__6_ ( .D(n210), .CLK(n487), .R(n480), .S(1'b1), .Q(REGS[46]) );
  DFFSR REGS_reg_6__5_ ( .D(n209), .CLK(n486), .R(n480), .S(1'b1), .Q(REGS[45]) );
  DFFSR REGS_reg_6__4_ ( .D(n208), .CLK(n486), .R(n480), .S(1'b1), .Q(REGS[44]) );
  DFFSR REGS_reg_6__3_ ( .D(n207), .CLK(n486), .R(n480), .S(1'b1), .Q(REGS[43]) );
  DFFSR REGS_reg_6__2_ ( .D(n206), .CLK(n486), .R(n480), .S(1'b1), .Q(REGS[42]) );
  DFFSR REGS_reg_6__1_ ( .D(n205), .CLK(n486), .R(n480), .S(1'b1), .Q(REGS[41]) );
  DFFSR REGS_reg_6__0_ ( .D(n204), .CLK(n486), .R(n480), .S(1'b1), .Q(REGS[40]) );
  DFFSR REGS_reg_5__7_ ( .D(n203), .CLK(n486), .R(n480), .S(1'b1), .Q(REGS[39]) );
  DFFSR REGS_reg_5__6_ ( .D(n202), .CLK(n486), .R(n480), .S(1'b1), .Q(REGS[38]) );
  DFFSR REGS_reg_5__5_ ( .D(n201), .CLK(n486), .R(n480), .S(1'b1), .Q(REGS[37]) );
  DFFSR REGS_reg_5__4_ ( .D(n200), .CLK(n486), .R(n480), .S(1'b1), .Q(REGS[36]) );
  DFFSR REGS_reg_5__3_ ( .D(n199), .CLK(n486), .R(n481), .S(1'b1), .Q(REGS[35]) );
  DFFSR REGS_reg_5__2_ ( .D(n198), .CLK(n486), .R(n481), .S(1'b1), .Q(REGS[34]) );
  DFFSR REGS_reg_5__1_ ( .D(n197), .CLK(n486), .R(n481), .S(1'b1), .Q(REGS[33]) );
  DFFSR REGS_reg_5__0_ ( .D(n196), .CLK(n485), .R(n481), .S(1'b1), .Q(REGS[32]) );
  DFFSR REGS_reg_4__7_ ( .D(n300), .CLK(n485), .R(n481), .S(1'b1), .Q(REGS[31]) );
  DFFSR REGS_reg_4__6_ ( .D(n301), .CLK(n485), .R(n481), .S(1'b1), .Q(REGS[30]) );
  DFFSR REGS_reg_4__5_ ( .D(n302), .CLK(n485), .R(n481), .S(1'b1), .Q(REGS[29]) );
  DFFSR REGS_reg_4__4_ ( .D(n303), .CLK(n485), .R(n481), .S(1'b1), .Q(REGS[28]) );
  DFFSR REGS_reg_4__3_ ( .D(n304), .CLK(n485), .R(n481), .S(1'b1), .Q(REGS[27]) );
  DFFSR REGS_reg_4__2_ ( .D(n305), .CLK(n485), .R(n481), .S(1'b1), .Q(REGS[26]) );
  DFFSR REGS_reg_4__1_ ( .D(n306), .CLK(n485), .R(n481), .S(1'b1), .Q(REGS[25]) );
  DFFSR REGS_reg_4__0_ ( .D(n307), .CLK(n485), .R(n481), .S(1'b1), .Q(REGS[24]) );
  DFFSR REGS_reg_3__7_ ( .D(n187), .CLK(n485), .R(n482), .S(1'b1), .Q(REGS[23]) );
  DFFSR REGS_reg_3__6_ ( .D(n186), .CLK(n485), .R(n482), .S(1'b1), .Q(REGS[22]) );
  DFFSR REGS_reg_3__5_ ( .D(n185), .CLK(n485), .R(n482), .S(1'b1), .Q(REGS[21]) );
  DFFSR REGS_reg_3__4_ ( .D(n184), .CLK(n485), .R(n482), .S(1'b1), .Q(REGS[20]) );
  DFFSR REGS_reg_3__3_ ( .D(n183), .CLK(n484), .R(n482), .S(1'b1), .Q(REGS[19]) );
  DFFSR REGS_reg_3__2_ ( .D(n182), .CLK(n484), .R(n482), .S(1'b1), .Q(REGS[18]) );
  DFFSR REGS_reg_3__1_ ( .D(n181), .CLK(n484), .R(n482), .S(1'b1), .Q(REGS[17]) );
  DFFSR REGS_reg_3__0_ ( .D(n180), .CLK(n484), .R(n482), .S(1'b1), .Q(REGS[16]) );
  DFFSR REGS_reg_2__7_ ( .D(n179), .CLK(n484), .R(n482), .S(1'b1), .Q(REGS[15]) );
  DFFSR REGS_reg_2__6_ ( .D(n178), .CLK(n484), .R(n482), .S(1'b1), .Q(REGS[14]) );
  DFFSR REGS_reg_2__5_ ( .D(n177), .CLK(n484), .R(n482), .S(1'b1), .Q(REGS[13]) );
  DFFSR REGS_reg_2__4_ ( .D(n176), .CLK(n484), .R(n482), .S(1'b1), .Q(REGS[12]) );
  DFFSR REGS_reg_2__3_ ( .D(n175), .CLK(n484), .R(n483), .S(1'b1), .Q(REGS[11]) );
  DFFSR REGS_reg_2__2_ ( .D(n174), .CLK(n484), .R(n483), .S(1'b1), .Q(REGS[10]) );
  DFFSR REGS_reg_2__1_ ( .D(n173), .CLK(n484), .R(n483), .S(1'b1), .Q(REGS[9])
         );
  DFFSR REGS_reg_2__0_ ( .D(n172), .CLK(n484), .R(n483), .S(1'b1), .Q(REGS[8])
         );
  DFFSR REGS_reg_1__7_ ( .D(n171), .CLK(n484), .R(n483), .S(1'b1), .Q(REGS[7])
         );
  DFFSR REGS_reg_1__6_ ( .D(n170), .CLK(n489), .R(n483), .S(1'b1), .Q(REGS[6])
         );
  DFFSR REGS_reg_1__5_ ( .D(n169), .CLK(n489), .R(n483), .S(1'b1), .Q(REGS[5])
         );
  DFFSR REGS_reg_1__4_ ( .D(n168), .CLK(n489), .R(n483), .S(1'b1), .Q(REGS[4])
         );
  DFFSR REGS_reg_1__3_ ( .D(n167), .CLK(n489), .R(n483), .S(1'b1), .Q(REGS[3])
         );
  DFFSR REGS_reg_1__2_ ( .D(n166), .CLK(n489), .R(n483), .S(1'b1), .Q(REGS[2])
         );
  DFFSR REGS_reg_1__1_ ( .D(n165), .CLK(n489), .R(n483), .S(1'b1), .Q(REGS[1])
         );
  DFFSR REGS_reg_1__0_ ( .D(n164), .CLK(n489), .R(n483), .S(1'b1), .Q(REGS[0])
         );
  OAI21X1 U154 ( .A(ra2[0]), .B(n152), .C(n153), .Y(rd2_next[7]) );
  OAI21X1 U155 ( .A(n154), .B(n155), .C(n464), .Y(n153) );
  OAI22X1 U156 ( .A(n559), .B(n514), .C(n476), .D(n498), .Y(n155) );
  OAI22X1 U157 ( .A(n477), .B(n530), .C(n158), .D(n546), .Y(n154) );
  AOI21X1 U158 ( .A(REGS[31]), .B(n159), .C(n160), .Y(n152) );
  OAI22X1 U159 ( .A(n476), .B(n506), .C(n477), .D(n538), .Y(n160) );
  OAI21X1 U160 ( .A(n464), .B(n161), .C(n162), .Y(rd2_next[6]) );
  OAI21X1 U161 ( .A(n163), .B(n188), .C(n464), .Y(n162) );
  OAI22X1 U162 ( .A(n559), .B(n515), .C(n476), .D(n499), .Y(n188) );
  OAI22X1 U163 ( .A(n477), .B(n531), .C(n158), .D(n547), .Y(n163) );
  AOI21X1 U164 ( .A(REGS[30]), .B(n159), .C(n189), .Y(n161) );
  OAI22X1 U165 ( .A(n476), .B(n507), .C(n477), .D(n539), .Y(n189) );
  OAI21X1 U166 ( .A(ra2[0]), .B(n190), .C(n191), .Y(rd2_next[5]) );
  OAI21X1 U167 ( .A(n192), .B(n193), .C(ra2[0]), .Y(n191) );
  OAI22X1 U168 ( .A(n559), .B(n516), .C(n476), .D(n500), .Y(n193) );
  OAI22X1 U169 ( .A(n477), .B(n532), .C(n158), .D(n548), .Y(n192) );
  AOI21X1 U170 ( .A(REGS[29]), .B(n159), .C(n194), .Y(n190) );
  OAI22X1 U171 ( .A(n476), .B(n508), .C(n477), .D(n540), .Y(n194) );
  OAI21X1 U172 ( .A(n464), .B(n195), .C(n220), .Y(rd2_next[4]) );
  OAI21X1 U173 ( .A(n221), .B(n222), .C(n464), .Y(n220) );
  OAI22X1 U174 ( .A(n559), .B(n517), .C(n476), .D(n501), .Y(n222) );
  OAI22X1 U175 ( .A(n477), .B(n533), .C(n158), .D(n549), .Y(n221) );
  AOI21X1 U176 ( .A(REGS[28]), .B(n159), .C(n223), .Y(n195) );
  OAI22X1 U177 ( .A(n476), .B(n509), .C(n477), .D(n541), .Y(n223) );
  OAI21X1 U178 ( .A(ra2[0]), .B(n224), .C(n225), .Y(rd2_next[3]) );
  OAI21X1 U179 ( .A(n226), .B(n227), .C(n464), .Y(n225) );
  OAI22X1 U180 ( .A(n559), .B(n518), .C(n476), .D(n502), .Y(n227) );
  OAI22X1 U181 ( .A(n477), .B(n534), .C(n158), .D(n550), .Y(n226) );
  AOI21X1 U182 ( .A(REGS[27]), .B(n159), .C(n228), .Y(n224) );
  OAI22X1 U183 ( .A(n476), .B(n510), .C(n477), .D(n542), .Y(n228) );
  OAI21X1 U184 ( .A(n464), .B(n229), .C(n230), .Y(rd2_next[2]) );
  OAI21X1 U185 ( .A(n231), .B(n232), .C(n464), .Y(n230) );
  OAI22X1 U186 ( .A(n559), .B(n519), .C(n476), .D(n503), .Y(n232) );
  OAI22X1 U187 ( .A(n477), .B(n535), .C(n158), .D(n551), .Y(n231) );
  AOI21X1 U188 ( .A(REGS[26]), .B(n159), .C(n233), .Y(n229) );
  OAI22X1 U189 ( .A(n476), .B(n511), .C(n477), .D(n543), .Y(n233) );
  OAI21X1 U190 ( .A(ra2[0]), .B(n234), .C(n235), .Y(rd2_next[1]) );
  OAI21X1 U191 ( .A(n236), .B(n237), .C(ra2[0]), .Y(n235) );
  OAI22X1 U192 ( .A(n559), .B(n520), .C(n476), .D(n504), .Y(n237) );
  OAI22X1 U193 ( .A(n477), .B(n536), .C(n158), .D(n552), .Y(n236) );
  AOI21X1 U194 ( .A(REGS[25]), .B(n159), .C(n238), .Y(n234) );
  OAI22X1 U195 ( .A(n476), .B(n512), .C(n477), .D(n544), .Y(n238) );
  OAI21X1 U196 ( .A(n464), .B(n239), .C(n240), .Y(rd2_next[0]) );
  OAI21X1 U197 ( .A(n241), .B(n242), .C(n464), .Y(n240) );
  OAI22X1 U198 ( .A(n559), .B(n521), .C(n476), .D(n505), .Y(n242) );
  OAI22X1 U199 ( .A(n477), .B(n537), .C(n158), .D(n553), .Y(n241) );
  OR2X1 U200 ( .A(ra2[2]), .B(ra2[1]), .Y(n158) );
  AOI21X1 U201 ( .A(REGS[24]), .B(n159), .C(n243), .Y(n239) );
  OAI22X1 U202 ( .A(n476), .B(n513), .C(n477), .D(n545), .Y(n243) );
  NOR2X1 U205 ( .A(n560), .B(ra2[1]), .Y(n159) );
  OAI21X1 U206 ( .A(ra1[0]), .B(n244), .C(n245), .Y(rd1_next[7]) );
  OAI21X1 U207 ( .A(n246), .B(n247), .C(ra1[0]), .Y(n245) );
  OAI22X1 U208 ( .A(n514), .B(n557), .C(n498), .D(n474), .Y(n247) );
  OAI22X1 U209 ( .A(n530), .B(n475), .C(n546), .D(n250), .Y(n246) );
  AOI21X1 U210 ( .A(n251), .B(REGS[31]), .C(n252), .Y(n244) );
  OAI22X1 U211 ( .A(n506), .B(n474), .C(n538), .D(n475), .Y(n252) );
  OAI21X1 U212 ( .A(n466), .B(n253), .C(n254), .Y(rd1_next[6]) );
  OAI21X1 U213 ( .A(n255), .B(n256), .C(n466), .Y(n254) );
  OAI22X1 U214 ( .A(n515), .B(n557), .C(n499), .D(n474), .Y(n256) );
  OAI22X1 U215 ( .A(n531), .B(n475), .C(n547), .D(n250), .Y(n255) );
  AOI21X1 U216 ( .A(n251), .B(REGS[30]), .C(n257), .Y(n253) );
  OAI22X1 U217 ( .A(n507), .B(n474), .C(n539), .D(n475), .Y(n257) );
  OAI21X1 U218 ( .A(ra1[0]), .B(n258), .C(n259), .Y(rd1_next[5]) );
  OAI21X1 U219 ( .A(n260), .B(n261), .C(ra1[0]), .Y(n259) );
  OAI22X1 U220 ( .A(n516), .B(n557), .C(n500), .D(n474), .Y(n261) );
  OAI22X1 U221 ( .A(n532), .B(n475), .C(n548), .D(n250), .Y(n260) );
  AOI21X1 U222 ( .A(n251), .B(REGS[29]), .C(n262), .Y(n258) );
  OAI22X1 U223 ( .A(n508), .B(n474), .C(n540), .D(n475), .Y(n262) );
  OAI21X1 U224 ( .A(n466), .B(n263), .C(n264), .Y(rd1_next[4]) );
  OAI21X1 U225 ( .A(n265), .B(n266), .C(n466), .Y(n264) );
  OAI22X1 U226 ( .A(n517), .B(n557), .C(n501), .D(n474), .Y(n266) );
  OAI22X1 U227 ( .A(n533), .B(n475), .C(n549), .D(n250), .Y(n265) );
  AOI21X1 U228 ( .A(n251), .B(REGS[28]), .C(n267), .Y(n263) );
  OAI22X1 U229 ( .A(n509), .B(n474), .C(n541), .D(n475), .Y(n267) );
  OAI21X1 U230 ( .A(ra1[0]), .B(n268), .C(n269), .Y(rd1_next[3]) );
  OAI21X1 U231 ( .A(n270), .B(n271), .C(n466), .Y(n269) );
  OAI22X1 U232 ( .A(n518), .B(n557), .C(n502), .D(n474), .Y(n271) );
  OAI22X1 U233 ( .A(n534), .B(n475), .C(n550), .D(n250), .Y(n270) );
  AOI21X1 U234 ( .A(n251), .B(REGS[27]), .C(n272), .Y(n268) );
  OAI22X1 U235 ( .A(n510), .B(n474), .C(n542), .D(n475), .Y(n272) );
  OAI21X1 U236 ( .A(n466), .B(n273), .C(n274), .Y(rd1_next[2]) );
  OAI21X1 U237 ( .A(n275), .B(n276), .C(n466), .Y(n274) );
  OAI22X1 U238 ( .A(n519), .B(n557), .C(n503), .D(n474), .Y(n276) );
  OAI22X1 U239 ( .A(n535), .B(n475), .C(n551), .D(n250), .Y(n275) );
  AOI21X1 U240 ( .A(n251), .B(REGS[26]), .C(n277), .Y(n273) );
  OAI22X1 U241 ( .A(n511), .B(n474), .C(n543), .D(n475), .Y(n277) );
  OAI21X1 U242 ( .A(ra1[0]), .B(n278), .C(n279), .Y(rd1_next[1]) );
  OAI21X1 U243 ( .A(n280), .B(n281), .C(ra1[0]), .Y(n279) );
  OAI22X1 U244 ( .A(n520), .B(n557), .C(n504), .D(n474), .Y(n281) );
  OAI22X1 U245 ( .A(n536), .B(n475), .C(n552), .D(n250), .Y(n280) );
  AOI21X1 U246 ( .A(n251), .B(REGS[25]), .C(n282), .Y(n278) );
  OAI22X1 U247 ( .A(n512), .B(n474), .C(n544), .D(n475), .Y(n282) );
  OAI21X1 U248 ( .A(n466), .B(n283), .C(n284), .Y(rd1_next[0]) );
  OAI21X1 U249 ( .A(n285), .B(n286), .C(n466), .Y(n284) );
  OAI22X1 U250 ( .A(n521), .B(n557), .C(n505), .D(n474), .Y(n286) );
  OAI22X1 U251 ( .A(n537), .B(n475), .C(n553), .D(n250), .Y(n285) );
  OR2X1 U252 ( .A(ra1[2]), .B(ra1[1]), .Y(n250) );
  AOI21X1 U253 ( .A(n251), .B(REGS[24]), .C(n287), .Y(n283) );
  OAI22X1 U254 ( .A(n513), .B(n474), .C(n545), .D(n475), .Y(n287) );
  NOR2X1 U257 ( .A(n558), .B(ra1[1]), .Y(n251) );
  OAI22X1 U258 ( .A(n473), .B(n522), .C(n288), .D(n491), .Y(n300) );
  OAI22X1 U259 ( .A(n473), .B(n523), .C(n288), .D(n492), .Y(n301) );
  OAI22X1 U260 ( .A(n473), .B(n524), .C(n288), .D(n493), .Y(n302) );
  OAI22X1 U261 ( .A(n473), .B(n525), .C(n288), .D(n494), .Y(n303) );
  OAI22X1 U262 ( .A(n473), .B(n526), .C(n288), .D(n495), .Y(n304) );
  OAI22X1 U263 ( .A(n473), .B(n527), .C(n288), .D(n496), .Y(n305) );
  OAI22X1 U264 ( .A(n473), .B(n528), .C(n288), .D(n497), .Y(n306) );
  OAI22X1 U265 ( .A(n473), .B(n529), .C(n288), .D(n490), .Y(n307) );
  NAND2X1 U266 ( .A(n289), .B(n290), .Y(n288) );
  OAI22X1 U267 ( .A(n472), .B(n498), .C(n491), .D(n291), .Y(n219) );
  OAI22X1 U268 ( .A(n472), .B(n499), .C(n492), .D(n291), .Y(n218) );
  OAI22X1 U269 ( .A(n472), .B(n500), .C(n493), .D(n291), .Y(n217) );
  OAI22X1 U270 ( .A(n472), .B(n501), .C(n494), .D(n291), .Y(n216) );
  OAI22X1 U271 ( .A(n472), .B(n502), .C(n495), .D(n291), .Y(n215) );
  OAI22X1 U272 ( .A(n472), .B(n503), .C(n496), .D(n291), .Y(n214) );
  OAI22X1 U273 ( .A(n472), .B(n504), .C(n497), .D(n291), .Y(n213) );
  OAI22X1 U274 ( .A(n472), .B(n505), .C(n490), .D(n291), .Y(n212) );
  NAND3X1 U275 ( .A(wa[0]), .B(n289), .C(wa[1]), .Y(n291) );
  OAI22X1 U276 ( .A(n471), .B(n506), .C(n491), .D(n292), .Y(n211) );
  OAI22X1 U277 ( .A(n471), .B(n507), .C(n492), .D(n292), .Y(n210) );
  OAI22X1 U278 ( .A(n471), .B(n508), .C(n493), .D(n292), .Y(n209) );
  OAI22X1 U279 ( .A(n471), .B(n509), .C(n494), .D(n292), .Y(n208) );
  OAI22X1 U280 ( .A(n471), .B(n510), .C(n495), .D(n292), .Y(n207) );
  OAI22X1 U281 ( .A(n471), .B(n511), .C(n496), .D(n292), .Y(n206) );
  OAI22X1 U282 ( .A(n471), .B(n512), .C(n497), .D(n292), .Y(n205) );
  OAI22X1 U283 ( .A(n471), .B(n513), .C(n490), .D(n292), .Y(n204) );
  NAND3X1 U284 ( .A(n289), .B(n554), .C(wa[1]), .Y(n292) );
  OAI22X1 U285 ( .A(n470), .B(n514), .C(n491), .D(n293), .Y(n203) );
  OAI22X1 U286 ( .A(n470), .B(n515), .C(n492), .D(n293), .Y(n202) );
  OAI22X1 U287 ( .A(n470), .B(n516), .C(n493), .D(n293), .Y(n201) );
  OAI22X1 U288 ( .A(n470), .B(n517), .C(n494), .D(n293), .Y(n200) );
  OAI22X1 U289 ( .A(n470), .B(n518), .C(n495), .D(n293), .Y(n199) );
  OAI22X1 U290 ( .A(n470), .B(n519), .C(n496), .D(n293), .Y(n198) );
  OAI22X1 U291 ( .A(n470), .B(n520), .C(n497), .D(n293), .Y(n197) );
  OAI22X1 U292 ( .A(n470), .B(n521), .C(n490), .D(n293), .Y(n196) );
  NAND3X1 U293 ( .A(n289), .B(n555), .C(wa[0]), .Y(n293) );
  NOR2X1 U294 ( .A(n556), .B(n294), .Y(n289) );
  OAI22X1 U295 ( .A(n469), .B(n530), .C(n491), .D(n295), .Y(n187) );
  OAI22X1 U296 ( .A(n469), .B(n531), .C(n492), .D(n295), .Y(n186) );
  OAI22X1 U297 ( .A(n469), .B(n532), .C(n493), .D(n295), .Y(n185) );
  OAI22X1 U298 ( .A(n469), .B(n533), .C(n494), .D(n295), .Y(n184) );
  OAI22X1 U299 ( .A(n469), .B(n534), .C(n495), .D(n295), .Y(n183) );
  OAI22X1 U300 ( .A(n469), .B(n535), .C(n496), .D(n295), .Y(n182) );
  OAI22X1 U301 ( .A(n469), .B(n536), .C(n497), .D(n295), .Y(n181) );
  OAI22X1 U302 ( .A(n469), .B(n537), .C(n490), .D(n295), .Y(n180) );
  NAND3X1 U303 ( .A(wa[1]), .B(wa[0]), .C(n296), .Y(n295) );
  OAI22X1 U304 ( .A(n468), .B(n538), .C(n491), .D(n297), .Y(n179) );
  OAI22X1 U305 ( .A(n468), .B(n539), .C(n492), .D(n297), .Y(n178) );
  OAI22X1 U306 ( .A(n468), .B(n540), .C(n493), .D(n297), .Y(n177) );
  OAI22X1 U307 ( .A(n468), .B(n541), .C(n494), .D(n297), .Y(n176) );
  OAI22X1 U308 ( .A(n468), .B(n542), .C(n495), .D(n297), .Y(n175) );
  OAI22X1 U309 ( .A(n468), .B(n543), .C(n496), .D(n297), .Y(n174) );
  OAI22X1 U310 ( .A(n468), .B(n544), .C(n497), .D(n297), .Y(n173) );
  OAI22X1 U311 ( .A(n468), .B(n545), .C(n490), .D(n297), .Y(n172) );
  NAND2X1 U312 ( .A(n296), .B(n554), .Y(n297) );
  OAI22X1 U313 ( .A(n467), .B(n546), .C(n491), .D(n298), .Y(n171) );
  OAI22X1 U314 ( .A(n467), .B(n547), .C(n492), .D(n298), .Y(n170) );
  OAI22X1 U315 ( .A(n467), .B(n548), .C(n493), .D(n298), .Y(n169) );
  OAI22X1 U316 ( .A(n467), .B(n549), .C(n494), .D(n298), .Y(n168) );
  OAI22X1 U317 ( .A(n467), .B(n550), .C(n495), .D(n298), .Y(n167) );
  OAI22X1 U318 ( .A(n467), .B(n551), .C(n496), .D(n298), .Y(n166) );
  OAI22X1 U319 ( .A(n467), .B(n552), .C(n497), .D(n298), .Y(n165) );
  OAI22X1 U320 ( .A(n467), .B(n553), .C(n490), .D(n298), .Y(n164) );
  NAND2X1 U321 ( .A(n296), .B(n555), .Y(n298) );
  NOR3X1 U322 ( .A(n290), .B(wa[2]), .C(n294), .Y(n296) );
  NAND2X1 U323 ( .A(n299), .B(regwrite), .Y(n294) );
  NOR2X1 U324 ( .A(wa[4]), .B(wa[3]), .Y(n299) );
  NOR2X1 U325 ( .A(wa[1]), .B(wa[0]), .Y(n290) );
  BUFX2 U3 ( .A(clk), .Y(n484) );
  BUFX2 U4 ( .A(clk), .Y(n485) );
  BUFX2 U5 ( .A(clk), .Y(n486) );
  BUFX2 U6 ( .A(clk), .Y(n487) );
  BUFX2 U7 ( .A(clk), .Y(n488) );
  INVX2 U8 ( .A(n298), .Y(n467) );
  INVX2 U9 ( .A(n297), .Y(n468) );
  INVX2 U10 ( .A(n288), .Y(n473) );
  BUFX2 U82 ( .A(clk), .Y(n489) );
  BUFX2 U84 ( .A(n561), .Y(n483) );
  BUFX2 U85 ( .A(n561), .Y(n482) );
  BUFX2 U86 ( .A(n561), .Y(n481) );
  BUFX2 U87 ( .A(n561), .Y(n480) );
  BUFX2 U88 ( .A(n561), .Y(n479) );
  BUFX2 U89 ( .A(n561), .Y(n478) );
  INVX2 U90 ( .A(n293), .Y(n470) );
  INVX2 U91 ( .A(n292), .Y(n471) );
  INVX2 U92 ( .A(n291), .Y(n472) );
  INVX2 U93 ( .A(n295), .Y(n469) );
  INVX2 U94 ( .A(n461), .Y(n475) );
  INVX2 U95 ( .A(n462), .Y(n474) );
  INVX2 U96 ( .A(n459), .Y(n477) );
  INVX2 U97 ( .A(n460), .Y(n476) );
  INVX2 U98 ( .A(n463), .Y(n464) );
  INVX2 U99 ( .A(n465), .Y(n466) );
  INVX2 U100 ( .A(ra2[0]), .Y(n463) );
  INVX2 U101 ( .A(ra1[0]), .Y(n465) );
  AND2X2 U102 ( .A(ra2[1]), .B(n560), .Y(n459) );
  AND2X2 U103 ( .A(ra2[2]), .B(ra2[1]), .Y(n460) );
  AND2X2 U104 ( .A(ra1[1]), .B(n558), .Y(n461) );
  AND2X2 U105 ( .A(ra1[2]), .B(ra1[1]), .Y(n462) );
  INVX2 U106 ( .A(wd[0]), .Y(n490) );
  INVX2 U107 ( .A(wd[7]), .Y(n491) );
  INVX2 U108 ( .A(wd[6]), .Y(n492) );
  INVX2 U109 ( .A(wd[5]), .Y(n493) );
  INVX2 U110 ( .A(wd[4]), .Y(n494) );
  INVX2 U111 ( .A(wd[3]), .Y(n495) );
  INVX2 U112 ( .A(wd[2]), .Y(n496) );
  INVX2 U113 ( .A(wd[1]), .Y(n497) );
  INVX2 U114 ( .A(REGS[55]), .Y(n498) );
  INVX2 U115 ( .A(REGS[54]), .Y(n499) );
  INVX2 U116 ( .A(REGS[53]), .Y(n500) );
  INVX2 U117 ( .A(REGS[52]), .Y(n501) );
  INVX2 U118 ( .A(REGS[51]), .Y(n502) );
  INVX2 U119 ( .A(REGS[50]), .Y(n503) );
  INVX2 U120 ( .A(REGS[49]), .Y(n504) );
  INVX2 U121 ( .A(REGS[48]), .Y(n505) );
  INVX2 U122 ( .A(REGS[47]), .Y(n506) );
  INVX2 U123 ( .A(REGS[46]), .Y(n507) );
  INVX2 U124 ( .A(REGS[45]), .Y(n508) );
  INVX2 U125 ( .A(REGS[44]), .Y(n509) );
  INVX2 U126 ( .A(REGS[43]), .Y(n510) );
  INVX2 U127 ( .A(REGS[42]), .Y(n511) );
  INVX2 U128 ( .A(REGS[41]), .Y(n512) );
  INVX2 U129 ( .A(REGS[40]), .Y(n513) );
  INVX2 U130 ( .A(REGS[39]), .Y(n514) );
  INVX2 U131 ( .A(REGS[38]), .Y(n515) );
  INVX2 U132 ( .A(REGS[37]), .Y(n516) );
  INVX2 U133 ( .A(REGS[36]), .Y(n517) );
  INVX2 U134 ( .A(REGS[35]), .Y(n518) );
  INVX2 U135 ( .A(REGS[34]), .Y(n519) );
  INVX2 U136 ( .A(REGS[33]), .Y(n520) );
  INVX2 U137 ( .A(REGS[32]), .Y(n521) );
  INVX2 U138 ( .A(REGS[31]), .Y(n522) );
  INVX2 U139 ( .A(REGS[30]), .Y(n523) );
  INVX2 U140 ( .A(REGS[29]), .Y(n524) );
  INVX2 U141 ( .A(REGS[28]), .Y(n525) );
  INVX2 U142 ( .A(REGS[27]), .Y(n526) );
  INVX2 U143 ( .A(REGS[26]), .Y(n527) );
  INVX2 U144 ( .A(REGS[25]), .Y(n528) );
  INVX2 U145 ( .A(REGS[24]), .Y(n529) );
  INVX2 U146 ( .A(REGS[23]), .Y(n530) );
  INVX2 U147 ( .A(REGS[22]), .Y(n531) );
  INVX2 U148 ( .A(REGS[21]), .Y(n532) );
  INVX2 U149 ( .A(REGS[20]), .Y(n533) );
  INVX2 U150 ( .A(REGS[19]), .Y(n534) );
  INVX2 U151 ( .A(REGS[18]), .Y(n535) );
  INVX2 U152 ( .A(REGS[17]), .Y(n536) );
  INVX2 U153 ( .A(REGS[16]), .Y(n537) );
  INVX2 U203 ( .A(REGS[15]), .Y(n538) );
  INVX2 U204 ( .A(REGS[14]), .Y(n539) );
  INVX2 U255 ( .A(REGS[13]), .Y(n540) );
  INVX2 U256 ( .A(REGS[12]), .Y(n541) );
  INVX2 U326 ( .A(REGS[11]), .Y(n542) );
  INVX2 U327 ( .A(REGS[10]), .Y(n543) );
  INVX2 U328 ( .A(REGS[9]), .Y(n544) );
  INVX2 U329 ( .A(REGS[8]), .Y(n545) );
  INVX2 U330 ( .A(REGS[7]), .Y(n546) );
  INVX2 U331 ( .A(REGS[6]), .Y(n547) );
  INVX2 U332 ( .A(REGS[5]), .Y(n548) );
  INVX2 U333 ( .A(REGS[4]), .Y(n549) );
  INVX2 U334 ( .A(REGS[3]), .Y(n550) );
  INVX2 U335 ( .A(REGS[2]), .Y(n551) );
  INVX2 U336 ( .A(REGS[1]), .Y(n552) );
  INVX2 U337 ( .A(REGS[0]), .Y(n553) );
  INVX2 U338 ( .A(wa[0]), .Y(n554) );
  INVX2 U339 ( .A(wa[1]), .Y(n555) );
  INVX2 U340 ( .A(wa[2]), .Y(n556) );
  INVX2 U341 ( .A(n251), .Y(n557) );
  INVX2 U342 ( .A(ra1[2]), .Y(n558) );
  INVX2 U343 ( .A(n159), .Y(n559) );
  INVX2 U344 ( .A(ra2[2]), .Y(n560) );
  INVX2 U345 ( .A(reset), .Y(n561) );
endmodule


module mux2_0 ( a, b, sel, y );
  input [7:0] a;
  input [7:0] b;
  output [7:0] y;
  input sel;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n27;

  INVX2 U1 ( .A(n10), .Y(y[7]) );
  INVX2 U2 ( .A(n11), .Y(y[6]) );
  INVX2 U3 ( .A(n12), .Y(y[5]) );
  INVX2 U4 ( .A(n13), .Y(y[4]) );
  INVX2 U5 ( .A(n14), .Y(y[3]) );
  INVX2 U6 ( .A(n15), .Y(y[2]) );
  INVX2 U7 ( .A(n16), .Y(y[1]) );
  INVX2 U8 ( .A(n17), .Y(y[0]) );
  AOI22X1 U10 ( .A(a[7]), .B(n27), .C(sel), .D(b[7]), .Y(n10) );
  AOI22X1 U11 ( .A(a[6]), .B(n27), .C(b[6]), .D(sel), .Y(n11) );
  AOI22X1 U12 ( .A(a[5]), .B(n27), .C(b[5]), .D(sel), .Y(n12) );
  AOI22X1 U13 ( .A(a[4]), .B(n27), .C(b[4]), .D(sel), .Y(n13) );
  AOI22X1 U14 ( .A(a[3]), .B(n27), .C(b[3]), .D(sel), .Y(n14) );
  AOI22X1 U15 ( .A(a[2]), .B(n27), .C(b[2]), .D(sel), .Y(n15) );
  AOI22X1 U16 ( .A(a[1]), .B(n27), .C(b[1]), .D(sel), .Y(n16) );
  AOI22X1 U17 ( .A(a[0]), .B(n27), .C(b[0]), .D(sel), .Y(n17) );
  INVX2 U9 ( .A(sel), .Y(n27) );
endmodule


module mux4 ( a, b, c, d, sel, y );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [7:0] d;
  input [1:0] sel;
  output [7:0] y;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n23;

  AND2X2 U1 ( .A(sel[1]), .B(n23), .Y(n5) );
  AND2X2 U2 ( .A(sel[1]), .B(sel[0]), .Y(n4) );
  NAND2X1 U4 ( .A(n2), .B(n3), .Y(y[7]) );
  AOI22X1 U5 ( .A(d[7]), .B(n4), .C(c[7]), .D(n5), .Y(n3) );
  AOI22X1 U6 ( .A(b[7]), .B(n6), .C(a[7]), .D(n7), .Y(n2) );
  NAND2X1 U7 ( .A(n8), .B(n9), .Y(y[6]) );
  AOI22X1 U8 ( .A(d[6]), .B(n4), .C(c[6]), .D(n5), .Y(n9) );
  AOI22X1 U9 ( .A(b[6]), .B(n6), .C(a[6]), .D(n7), .Y(n8) );
  NAND2X1 U10 ( .A(n10), .B(n11), .Y(y[5]) );
  AOI22X1 U11 ( .A(d[5]), .B(n4), .C(c[5]), .D(n5), .Y(n11) );
  AOI22X1 U12 ( .A(b[5]), .B(n6), .C(a[5]), .D(n7), .Y(n10) );
  NAND2X1 U13 ( .A(n12), .B(n13), .Y(y[4]) );
  AOI22X1 U14 ( .A(d[4]), .B(n4), .C(c[4]), .D(n5), .Y(n13) );
  AOI22X1 U15 ( .A(b[4]), .B(n6), .C(a[4]), .D(n7), .Y(n12) );
  NAND2X1 U16 ( .A(n14), .B(n15), .Y(y[3]) );
  AOI22X1 U17 ( .A(d[3]), .B(n4), .C(c[3]), .D(n5), .Y(n15) );
  AOI22X1 U18 ( .A(b[3]), .B(n6), .C(a[3]), .D(n7), .Y(n14) );
  NAND2X1 U19 ( .A(n16), .B(n17), .Y(y[2]) );
  AOI22X1 U20 ( .A(d[2]), .B(n4), .C(c[2]), .D(n5), .Y(n17) );
  AOI22X1 U21 ( .A(b[2]), .B(n6), .C(a[2]), .D(n7), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n19), .Y(y[1]) );
  AOI22X1 U23 ( .A(d[1]), .B(n4), .C(c[1]), .D(n5), .Y(n19) );
  AOI22X1 U24 ( .A(b[1]), .B(n6), .C(a[1]), .D(n7), .Y(n18) );
  NAND2X1 U25 ( .A(n20), .B(n21), .Y(y[0]) );
  AOI22X1 U26 ( .A(d[0]), .B(n4), .C(c[0]), .D(n5), .Y(n21) );
  AOI22X1 U27 ( .A(b[0]), .B(n6), .C(a[0]), .D(n7), .Y(n20) );
  NOR2X1 U28 ( .A(sel[0]), .B(sel[1]), .Y(n7) );
  NOR2X1 U29 ( .A(n23), .B(sel[1]), .Y(n6) );
  INVX2 U3 ( .A(sel[0]), .Y(n23) );
endmodule


module alu_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;

  wire   [7:1] carry;

  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(carry[1]), .YC(carry[2]), .YS(SUM[1]) );
  FAX1 U1_0 ( .A(A[0]), .B(B[0]), .C(CI), .YC(carry[1]), .YS(SUM[0]) );
endmodule


module alu ( a, b, alucont, aluout, zero );
  input [7:0] a;
  input [7:0] b;
  input [2:0] alucont;
  output [7:0] aluout;
  output zero;
  wire   n15, n16, n17, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72;
  wire   [7:0] b2;
  wire   [7:0] sum;

  AND2X2 U2 ( .A(alucont[0]), .B(alucont[1]), .Y(n28) );
  XOR2X1 U17 ( .A(b[7]), .B(n59), .Y(b2[7]) );
  XOR2X1 U18 ( .A(b[6]), .B(n59), .Y(b2[6]) );
  XOR2X1 U19 ( .A(b[5]), .B(n59), .Y(b2[5]) );
  XOR2X1 U20 ( .A(b[4]), .B(alucont[2]), .Y(b2[4]) );
  XOR2X1 U21 ( .A(b[3]), .B(alucont[2]), .Y(b2[3]) );
  XOR2X1 U22 ( .A(b[2]), .B(alucont[2]), .Y(b2[2]) );
  XOR2X1 U23 ( .A(b[1]), .B(alucont[2]), .Y(b2[1]) );
  XOR2X1 U24 ( .A(b[0]), .B(n59), .Y(b2[0]) );
  NOR2X1 U25 ( .A(n15), .B(n16), .Y(zero) );
  NAND3X1 U26 ( .A(n61), .B(n64), .C(n17), .Y(n16) );
  NOR2X1 U27 ( .A(aluout[3]), .B(aluout[2]), .Y(n17) );
  OAI21X1 U28 ( .A(n60), .B(n70), .C(n19), .Y(aluout[2]) );
  AOI22X1 U29 ( .A(b[2]), .B(n20), .C(sum[2]), .D(n21), .Y(n19) );
  OAI21X1 U30 ( .A(alucont[1]), .B(n70), .C(n60), .Y(n20) );
  OAI21X1 U31 ( .A(n60), .B(n69), .C(n22), .Y(aluout[3]) );
  AOI22X1 U32 ( .A(b[3]), .B(n23), .C(sum[3]), .D(n21), .Y(n22) );
  OAI21X1 U33 ( .A(alucont[1]), .B(n69), .C(n60), .Y(n23) );
  OAI21X1 U34 ( .A(n60), .B(n71), .C(n24), .Y(aluout[1]) );
  AOI22X1 U35 ( .A(b[1]), .B(n25), .C(sum[1]), .D(n21), .Y(n24) );
  OAI21X1 U36 ( .A(alucont[1]), .B(n71), .C(n60), .Y(n25) );
  NAND2X1 U37 ( .A(n26), .B(n27), .Y(aluout[0]) );
  AOI22X1 U38 ( .A(n28), .B(sum[7]), .C(b[0]), .D(n29), .Y(n27) );
  OAI21X1 U39 ( .A(alucont[1]), .B(n72), .C(n60), .Y(n29) );
  AOI22X1 U40 ( .A(sum[0]), .B(n21), .C(a[0]), .D(n56), .Y(n26) );
  NAND3X1 U41 ( .A(n63), .B(n62), .C(n30), .Y(n15) );
  NOR2X1 U42 ( .A(aluout[7]), .B(aluout[6]), .Y(n30) );
  OAI21X1 U43 ( .A(n60), .B(n66), .C(n31), .Y(aluout[6]) );
  AOI22X1 U44 ( .A(b[6]), .B(n32), .C(sum[6]), .D(n21), .Y(n31) );
  OAI21X1 U45 ( .A(alucont[1]), .B(n66), .C(n60), .Y(n32) );
  OAI21X1 U46 ( .A(n65), .B(n60), .C(n33), .Y(aluout[7]) );
  AOI22X1 U47 ( .A(b[7]), .B(n34), .C(sum[7]), .D(n21), .Y(n33) );
  OAI21X1 U48 ( .A(alucont[1]), .B(n65), .C(n60), .Y(n34) );
  OAI21X1 U49 ( .A(n60), .B(n67), .C(n35), .Y(aluout[5]) );
  AOI22X1 U50 ( .A(b[5]), .B(n36), .C(sum[5]), .D(n21), .Y(n35) );
  OAI21X1 U51 ( .A(alucont[1]), .B(n67), .C(n60), .Y(n36) );
  OAI21X1 U52 ( .A(n60), .B(n68), .C(n37), .Y(aluout[4]) );
  AOI22X1 U53 ( .A(b[4]), .B(n38), .C(sum[4]), .D(n21), .Y(n37) );
  NOR2X1 U54 ( .A(n57), .B(alucont[0]), .Y(n21) );
  OAI21X1 U55 ( .A(alucont[1]), .B(n68), .C(n60), .Y(n38) );
  alu_DW01_add_0 add_1_root_add_16_2 ( .A(a), .B(b2), .CI(n59), .SUM(sum) );
  AND2X2 U3 ( .A(alucont[0]), .B(n57), .Y(n56) );
  INVX2 U4 ( .A(n58), .Y(n59) );
  INVX2 U5 ( .A(alucont[2]), .Y(n58) );
  INVX2 U6 ( .A(n56), .Y(n60) );
  INVX2 U7 ( .A(alucont[1]), .Y(n57) );
  INVX2 U8 ( .A(aluout[0]), .Y(n61) );
  INVX2 U9 ( .A(aluout[5]), .Y(n62) );
  INVX2 U10 ( .A(aluout[4]), .Y(n63) );
  INVX2 U11 ( .A(aluout[1]), .Y(n64) );
  INVX2 U12 ( .A(a[7]), .Y(n65) );
  INVX2 U13 ( .A(a[6]), .Y(n66) );
  INVX2 U14 ( .A(a[5]), .Y(n67) );
  INVX2 U15 ( .A(a[4]), .Y(n68) );
  INVX2 U16 ( .A(a[3]), .Y(n69) );
  INVX2 U56 ( .A(a[2]), .Y(n70) );
  INVX2 U57 ( .A(a[1]), .Y(n71) );
  INVX2 U58 ( .A(a[0]), .Y(n72) );
endmodule


module mux3 ( a, b, c, sel, y );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [1:0] sel;
  output [7:0] y;
  wire   N13, N14, N15, N16, N17, N18, N19, N20, N21, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41;

  LATCH y_reg_5_ ( .CLK(N13), .D(N19), .Q(y[5]) );
  LATCH y_reg_4_ ( .CLK(N13), .D(N18), .Q(y[4]) );
  LATCH y_reg_3_ ( .CLK(N13), .D(N17), .Q(y[3]) );
  LATCH y_reg_2_ ( .CLK(N13), .D(N16), .Q(y[2]) );
  LATCH y_reg_1_ ( .CLK(N13), .D(N15), .Q(y[1]) );
  LATCH y_reg_0_ ( .CLK(N13), .D(N14), .Q(y[0]) );
  LATCH y_reg_7_ ( .CLK(N13), .D(N21), .Q(y[7]) );
  OAI21X1 U13 ( .A(n11), .B(n33), .C(n12), .Y(N21) );
  AOI22X1 U14 ( .A(c[7]), .B(n13), .C(b[7]), .D(n14), .Y(n12) );
  OAI21X1 U15 ( .A(n11), .B(n34), .C(n15), .Y(N20) );
  AOI22X1 U16 ( .A(c[6]), .B(n13), .C(b[6]), .D(n14), .Y(n15) );
  OAI21X1 U17 ( .A(n11), .B(n35), .C(n16), .Y(N19) );
  AOI22X1 U18 ( .A(c[5]), .B(n13), .C(b[5]), .D(n14), .Y(n16) );
  OAI21X1 U19 ( .A(n11), .B(n36), .C(n17), .Y(N18) );
  AOI22X1 U20 ( .A(c[4]), .B(n13), .C(b[4]), .D(n14), .Y(n17) );
  OAI21X1 U21 ( .A(n11), .B(n37), .C(n18), .Y(N17) );
  AOI22X1 U22 ( .A(c[3]), .B(n13), .C(b[3]), .D(n14), .Y(n18) );
  OAI21X1 U23 ( .A(n11), .B(n38), .C(n19), .Y(N16) );
  AOI22X1 U24 ( .A(c[2]), .B(n13), .C(b[2]), .D(n14), .Y(n19) );
  OAI21X1 U25 ( .A(n11), .B(n39), .C(n20), .Y(N15) );
  AOI22X1 U26 ( .A(c[1]), .B(n13), .C(b[1]), .D(n14), .Y(n20) );
  OAI21X1 U27 ( .A(n11), .B(n32), .C(n21), .Y(N14) );
  AOI22X1 U28 ( .A(c[0]), .B(n13), .C(b[0]), .D(n14), .Y(n21) );
  NOR2X1 U29 ( .A(n41), .B(sel[1]), .Y(n14) );
  NOR2X1 U30 ( .A(n40), .B(sel[0]), .Y(n13) );
  NAND2X1 U31 ( .A(n40), .B(n41), .Y(n11) );
  NAND2X1 U32 ( .A(sel[0]), .B(sel[1]), .Y(N13) );
  LATCH y_reg_6_ ( .CLK(N13), .D(N20), .Q(y[6]) );
  INVX2 U3 ( .A(a[0]), .Y(n32) );
  INVX2 U4 ( .A(a[7]), .Y(n33) );
  INVX2 U5 ( .A(a[6]), .Y(n34) );
  INVX2 U6 ( .A(a[5]), .Y(n35) );
  INVX2 U7 ( .A(a[4]), .Y(n36) );
  INVX2 U8 ( .A(a[3]), .Y(n37) );
  INVX2 U9 ( .A(a[2]), .Y(n38) );
  INVX2 U10 ( .A(a[1]), .Y(n39) );
  INVX2 U11 ( .A(sel[1]), .Y(n40) );
  INVX2 U12 ( .A(sel[0]), .Y(n41) );
endmodule


module flop_test_0 ( clk, reset, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, reset, test_si, test_se;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n21;

  DFFPOSX1_SCAN q_reg_7_ ( .D(N10), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(N9), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(N8), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(N7), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(N6), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(N5), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(N4), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(N3), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  AND2X2 U3 ( .A(d[6]), .B(n21), .Y(N9) );
  AND2X2 U4 ( .A(d[5]), .B(n21), .Y(N8) );
  AND2X2 U5 ( .A(d[4]), .B(n21), .Y(N7) );
  AND2X2 U6 ( .A(d[3]), .B(n21), .Y(N6) );
  AND2X2 U7 ( .A(d[2]), .B(n21), .Y(N5) );
  AND2X2 U8 ( .A(d[1]), .B(n21), .Y(N4) );
  AND2X2 U9 ( .A(d[0]), .B(n21), .Y(N3) );
  AND2X2 U10 ( .A(d[7]), .B(n21), .Y(N10) );
  INVX2 U27 ( .A(reset), .Y(n21) );
endmodule


module flop_en_test_1 ( clk, reset, en, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, reset, en, test_si, test_se;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56;

  DFFPOSX1_SCAN q_reg_7_ ( .D(n55), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n48), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n49), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n50), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n51), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n52), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n53), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n54), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  AOI22X1 U20 ( .A(q[7]), .B(n11), .C(d[7]), .D(n47), .Y(n10) );
  AOI22X1 U21 ( .A(q[6]), .B(n11), .C(d[6]), .D(n47), .Y(n13) );
  AOI22X1 U30 ( .A(q[5]), .B(n11), .C(d[5]), .D(n47), .Y(n14) );
  AOI22X1 U31 ( .A(q[4]), .B(n11), .C(d[4]), .D(n47), .Y(n15) );
  AOI22X1 U32 ( .A(q[3]), .B(n11), .C(d[3]), .D(n47), .Y(n16) );
  AOI22X1 U33 ( .A(q[2]), .B(n11), .C(d[2]), .D(n47), .Y(n17) );
  AOI22X1 U34 ( .A(q[1]), .B(n11), .C(d[1]), .D(n47), .Y(n18) );
  AOI22X1 U35 ( .A(q[0]), .B(n11), .C(d[0]), .D(n47), .Y(n19) );
  NOR2X1 U36 ( .A(n47), .B(reset), .Y(n11) );
  NOR2X1 U37 ( .A(n56), .B(reset), .Y(n12) );
  BUFX2 U3 ( .A(n12), .Y(n47) );
  INVX2 U12 ( .A(n13), .Y(n48) );
  INVX2 U13 ( .A(n14), .Y(n49) );
  INVX2 U14 ( .A(n15), .Y(n50) );
  INVX2 U15 ( .A(n16), .Y(n51) );
  INVX2 U16 ( .A(n17), .Y(n52) );
  INVX2 U17 ( .A(n18), .Y(n53) );
  INVX2 U18 ( .A(n19), .Y(n54) );
  INVX2 U19 ( .A(n10), .Y(n55) );
  INVX2 U38 ( .A(en), .Y(n56) );
endmodule


module flop_test_1 ( clk, reset, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, reset, test_si, test_se;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n21;

  DFFPOSX1_SCAN q_reg_7_ ( .D(N10), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(N9), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(N8), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(N7), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(N6), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(N5), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(N4), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(N3), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  AND2X2 U3 ( .A(d[6]), .B(n21), .Y(N9) );
  AND2X2 U4 ( .A(d[5]), .B(n21), .Y(N8) );
  AND2X2 U5 ( .A(d[4]), .B(n21), .Y(N7) );
  AND2X2 U6 ( .A(d[3]), .B(n21), .Y(N6) );
  AND2X2 U7 ( .A(d[2]), .B(n21), .Y(N5) );
  AND2X2 U8 ( .A(d[1]), .B(n21), .Y(N4) );
  AND2X2 U9 ( .A(d[0]), .B(n21), .Y(N3) );
  AND2X2 U10 ( .A(d[7]), .B(n21), .Y(N10) );
  INVX2 U27 ( .A(reset), .Y(n21) );
endmodule


module flop_test_2 ( clk, reset, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, reset, test_si, test_se;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n21;

  DFFPOSX1_SCAN q_reg_7_ ( .D(N10), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(N9), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(N8), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(N7), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(N6), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(N5), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(N4), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(N3), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  AND2X2 U3 ( .A(d[6]), .B(n21), .Y(N9) );
  AND2X2 U4 ( .A(d[5]), .B(n21), .Y(N8) );
  AND2X2 U5 ( .A(d[4]), .B(n21), .Y(N7) );
  AND2X2 U6 ( .A(d[3]), .B(n21), .Y(N6) );
  AND2X2 U7 ( .A(d[2]), .B(n21), .Y(N5) );
  AND2X2 U8 ( .A(d[1]), .B(n21), .Y(N4) );
  AND2X2 U9 ( .A(d[0]), .B(n21), .Y(N3) );
  AND2X2 U10 ( .A(d[7]), .B(n21), .Y(N10) );
  INVX2 U27 ( .A(reset), .Y(n21) );
endmodule


module flop_test_3 ( clk, reset, d, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, reset, test_si, test_se;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n21;

  DFFPOSX1_SCAN q_reg_7_ ( .D(N10), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(N9), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(N8), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(N7), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(N6), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(N5), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(N4), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(N3), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  AND2X2 U3 ( .A(d[6]), .B(n21), .Y(N9) );
  AND2X2 U4 ( .A(d[5]), .B(n21), .Y(N8) );
  AND2X2 U5 ( .A(d[4]), .B(n21), .Y(N7) );
  AND2X2 U6 ( .A(d[3]), .B(n21), .Y(N6) );
  AND2X2 U7 ( .A(d[2]), .B(n21), .Y(N5) );
  AND2X2 U8 ( .A(d[1]), .B(n21), .Y(N4) );
  AND2X2 U9 ( .A(d[0]), .B(n21), .Y(N3) );
  AND2X2 U10 ( .A(d[7]), .B(n21), .Y(N10) );
  INVX2 U27 ( .A(reset), .Y(n21) );
endmodule


module datapath_test_design_test_1 ( clk, reset, pcen, iord, irwrite, regdst, 
        memtoreg, regwrite, alusrca, alusrcb, alucont, pcsource, memdata, op, 
        funct, zero, addr, wdata, test_si, test_se );
  input [3:0] irwrite;
  input [1:0] alusrcb;
  input [2:0] alucont;
  input [1:0] pcsource;
  input [7:0] memdata;
  output [5:0] op;
  output [5:0] funct;
  output [7:0] addr;
  output [7:0] wdata;
  input clk, reset, pcen, iord, regdst, memtoreg, regwrite, alusrca, test_si,
         test_se;
  output zero;
  wire   n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170;
  wire   [7:6] imm;
  wire   [25:11] instr;
  wire   [7:0] pcnext;
  wire   [7:0] pc;
  wire   [7:0] aluout;
  wire   [7:0] data;
  wire   [4:0] wa;
  wire   [7:0] wd;
  wire   [7:0] rd1;
  wire   [7:0] rd2;
  wire   [7:0] a;
  wire   [7:0] aluin1;
  wire   [7:0] aluin2;
  wire   [7:0] aluout_flop;

  DFFPOSX1_SCAN instr_reg_31_ ( .D(n70), .TI(op[4]), .TE(test_se), .CLK(n158), 
        .Q(op[5]) );
  DFFPOSX1_SCAN instr_reg_30_ ( .D(n69), .TI(op[3]), .TE(test_se), .CLK(n153), 
        .Q(op[4]) );
  DFFPOSX1_SCAN instr_reg_29_ ( .D(n68), .TI(op[2]), .TE(test_se), .CLK(n153), 
        .Q(op[3]) );
  DFFPOSX1_SCAN instr_reg_28_ ( .D(n67), .TI(op[1]), .TE(test_se), .CLK(n153), 
        .Q(op[2]) );
  DFFPOSX1_SCAN instr_reg_27_ ( .D(n66), .TI(op[0]), .TE(test_se), .CLK(n154), 
        .Q(op[1]) );
  DFFPOSX1_SCAN instr_reg_26_ ( .D(n65), .TI(instr[25]), .TE(test_se), .CLK(
        n154), .Q(op[0]) );
  DFFPOSX1_SCAN instr_reg_25_ ( .D(n64), .TI(instr[24]), .TE(test_se), .CLK(
        n154), .Q(instr[25]) );
  DFFPOSX1_SCAN instr_reg_24_ ( .D(n63), .TI(instr[23]), .TE(test_se), .CLK(
        n155), .Q(instr[24]) );
  DFFPOSX1_SCAN instr_reg_23_ ( .D(n62), .TI(instr[22]), .TE(test_se), .CLK(
        n155), .Q(instr[23]) );
  DFFPOSX1_SCAN instr_reg_22_ ( .D(n61), .TI(instr[21]), .TE(test_se), .CLK(
        n155), .Q(instr[22]) );
  DFFPOSX1_SCAN instr_reg_21_ ( .D(n60), .TI(instr[20]), .TE(test_se), .CLK(
        n156), .Q(instr[21]) );
  DFFPOSX1_SCAN instr_reg_20_ ( .D(n59), .TI(instr[19]), .TE(test_se), .CLK(
        n156), .Q(instr[20]) );
  DFFPOSX1_SCAN instr_reg_19_ ( .D(n58), .TI(instr[18]), .TE(test_se), .CLK(
        n156), .Q(instr[19]) );
  DFFPOSX1_SCAN instr_reg_18_ ( .D(n57), .TI(instr[17]), .TE(test_se), .CLK(
        n157), .Q(instr[18]) );
  DFFPOSX1_SCAN instr_reg_17_ ( .D(n56), .TI(instr[16]), .TE(test_se), .CLK(
        n157), .Q(instr[17]) );
  DFFPOSX1_SCAN instr_reg_16_ ( .D(n55), .TI(instr[15]), .TE(test_se), .CLK(
        n157), .Q(instr[16]) );
  DFFPOSX1_SCAN instr_reg_15_ ( .D(n54), .TI(instr[14]), .TE(test_se), .CLK(
        n157), .Q(instr[15]) );
  DFFPOSX1_SCAN instr_reg_14_ ( .D(n53), .TI(instr[13]), .TE(test_se), .CLK(
        n157), .Q(instr[14]) );
  DFFPOSX1_SCAN instr_reg_13_ ( .D(n52), .TI(instr[12]), .TE(test_se), .CLK(
        n157), .Q(instr[13]) );
  DFFPOSX1_SCAN instr_reg_12_ ( .D(n51), .TI(instr[11]), .TE(test_se), .CLK(
        n157), .Q(instr[12]) );
  DFFPOSX1_SCAN instr_reg_11_ ( .D(n50), .TI(imm[7]), .TE(test_se), .CLK(n157), 
        .Q(instr[11]) );
  DFFPOSX1_SCAN instr_reg_7_ ( .D(n49), .TI(imm[6]), .TE(test_se), .CLK(n157), 
        .Q(imm[7]) );
  DFFPOSX1_SCAN instr_reg_6_ ( .D(n48), .TI(funct[5]), .TE(test_se), .CLK(n157), .Q(imm[6]) );
  DFFPOSX1_SCAN instr_reg_5_ ( .D(n47), .TI(funct[4]), .TE(test_se), .CLK(n152), .Q(funct[5]) );
  DFFPOSX1_SCAN instr_reg_4_ ( .D(n46), .TI(funct[3]), .TE(test_se), .CLK(n158), .Q(funct[4]) );
  DFFPOSX1_SCAN instr_reg_3_ ( .D(n45), .TI(funct[2]), .TE(test_se), .CLK(n158), .Q(funct[3]) );
  DFFPOSX1_SCAN instr_reg_2_ ( .D(n44), .TI(funct[1]), .TE(test_se), .CLK(n158), .Q(funct[2]) );
  DFFPOSX1_SCAN instr_reg_1_ ( .D(n43), .TI(funct[0]), .TE(test_se), .CLK(n158), .Q(funct[1]) );
  DFFPOSX1_SCAN instr_reg_0_ ( .D(n42), .TI(aluout_flop[7]), .TE(test_se), 
        .CLK(n157), .Q(funct[0]) );
  OAI21X1 U16 ( .A(n162), .B(n163), .C(n13), .Y(n70) );
  NAND2X1 U17 ( .A(op[5]), .B(n162), .Y(n13) );
  OAI21X1 U18 ( .A(n162), .B(n164), .C(n14), .Y(n69) );
  NAND2X1 U19 ( .A(op[4]), .B(n162), .Y(n14) );
  OAI21X1 U20 ( .A(n162), .B(n165), .C(n15), .Y(n68) );
  NAND2X1 U21 ( .A(op[3]), .B(n162), .Y(n15) );
  OAI21X1 U22 ( .A(n162), .B(n166), .C(n16), .Y(n67) );
  NAND2X1 U23 ( .A(op[2]), .B(n162), .Y(n16) );
  OAI21X1 U24 ( .A(n162), .B(n167), .C(n17), .Y(n66) );
  NAND2X1 U25 ( .A(op[1]), .B(n162), .Y(n17) );
  OAI21X1 U26 ( .A(n162), .B(n168), .C(n18), .Y(n65) );
  NAND2X1 U27 ( .A(op[0]), .B(n162), .Y(n18) );
  OAI21X1 U28 ( .A(n162), .B(n169), .C(n19), .Y(n64) );
  NAND2X1 U29 ( .A(instr[25]), .B(n162), .Y(n19) );
  OAI21X1 U30 ( .A(n162), .B(n170), .C(n20), .Y(n63) );
  NAND2X1 U31 ( .A(instr[24]), .B(n162), .Y(n20) );
  OAI21X1 U32 ( .A(n163), .B(n159), .C(n21), .Y(n62) );
  NAND2X1 U33 ( .A(instr[23]), .B(n159), .Y(n21) );
  OAI21X1 U34 ( .A(n164), .B(n159), .C(n22), .Y(n61) );
  NAND2X1 U35 ( .A(instr[22]), .B(n159), .Y(n22) );
  OAI21X1 U36 ( .A(n165), .B(n159), .C(n23), .Y(n60) );
  NAND2X1 U37 ( .A(instr[21]), .B(n159), .Y(n23) );
  OAI21X1 U38 ( .A(n166), .B(n159), .C(n24), .Y(n59) );
  NAND2X1 U39 ( .A(instr[20]), .B(n159), .Y(n24) );
  OAI21X1 U40 ( .A(n167), .B(n159), .C(n25), .Y(n58) );
  NAND2X1 U41 ( .A(instr[19]), .B(n159), .Y(n25) );
  OAI21X1 U42 ( .A(n168), .B(n159), .C(n26), .Y(n57) );
  NAND2X1 U43 ( .A(instr[18]), .B(n159), .Y(n26) );
  OAI21X1 U44 ( .A(n169), .B(n159), .C(n27), .Y(n56) );
  NAND2X1 U45 ( .A(instr[17]), .B(n159), .Y(n27) );
  OAI21X1 U46 ( .A(n170), .B(n159), .C(n28), .Y(n55) );
  NAND2X1 U47 ( .A(instr[16]), .B(n159), .Y(n28) );
  OAI21X1 U48 ( .A(n163), .B(n161), .C(n29), .Y(n54) );
  NAND2X1 U49 ( .A(instr[15]), .B(n161), .Y(n29) );
  OAI21X1 U50 ( .A(n164), .B(n161), .C(n30), .Y(n53) );
  NAND2X1 U51 ( .A(instr[14]), .B(n161), .Y(n30) );
  OAI21X1 U52 ( .A(n165), .B(n161), .C(n31), .Y(n52) );
  NAND2X1 U53 ( .A(instr[13]), .B(n161), .Y(n31) );
  OAI21X1 U54 ( .A(n166), .B(n161), .C(n32), .Y(n51) );
  NAND2X1 U55 ( .A(instr[12]), .B(n161), .Y(n32) );
  OAI21X1 U56 ( .A(n167), .B(n161), .C(n33), .Y(n50) );
  NAND2X1 U57 ( .A(instr[11]), .B(n161), .Y(n33) );
  OAI21X1 U58 ( .A(n163), .B(n160), .C(n34), .Y(n49) );
  NAND2X1 U59 ( .A(imm[7]), .B(n160), .Y(n34) );
  OAI21X1 U60 ( .A(n164), .B(n160), .C(n35), .Y(n48) );
  NAND2X1 U61 ( .A(imm[6]), .B(n160), .Y(n35) );
  OAI21X1 U62 ( .A(n165), .B(n160), .C(n36), .Y(n47) );
  NAND2X1 U63 ( .A(funct[5]), .B(n160), .Y(n36) );
  OAI21X1 U64 ( .A(n166), .B(n160), .C(n37), .Y(n46) );
  NAND2X1 U65 ( .A(funct[4]), .B(n160), .Y(n37) );
  OAI21X1 U66 ( .A(n167), .B(n160), .C(n38), .Y(n45) );
  NAND2X1 U67 ( .A(funct[3]), .B(n160), .Y(n38) );
  OAI21X1 U68 ( .A(n168), .B(n160), .C(n39), .Y(n44) );
  NAND2X1 U69 ( .A(funct[2]), .B(n160), .Y(n39) );
  OAI21X1 U70 ( .A(n169), .B(n160), .C(n40), .Y(n43) );
  NAND2X1 U71 ( .A(funct[1]), .B(n160), .Y(n40) );
  OAI21X1 U72 ( .A(n170), .B(n160), .C(n41), .Y(n42) );
  NAND2X1 U130 ( .A(funct[0]), .B(n160), .Y(n41) );
  flop_en_test_1 pc_flop ( .clk(n156), .reset(reset), .en(pcen), .d(pcnext), 
        .q(pc), .test_si(data[7]), .test_se(test_se) );
  mux2_2 mux2_pc ( .a(pc), .b(aluout), .sel(iord), .y(addr) );
  flop_test_0 memdata_flop ( .clk(n155), .reset(reset), .d(memdata), .q(data), 
        .test_si(op[5]), .test_se(test_se) );
  mux2_DATA_WIDTH5 mux2_a3 ( .a(instr[20:16]), .b(instr[15:11]), .sel(regdst), 
        .y(wa) );
  mux2_1 mux2_w3 ( .a(aluout), .b(data), .sel(memtoreg), .y(wd) );
  register_file regfile ( .clk(n152), .reset(reset), .regwrite(regwrite), 
        .ra1(instr[25:21]), .ra2(instr[20:16]), .wa(wa), .wd(wd), .rd1(rd1), 
        .rd2(rd2) );
  flop_test_1 rdata1_flop ( .clk(n154), .reset(reset), .d(rd1), .q(a), 
        .test_si(pc[7]), .test_se(test_se) );
  flop_test_2 rdata2_flop ( .clk(n153), .reset(reset), .d(rd2), .q(wdata), 
        .test_si(a[7]), .test_se(test_se) );
  mux2_0 mux2_a ( .a(pc), .b(a), .sel(alusrca), .y(aluin1) );
  mux4 mux4_b ( .a(wdata), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .c({imm, funct}), .d({funct, 1'b0, 1'b0}), .sel(alusrcb), .y(aluin2) );
  alu alu ( .a(aluin1), .b(aluin2), .alucont(alucont), .aluout(aluout), .zero(
        zero) );
  flop_test_3 aluout_ff ( .clk(n152), .reset(reset), .d(aluout), .q(
        aluout_flop), .test_si(test_si), .test_se(test_se) );
  mux3 mux3_pc ( .a(aluout), .b(aluout_flop), .c({funct, 1'b0, 1'b0}), .sel(
        pcsource), .y(pcnext) );
  INVX2 U3 ( .A(irwrite[1]), .Y(n161) );
  INVX2 U4 ( .A(irwrite[2]), .Y(n159) );
  INVX2 U5 ( .A(irwrite[0]), .Y(n160) );
  INVX2 U6 ( .A(irwrite[3]), .Y(n162) );
  BUFX2 U7 ( .A(clk), .Y(n152) );
  BUFX2 U8 ( .A(clk), .Y(n153) );
  BUFX2 U9 ( .A(clk), .Y(n154) );
  BUFX2 U10 ( .A(clk), .Y(n155) );
  BUFX2 U11 ( .A(clk), .Y(n156) );
  BUFX2 U12 ( .A(clk), .Y(n157) );
  BUFX2 U13 ( .A(clk), .Y(n158) );
  INVX2 U15 ( .A(memdata[7]), .Y(n163) );
  INVX2 U131 ( .A(memdata[6]), .Y(n164) );
  INVX2 U132 ( .A(memdata[5]), .Y(n165) );
  INVX2 U133 ( .A(memdata[4]), .Y(n166) );
  INVX2 U134 ( .A(memdata[3]), .Y(n167) );
  INVX2 U135 ( .A(memdata[2]), .Y(n168) );
  INVX2 U136 ( .A(memdata[1]), .Y(n169) );
  INVX2 U137 ( .A(memdata[0]), .Y(n170) );
endmodule


module mini_mips_test_design ( clk, reset, memdata, memwrite, adr, writedata, 
        test_si, test_so, test_se );
  input [7:0] memdata;
  output [7:0] adr;
  output [7:0] writedata;
  input clk, reset, test_si, test_se;
  output memwrite, test_so;
  wire   iord, regdst, memtoreg, regwrite, alusrca, zero, branch, pcwrite, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n69;
  wire   [3:0] irwrite;
  wire   [1:0] alusrcb;
  wire   [2:0] alucont;
  wire   [1:0] pcsource;
  wire   [5:0] op;
  wire   [5:0] funct;

  INVX2 U5 ( .A(n46), .Y(n45) );
  AOI21X1 U6 ( .A(zero), .B(branch), .C(pcwrite), .Y(n46) );
  datapath_test_design_test_1 dp ( .clk(n65), .reset(n64), .pcen(n45), .iord(
        iord), .irwrite(irwrite), .regdst(regdst), .memtoreg(memtoreg), 
        .regwrite(regwrite), .alusrca(alusrca), .alusrcb(alusrcb), .alucont(
        alucont), .pcsource(pcsource), .memdata({n62, n60, n58, n56, n54, n52, 
        n50, n48}), .op(op), .funct(funct), .zero(zero), .addr(adr), .wdata(
        writedata), .test_si(test_si), .test_se(test_se) );
  controller cont ( .clk(n65), .reset(n64), .op(op), .funct(funct), .alusrca(
        alusrca), .alusrcb(alusrcb), .branch(branch), .iord(iord), .irwrite(
        irwrite), .memwrite(memwrite), .memtoreg(memtoreg), .pcwrite(pcwrite), 
        .pcsource(pcsource), .regwrite(regwrite), .regdst(regdst), .alucont(
        alucont) );
  INVX2 U7 ( .A(memdata[0]), .Y(n47) );
  INVX2 U8 ( .A(n47), .Y(n48) );
  INVX2 U9 ( .A(memdata[1]), .Y(n49) );
  INVX2 U10 ( .A(n49), .Y(n50) );
  INVX2 U11 ( .A(memdata[2]), .Y(n51) );
  INVX2 U12 ( .A(n51), .Y(n52) );
  INVX2 U13 ( .A(memdata[3]), .Y(n53) );
  INVX2 U14 ( .A(n53), .Y(n54) );
  INVX2 U15 ( .A(memdata[4]), .Y(n55) );
  INVX2 U16 ( .A(n55), .Y(n56) );
  INVX2 U17 ( .A(memdata[5]), .Y(n57) );
  INVX2 U18 ( .A(n57), .Y(n58) );
  INVX2 U19 ( .A(memdata[6]), .Y(n59) );
  INVX2 U20 ( .A(n59), .Y(n60) );
  INVX2 U21 ( .A(memdata[7]), .Y(n61) );
  INVX2 U22 ( .A(n61), .Y(n62) );
  INVX2 U23 ( .A(reset), .Y(n63) );
  INVX2 U24 ( .A(n63), .Y(n64) );
  INVX2 U25 ( .A(n66), .Y(n65) );
  INVX2 U26 ( .A(clk), .Y(n66) );
  INVX8 U27 ( .A(writedata[7]), .Y(n69) );
  INVX8 U28 ( .A(n69), .Y(test_so) );
endmodule

