/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Apr 16 20:59:48 2025
/////////////////////////////////////////////////////////////


module flop_en ( clk, reset, en, d, q );
  input [7:0] d;
  output [7:0] q;
  input clk, reset, en;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n20;

  DFFPOSX1 \q_reg[7]  ( .D(n2), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 \q_reg[6]  ( .D(n3), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 \q_reg[5]  ( .D(n4), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 \q_reg[4]  ( .D(n5), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 \q_reg[3]  ( .D(n6), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 \q_reg[2]  ( .D(n7), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 \q_reg[1]  ( .D(n8), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 \q_reg[0]  ( .D(n9), .CLK(clk), .Q(q[0]) );
  AOI22X1 U12 ( .A(d[0]), .B(n1), .C(q[0]), .D(n12), .Y(n10) );
  AOI22X1 U13 ( .A(d[1]), .B(n1), .C(q[1]), .D(n12), .Y(n13) );
  AOI22X1 U14 ( .A(d[2]), .B(n1), .C(q[2]), .D(n12), .Y(n14) );
  AOI22X1 U15 ( .A(d[3]), .B(n1), .C(q[3]), .D(n12), .Y(n15) );
  AOI22X1 U16 ( .A(d[4]), .B(n1), .C(q[4]), .D(n12), .Y(n16) );
  AOI22X1 U17 ( .A(d[5]), .B(n1), .C(q[5]), .D(n12), .Y(n17) );
  AOI22X1 U18 ( .A(d[6]), .B(n1), .C(q[6]), .D(n12), .Y(n18) );
  AOI22X1 U19 ( .A(d[7]), .B(n1), .C(q[7]), .D(n12), .Y(n19) );
  NOR2X1 U20 ( .A(reset), .B(n1), .Y(n12) );
  NOR2X1 U21 ( .A(n20), .B(reset), .Y(n11) );
  BUFX2 U3 ( .A(n11), .Y(n1) );
  INVX2 U4 ( .A(n19), .Y(n2) );
  INVX2 U5 ( .A(n18), .Y(n3) );
  INVX2 U6 ( .A(n17), .Y(n4) );
  INVX2 U7 ( .A(n16), .Y(n5) );
  INVX2 U8 ( .A(n15), .Y(n6) );
  INVX2 U9 ( .A(n14), .Y(n7) );
  INVX2 U10 ( .A(n13), .Y(n8) );
  INVX2 U11 ( .A(n10), .Y(n9) );
  INVX2 U22 ( .A(en), .Y(n20) );
endmodule


module mux2_2 ( a, b, sel, y );
  input [7:0] a;
  input [7:0] b;
  output [7:0] y;
  input sel;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n1;

  INVX2 U1 ( .A(n10), .Y(y[7]) );
  INVX2 U2 ( .A(n11), .Y(y[6]) );
  INVX2 U3 ( .A(n12), .Y(y[5]) );
  INVX2 U4 ( .A(n13), .Y(y[4]) );
  INVX2 U5 ( .A(n14), .Y(y[3]) );
  INVX2 U6 ( .A(n15), .Y(y[2]) );
  INVX2 U7 ( .A(n16), .Y(y[1]) );
  INVX2 U8 ( .A(n17), .Y(y[0]) );
  AOI22X1 U10 ( .A(a[7]), .B(n1), .C(sel), .D(b[7]), .Y(n10) );
  AOI22X1 U11 ( .A(a[6]), .B(n1), .C(b[6]), .D(sel), .Y(n11) );
  AOI22X1 U12 ( .A(a[5]), .B(n1), .C(b[5]), .D(sel), .Y(n12) );
  AOI22X1 U13 ( .A(a[4]), .B(n1), .C(b[4]), .D(sel), .Y(n13) );
  AOI22X1 U14 ( .A(a[3]), .B(n1), .C(b[3]), .D(sel), .Y(n14) );
  AOI22X1 U15 ( .A(a[2]), .B(n1), .C(b[2]), .D(sel), .Y(n15) );
  AOI22X1 U16 ( .A(a[1]), .B(n1), .C(b[1]), .D(sel), .Y(n16) );
  AOI22X1 U17 ( .A(a[0]), .B(n1), .C(b[0]), .D(sel), .Y(n17) );
  INVX2 U9 ( .A(sel), .Y(n1) );
endmodule


module flop_3 ( clk, reset, d, q );
  input [7:0] d;
  output [7:0] q;
  input clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n1, n2, n3;

  DFFPOSX1 \q_reg[7]  ( .D(N10), .CLK(n1), .Q(q[7]) );
  DFFPOSX1 \q_reg[6]  ( .D(N9), .CLK(n1), .Q(q[6]) );
  DFFPOSX1 \q_reg[5]  ( .D(N8), .CLK(n1), .Q(q[5]) );
  DFFPOSX1 \q_reg[4]  ( .D(N7), .CLK(n1), .Q(q[4]) );
  DFFPOSX1 \q_reg[3]  ( .D(N6), .CLK(n1), .Q(q[3]) );
  DFFPOSX1 \q_reg[2]  ( .D(N5), .CLK(n1), .Q(q[2]) );
  DFFPOSX1 \q_reg[1]  ( .D(N4), .CLK(n1), .Q(q[1]) );
  DFFPOSX1 \q_reg[0]  ( .D(N3), .CLK(n1), .Q(q[0]) );
  AND2X2 U3 ( .A(d[6]), .B(n3), .Y(N9) );
  AND2X2 U4 ( .A(d[5]), .B(n3), .Y(N8) );
  AND2X2 U5 ( .A(d[4]), .B(n3), .Y(N7) );
  AND2X2 U6 ( .A(d[3]), .B(n3), .Y(N6) );
  AND2X2 U7 ( .A(d[2]), .B(n3), .Y(N5) );
  AND2X2 U8 ( .A(d[1]), .B(n3), .Y(N4) );
  AND2X2 U9 ( .A(d[0]), .B(n3), .Y(N3) );
  AND2X2 U10 ( .A(d[7]), .B(n3), .Y(N10) );
  INVX2 U11 ( .A(n2), .Y(n1) );
  INVX2 U12 ( .A(clk), .Y(n2) );
  INVX2 U13 ( .A(reset), .Y(n3) );
endmodule


module mux2_DATA_WIDTH5 ( a, b, sel, y );
  input [4:0] a;
  input [4:0] b;
  output [4:0] y;
  input sel;
  wire   n7, n8, n9, n10, n11, n1;

  INVX2 U1 ( .A(n7), .Y(y[4]) );
  INVX2 U2 ( .A(n8), .Y(y[3]) );
  INVX2 U3 ( .A(n9), .Y(y[2]) );
  INVX2 U4 ( .A(n10), .Y(y[1]) );
  INVX2 U5 ( .A(n11), .Y(y[0]) );
  AOI22X1 U7 ( .A(a[4]), .B(n1), .C(sel), .D(b[4]), .Y(n7) );
  AOI22X1 U8 ( .A(a[3]), .B(n1), .C(b[3]), .D(sel), .Y(n8) );
  AOI22X1 U9 ( .A(a[2]), .B(n1), .C(b[2]), .D(sel), .Y(n9) );
  AOI22X1 U10 ( .A(a[1]), .B(n1), .C(b[1]), .D(sel), .Y(n10) );
  AOI22X1 U11 ( .A(a[0]), .B(n1), .C(b[0]), .D(sel), .Y(n11) );
  INVX2 U6 ( .A(sel), .Y(n1) );
endmodule


module mux2_1 ( a, b, sel, y );
  input [7:0] a;
  input [7:0] b;
  output [7:0] y;
  input sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;

  INVX2 U1 ( .A(n9), .Y(y[7]) );
  INVX2 U2 ( .A(n8), .Y(y[6]) );
  INVX2 U3 ( .A(n7), .Y(y[5]) );
  INVX2 U4 ( .A(n6), .Y(y[4]) );
  INVX2 U5 ( .A(n5), .Y(y[3]) );
  INVX2 U6 ( .A(n4), .Y(y[2]) );
  INVX2 U7 ( .A(n3), .Y(y[1]) );
  INVX2 U8 ( .A(n2), .Y(y[0]) );
  AOI22X1 U10 ( .A(a[7]), .B(n1), .C(sel), .D(b[7]), .Y(n9) );
  AOI22X1 U11 ( .A(a[6]), .B(n1), .C(b[6]), .D(sel), .Y(n8) );
  AOI22X1 U12 ( .A(a[5]), .B(n1), .C(b[5]), .D(sel), .Y(n7) );
  AOI22X1 U13 ( .A(a[4]), .B(n1), .C(b[4]), .D(sel), .Y(n6) );
  AOI22X1 U14 ( .A(a[3]), .B(n1), .C(b[3]), .D(sel), .Y(n5) );
  AOI22X1 U15 ( .A(a[2]), .B(n1), .C(b[2]), .D(sel), .Y(n4) );
  AOI22X1 U16 ( .A(a[1]), .B(n1), .C(b[1]), .D(sel), .Y(n3) );
  AOI22X1 U17 ( .A(a[0]), .B(n1), .C(b[0]), .D(sel), .Y(n2) );
  INVX2 U9 ( .A(sel), .Y(n1) );
endmodule


module register_file ( clk, reset, regwrite, ra1, ra2, wa, wd, rd1, rd2 );
  input [4:0] ra1;
  input [4:0] ra2;
  input [4:0] wa;
  input [7:0] wd;
  output [7:0] rd1;
  output [7:0] rd2;
  input clk, reset, regwrite;
  wire   N13, N14, N15, N16, N17, N18, \REGS[7][7] , \REGS[7][6] ,
         \REGS[7][5] , \REGS[7][4] , \REGS[7][3] , \REGS[7][2] , \REGS[7][1] ,
         \REGS[7][0] , \REGS[6][7] , \REGS[6][6] , \REGS[6][5] , \REGS[6][4] ,
         \REGS[6][3] , \REGS[6][2] , \REGS[6][1] , \REGS[6][0] , \REGS[5][7] ,
         \REGS[5][6] , \REGS[5][5] , \REGS[5][4] , \REGS[5][3] , \REGS[5][2] ,
         \REGS[5][1] , \REGS[5][0] , \REGS[4][7] , \REGS[4][6] , \REGS[4][5] ,
         \REGS[4][4] , \REGS[4][3] , \REGS[4][2] , \REGS[4][1] , \REGS[4][0] ,
         \REGS[3][7] , \REGS[3][6] , \REGS[3][5] , \REGS[3][4] , \REGS[3][3] ,
         \REGS[3][2] , \REGS[3][1] , \REGS[3][0] , \REGS[2][7] , \REGS[2][6] ,
         \REGS[2][5] , \REGS[2][4] , \REGS[2][3] , \REGS[2][2] , \REGS[2][1] ,
         \REGS[2][0] , \REGS[1][7] , \REGS[1][6] , \REGS[1][5] , \REGS[1][4] ,
         \REGS[1][3] , \REGS[1][2] , \REGS[1][1] , \REGS[1][0] , N19, N20, N21,
         N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n72, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355;
  wire   [7:0] rd1_next;
  wire   [7:0] rd2_next;
  assign N13 = ra1[0];
  assign N14 = ra1[1];
  assign N15 = ra1[2];
  assign N16 = ra2[0];
  assign N17 = ra2[1];
  assign N18 = ra2[2];

  DFFSR \rd1_reg[7]  ( .D(rd1_next[7]), .CLK(n340), .R(n334), .S(1'b1), .Q(
        rd1[7]) );
  DFFSR \rd1_reg[6]  ( .D(rd1_next[6]), .CLK(n340), .R(n334), .S(1'b1), .Q(
        rd1[6]) );
  DFFSR \rd1_reg[5]  ( .D(rd1_next[5]), .CLK(n340), .R(n334), .S(1'b1), .Q(
        rd1[5]) );
  DFFSR \rd1_reg[4]  ( .D(rd1_next[4]), .CLK(n340), .R(n334), .S(1'b1), .Q(
        rd1[4]) );
  DFFSR \rd1_reg[3]  ( .D(rd1_next[3]), .CLK(n340), .R(n334), .S(1'b1), .Q(
        rd1[3]) );
  DFFSR \rd1_reg[2]  ( .D(rd1_next[2]), .CLK(n340), .R(n334), .S(1'b1), .Q(
        rd1[2]) );
  DFFSR \rd1_reg[1]  ( .D(rd1_next[1]), .CLK(n340), .R(n334), .S(1'b1), .Q(
        rd1[1]) );
  DFFSR \rd1_reg[0]  ( .D(rd1_next[0]), .CLK(n339), .R(n334), .S(1'b1), .Q(
        rd1[0]) );
  DFFSR \rd2_reg[7]  ( .D(rd2_next[7]), .CLK(n339), .R(n334), .S(1'b1), .Q(
        rd2[7]) );
  DFFSR \rd2_reg[6]  ( .D(rd2_next[6]), .CLK(n339), .R(n334), .S(1'b1), .Q(
        rd2[6]) );
  DFFSR \rd2_reg[5]  ( .D(rd2_next[5]), .CLK(n339), .R(n334), .S(1'b1), .Q(
        rd2[5]) );
  DFFSR \rd2_reg[4]  ( .D(rd2_next[4]), .CLK(n339), .R(n334), .S(1'b1), .Q(
        rd2[4]) );
  DFFSR \rd2_reg[3]  ( .D(rd2_next[3]), .CLK(n339), .R(n333), .S(1'b1), .Q(
        rd2[3]) );
  DFFSR \rd2_reg[2]  ( .D(rd2_next[2]), .CLK(n339), .R(n333), .S(1'b1), .Q(
        rd2[2]) );
  DFFSR \rd2_reg[1]  ( .D(rd2_next[1]), .CLK(n339), .R(n333), .S(1'b1), .Q(
        rd2[1]) );
  DFFSR \rd2_reg[0]  ( .D(rd2_next[0]), .CLK(n339), .R(n333), .S(1'b1), .Q(
        rd2[0]) );
  DFFSR \REGS_reg[7][7]  ( .D(n219), .CLK(n339), .R(n333), .S(1'b1), .Q(
        \REGS[7][7] ) );
  DFFSR \REGS_reg[7][6]  ( .D(n218), .CLK(n339), .R(n333), .S(1'b1), .Q(
        \REGS[7][6] ) );
  DFFSR \REGS_reg[7][5]  ( .D(n217), .CLK(n339), .R(n333), .S(1'b1), .Q(
        \REGS[7][5] ) );
  DFFSR \REGS_reg[7][4]  ( .D(n216), .CLK(n339), .R(n333), .S(1'b1), .Q(
        \REGS[7][4] ) );
  DFFSR \REGS_reg[7][3]  ( .D(n215), .CLK(n338), .R(n333), .S(1'b1), .Q(
        \REGS[7][3] ) );
  DFFSR \REGS_reg[7][2]  ( .D(n214), .CLK(n338), .R(n333), .S(1'b1), .Q(
        \REGS[7][2] ) );
  DFFSR \REGS_reg[7][1]  ( .D(n213), .CLK(n338), .R(n333), .S(1'b1), .Q(
        \REGS[7][1] ) );
  DFFSR \REGS_reg[7][0]  ( .D(n212), .CLK(n338), .R(n333), .S(1'b1), .Q(
        \REGS[7][0] ) );
  DFFSR \REGS_reg[6][7]  ( .D(n211), .CLK(n338), .R(n332), .S(1'b1), .Q(
        \REGS[6][7] ) );
  DFFSR \REGS_reg[6][6]  ( .D(n210), .CLK(n338), .R(n332), .S(1'b1), .Q(
        \REGS[6][6] ) );
  DFFSR \REGS_reg[6][5]  ( .D(n209), .CLK(n338), .R(n332), .S(1'b1), .Q(
        \REGS[6][5] ) );
  DFFSR \REGS_reg[6][4]  ( .D(n208), .CLK(n338), .R(n332), .S(1'b1), .Q(
        \REGS[6][4] ) );
  DFFSR \REGS_reg[6][3]  ( .D(n207), .CLK(n338), .R(n332), .S(1'b1), .Q(
        \REGS[6][3] ) );
  DFFSR \REGS_reg[6][2]  ( .D(n206), .CLK(n338), .R(n332), .S(1'b1), .Q(
        \REGS[6][2] ) );
  DFFSR \REGS_reg[6][1]  ( .D(n205), .CLK(n338), .R(n332), .S(1'b1), .Q(
        \REGS[6][1] ) );
  DFFSR \REGS_reg[6][0]  ( .D(n204), .CLK(n338), .R(n332), .S(1'b1), .Q(
        \REGS[6][0] ) );
  DFFSR \REGS_reg[5][7]  ( .D(n203), .CLK(n338), .R(n332), .S(1'b1), .Q(
        \REGS[5][7] ) );
  DFFSR \REGS_reg[5][6]  ( .D(n202), .CLK(n337), .R(n332), .S(1'b1), .Q(
        \REGS[5][6] ) );
  DFFSR \REGS_reg[5][5]  ( .D(n201), .CLK(n337), .R(n332), .S(1'b1), .Q(
        \REGS[5][5] ) );
  DFFSR \REGS_reg[5][4]  ( .D(n200), .CLK(n337), .R(n332), .S(1'b1), .Q(
        \REGS[5][4] ) );
  DFFSR \REGS_reg[5][3]  ( .D(n199), .CLK(n337), .R(n331), .S(1'b1), .Q(
        \REGS[5][3] ) );
  DFFSR \REGS_reg[5][2]  ( .D(n198), .CLK(n337), .R(n331), .S(1'b1), .Q(
        \REGS[5][2] ) );
  DFFSR \REGS_reg[5][1]  ( .D(n197), .CLK(n337), .R(n331), .S(1'b1), .Q(
        \REGS[5][1] ) );
  DFFSR \REGS_reg[5][0]  ( .D(n196), .CLK(n337), .R(n331), .S(1'b1), .Q(
        \REGS[5][0] ) );
  DFFSR \REGS_reg[4][7]  ( .D(n195), .CLK(n337), .R(n331), .S(1'b1), .Q(
        \REGS[4][7] ) );
  DFFSR \REGS_reg[4][6]  ( .D(n194), .CLK(n337), .R(n331), .S(1'b1), .Q(
        \REGS[4][6] ) );
  DFFSR \REGS_reg[4][5]  ( .D(n193), .CLK(n337), .R(n331), .S(1'b1), .Q(
        \REGS[4][5] ) );
  DFFSR \REGS_reg[4][4]  ( .D(n192), .CLK(n337), .R(n331), .S(1'b1), .Q(
        \REGS[4][4] ) );
  DFFSR \REGS_reg[4][3]  ( .D(n191), .CLK(n337), .R(n331), .S(1'b1), .Q(
        \REGS[4][3] ) );
  DFFSR \REGS_reg[4][2]  ( .D(n190), .CLK(n337), .R(n331), .S(1'b1), .Q(
        \REGS[4][2] ) );
  DFFSR \REGS_reg[4][1]  ( .D(n189), .CLK(n336), .R(n331), .S(1'b1), .Q(
        \REGS[4][1] ) );
  DFFSR \REGS_reg[4][0]  ( .D(n188), .CLK(n336), .R(n331), .S(1'b1), .Q(
        \REGS[4][0] ) );
  DFFSR \REGS_reg[3][7]  ( .D(n187), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[3][7] ) );
  DFFSR \REGS_reg[3][6]  ( .D(n186), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[3][6] ) );
  DFFSR \REGS_reg[3][5]  ( .D(n185), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[3][5] ) );
  DFFSR \REGS_reg[3][4]  ( .D(n184), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[3][4] ) );
  DFFSR \REGS_reg[3][3]  ( .D(n183), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[3][3] ) );
  DFFSR \REGS_reg[3][2]  ( .D(n182), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[3][2] ) );
  DFFSR \REGS_reg[3][1]  ( .D(n181), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[3][1] ) );
  DFFSR \REGS_reg[3][0]  ( .D(n180), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[3][0] ) );
  DFFSR \REGS_reg[2][7]  ( .D(n179), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[2][7] ) );
  DFFSR \REGS_reg[2][6]  ( .D(n178), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[2][6] ) );
  DFFSR \REGS_reg[2][5]  ( .D(n177), .CLK(n336), .R(n330), .S(1'b1), .Q(
        \REGS[2][5] ) );
  DFFSR \REGS_reg[2][4]  ( .D(n176), .CLK(n335), .R(n330), .S(1'b1), .Q(
        \REGS[2][4] ) );
  DFFSR \REGS_reg[2][3]  ( .D(n175), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[2][3] ) );
  DFFSR \REGS_reg[2][2]  ( .D(n174), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[2][2] ) );
  DFFSR \REGS_reg[2][1]  ( .D(n173), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[2][1] ) );
  DFFSR \REGS_reg[2][0]  ( .D(n172), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[2][0] ) );
  DFFSR \REGS_reg[1][7]  ( .D(n171), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[1][7] ) );
  DFFSR \REGS_reg[1][6]  ( .D(n170), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[1][6] ) );
  DFFSR \REGS_reg[1][5]  ( .D(n169), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[1][5] ) );
  DFFSR \REGS_reg[1][4]  ( .D(n168), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[1][4] ) );
  DFFSR \REGS_reg[1][3]  ( .D(n167), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[1][3] ) );
  DFFSR \REGS_reg[1][2]  ( .D(n166), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[1][2] ) );
  DFFSR \REGS_reg[1][1]  ( .D(n165), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[1][1] ) );
  DFFSR \REGS_reg[1][0]  ( .D(n164), .CLK(n335), .R(n329), .S(1'b1), .Q(
        \REGS[1][0] ) );
  AND2X2 U84 ( .A(N27), .B(n90), .Y(rd2_next[7]) );
  AND2X2 U85 ( .A(N28), .B(n90), .Y(rd2_next[6]) );
  AND2X2 U86 ( .A(N29), .B(n90), .Y(rd2_next[5]) );
  AND2X2 U87 ( .A(N30), .B(n90), .Y(rd2_next[4]) );
  AND2X2 U88 ( .A(N31), .B(n90), .Y(rd2_next[3]) );
  AND2X2 U89 ( .A(N32), .B(n90), .Y(rd2_next[2]) );
  AND2X2 U90 ( .A(N33), .B(n90), .Y(rd2_next[1]) );
  AND2X2 U91 ( .A(N34), .B(n90), .Y(rd2_next[0]) );
  AND2X2 U92 ( .A(N19), .B(n93), .Y(rd1_next[7]) );
  AND2X2 U93 ( .A(N20), .B(n93), .Y(rd1_next[6]) );
  AND2X2 U94 ( .A(N21), .B(n93), .Y(rd1_next[5]) );
  AND2X2 U95 ( .A(N22), .B(n93), .Y(rd1_next[4]) );
  AND2X2 U96 ( .A(N23), .B(n93), .Y(rd1_next[3]) );
  AND2X2 U97 ( .A(N24), .B(n93), .Y(rd1_next[2]) );
  AND2X2 U98 ( .A(N25), .B(n93), .Y(rd1_next[1]) );
  AND2X2 U99 ( .A(N26), .B(n93), .Y(rd1_next[0]) );
  NAND3X1 U116 ( .A(n91), .B(n315), .C(n92), .Y(n90) );
  NOR2X1 U117 ( .A(N17), .B(N16), .Y(n92) );
  NOR2X1 U118 ( .A(ra2[4]), .B(ra2[3]), .Y(n91) );
  NAND3X1 U119 ( .A(n94), .B(n260), .C(n95), .Y(n93) );
  NOR2X1 U120 ( .A(N14), .B(N13), .Y(n95) );
  NOR2X1 U121 ( .A(ra1[4]), .B(ra1[3]), .Y(n94) );
  OAI21X1 U122 ( .A(n96), .B(n341), .C(n97), .Y(n164) );
  NAND2X1 U123 ( .A(\REGS[1][0] ), .B(n96), .Y(n97) );
  OAI21X1 U124 ( .A(n96), .B(n348), .C(n98), .Y(n165) );
  NAND2X1 U125 ( .A(\REGS[1][1] ), .B(n96), .Y(n98) );
  OAI21X1 U126 ( .A(n96), .B(n347), .C(n99), .Y(n166) );
  NAND2X1 U127 ( .A(\REGS[1][2] ), .B(n96), .Y(n99) );
  OAI21X1 U128 ( .A(n96), .B(n346), .C(n100), .Y(n167) );
  NAND2X1 U129 ( .A(\REGS[1][3] ), .B(n96), .Y(n100) );
  OAI21X1 U130 ( .A(n96), .B(n345), .C(n101), .Y(n168) );
  NAND2X1 U131 ( .A(\REGS[1][4] ), .B(n96), .Y(n101) );
  OAI21X1 U132 ( .A(n96), .B(n344), .C(n102), .Y(n169) );
  NAND2X1 U133 ( .A(\REGS[1][5] ), .B(n96), .Y(n102) );
  OAI21X1 U134 ( .A(n96), .B(n343), .C(n103), .Y(n170) );
  NAND2X1 U135 ( .A(\REGS[1][6] ), .B(n96), .Y(n103) );
  OAI21X1 U136 ( .A(n96), .B(n342), .C(n104), .Y(n171) );
  NAND2X1 U137 ( .A(\REGS[1][7] ), .B(n96), .Y(n104) );
  NAND2X1 U138 ( .A(n351), .B(n353), .Y(n96) );
  OAI21X1 U139 ( .A(n341), .B(n105), .C(n106), .Y(n172) );
  NAND2X1 U140 ( .A(\REGS[2][0] ), .B(n105), .Y(n106) );
  OAI21X1 U141 ( .A(n348), .B(n105), .C(n107), .Y(n173) );
  NAND2X1 U142 ( .A(\REGS[2][1] ), .B(n105), .Y(n107) );
  OAI21X1 U143 ( .A(n347), .B(n105), .C(n108), .Y(n174) );
  NAND2X1 U144 ( .A(\REGS[2][2] ), .B(n105), .Y(n108) );
  OAI21X1 U145 ( .A(n346), .B(n105), .C(n109), .Y(n175) );
  NAND2X1 U146 ( .A(\REGS[2][3] ), .B(n105), .Y(n109) );
  OAI21X1 U147 ( .A(n345), .B(n105), .C(n110), .Y(n176) );
  NAND2X1 U148 ( .A(\REGS[2][4] ), .B(n105), .Y(n110) );
  OAI21X1 U149 ( .A(n344), .B(n105), .C(n111), .Y(n177) );
  NAND2X1 U150 ( .A(\REGS[2][5] ), .B(n105), .Y(n111) );
  OAI21X1 U151 ( .A(n343), .B(n105), .C(n112), .Y(n178) );
  NAND2X1 U152 ( .A(\REGS[2][6] ), .B(n105), .Y(n112) );
  OAI21X1 U153 ( .A(n342), .B(n105), .C(n113), .Y(n179) );
  NAND2X1 U154 ( .A(\REGS[2][7] ), .B(n105), .Y(n113) );
  NAND2X1 U155 ( .A(n351), .B(n349), .Y(n105) );
  OAI21X1 U156 ( .A(n341), .B(n328), .C(n115), .Y(n180) );
  NAND2X1 U157 ( .A(\REGS[3][0] ), .B(n328), .Y(n115) );
  OAI21X1 U158 ( .A(n348), .B(n328), .C(n116), .Y(n181) );
  NAND2X1 U159 ( .A(\REGS[3][1] ), .B(n328), .Y(n116) );
  OAI21X1 U160 ( .A(n347), .B(n328), .C(n117), .Y(n182) );
  NAND2X1 U161 ( .A(\REGS[3][2] ), .B(n328), .Y(n117) );
  OAI21X1 U162 ( .A(n346), .B(n328), .C(n118), .Y(n183) );
  NAND2X1 U163 ( .A(\REGS[3][3] ), .B(n328), .Y(n118) );
  OAI21X1 U164 ( .A(n345), .B(n328), .C(n119), .Y(n184) );
  NAND2X1 U165 ( .A(\REGS[3][4] ), .B(n328), .Y(n119) );
  OAI21X1 U166 ( .A(n344), .B(n328), .C(n120), .Y(n185) );
  NAND2X1 U167 ( .A(\REGS[3][5] ), .B(n328), .Y(n120) );
  OAI21X1 U168 ( .A(n343), .B(n328), .C(n121), .Y(n186) );
  NAND2X1 U169 ( .A(\REGS[3][6] ), .B(n328), .Y(n121) );
  OAI21X1 U170 ( .A(n342), .B(n328), .C(n122), .Y(n187) );
  NAND2X1 U171 ( .A(\REGS[3][7] ), .B(n328), .Y(n122) );
  NAND3X1 U172 ( .A(wa[0]), .B(n351), .C(wa[1]), .Y(n114) );
  NAND3X1 U173 ( .A(n352), .B(n354), .C(n124), .Y(n123) );
  OAI21X1 U174 ( .A(n341), .B(n326), .C(n126), .Y(n188) );
  NAND2X1 U175 ( .A(\REGS[4][0] ), .B(n326), .Y(n126) );
  OAI21X1 U176 ( .A(n348), .B(n326), .C(n127), .Y(n189) );
  NAND2X1 U177 ( .A(\REGS[4][1] ), .B(n326), .Y(n127) );
  OAI21X1 U178 ( .A(n347), .B(n326), .C(n128), .Y(n190) );
  NAND2X1 U179 ( .A(\REGS[4][2] ), .B(n326), .Y(n128) );
  OAI21X1 U180 ( .A(n346), .B(n326), .C(n129), .Y(n191) );
  NAND2X1 U181 ( .A(\REGS[4][3] ), .B(n326), .Y(n129) );
  OAI21X1 U182 ( .A(n345), .B(n326), .C(n130), .Y(n192) );
  NAND2X1 U183 ( .A(\REGS[4][4] ), .B(n326), .Y(n130) );
  OAI21X1 U184 ( .A(n344), .B(n326), .C(n131), .Y(n193) );
  NAND2X1 U185 ( .A(\REGS[4][5] ), .B(n326), .Y(n131) );
  OAI21X1 U186 ( .A(n343), .B(n326), .C(n132), .Y(n194) );
  NAND2X1 U187 ( .A(\REGS[4][6] ), .B(n326), .Y(n132) );
  OAI21X1 U188 ( .A(n342), .B(n326), .C(n133), .Y(n195) );
  NAND2X1 U189 ( .A(\REGS[4][7] ), .B(n326), .Y(n133) );
  NAND3X1 U190 ( .A(n349), .B(n353), .C(n350), .Y(n125) );
  OAI21X1 U191 ( .A(n341), .B(n324), .C(n135), .Y(n196) );
  NAND2X1 U192 ( .A(\REGS[5][0] ), .B(n324), .Y(n135) );
  OAI21X1 U193 ( .A(n348), .B(n324), .C(n136), .Y(n197) );
  NAND2X1 U194 ( .A(\REGS[5][1] ), .B(n324), .Y(n136) );
  OAI21X1 U195 ( .A(n347), .B(n324), .C(n137), .Y(n198) );
  NAND2X1 U196 ( .A(\REGS[5][2] ), .B(n324), .Y(n137) );
  OAI21X1 U197 ( .A(n346), .B(n324), .C(n138), .Y(n199) );
  NAND2X1 U198 ( .A(\REGS[5][3] ), .B(n324), .Y(n138) );
  OAI21X1 U199 ( .A(n345), .B(n324), .C(n139), .Y(n200) );
  NAND2X1 U200 ( .A(\REGS[5][4] ), .B(n324), .Y(n139) );
  OAI21X1 U201 ( .A(n344), .B(n324), .C(n140), .Y(n201) );
  NAND2X1 U202 ( .A(\REGS[5][5] ), .B(n324), .Y(n140) );
  OAI21X1 U203 ( .A(n343), .B(n324), .C(n141), .Y(n202) );
  NAND2X1 U204 ( .A(\REGS[5][6] ), .B(n324), .Y(n141) );
  OAI21X1 U205 ( .A(n342), .B(n324), .C(n142), .Y(n203) );
  NAND2X1 U206 ( .A(\REGS[5][7] ), .B(n324), .Y(n142) );
  NAND3X1 U207 ( .A(wa[0]), .B(n353), .C(n350), .Y(n134) );
  OAI21X1 U208 ( .A(n341), .B(n322), .C(n144), .Y(n204) );
  NAND2X1 U209 ( .A(\REGS[6][0] ), .B(n322), .Y(n144) );
  OAI21X1 U210 ( .A(n348), .B(n322), .C(n145), .Y(n205) );
  NAND2X1 U211 ( .A(\REGS[6][1] ), .B(n322), .Y(n145) );
  OAI21X1 U212 ( .A(n347), .B(n322), .C(n146), .Y(n206) );
  NAND2X1 U213 ( .A(\REGS[6][2] ), .B(n322), .Y(n146) );
  OAI21X1 U214 ( .A(n346), .B(n322), .C(n147), .Y(n207) );
  NAND2X1 U215 ( .A(\REGS[6][3] ), .B(n322), .Y(n147) );
  OAI21X1 U216 ( .A(n345), .B(n322), .C(n148), .Y(n208) );
  NAND2X1 U217 ( .A(\REGS[6][4] ), .B(n322), .Y(n148) );
  OAI21X1 U218 ( .A(n344), .B(n322), .C(n149), .Y(n209) );
  NAND2X1 U219 ( .A(\REGS[6][5] ), .B(n322), .Y(n149) );
  OAI21X1 U220 ( .A(n343), .B(n322), .C(n150), .Y(n210) );
  NAND2X1 U221 ( .A(\REGS[6][6] ), .B(n322), .Y(n150) );
  OAI21X1 U222 ( .A(n342), .B(n322), .C(n151), .Y(n211) );
  NAND2X1 U223 ( .A(\REGS[6][7] ), .B(n322), .Y(n151) );
  NAND3X1 U224 ( .A(wa[1]), .B(n349), .C(n350), .Y(n143) );
  OAI21X1 U225 ( .A(n341), .B(n320), .C(n153), .Y(n212) );
  NAND2X1 U226 ( .A(\REGS[7][0] ), .B(n320), .Y(n153) );
  OAI21X1 U227 ( .A(n348), .B(n320), .C(n154), .Y(n213) );
  NAND2X1 U228 ( .A(\REGS[7][1] ), .B(n320), .Y(n154) );
  OAI21X1 U229 ( .A(n347), .B(n320), .C(n155), .Y(n214) );
  NAND2X1 U230 ( .A(\REGS[7][2] ), .B(n320), .Y(n155) );
  OAI21X1 U231 ( .A(n346), .B(n320), .C(n156), .Y(n215) );
  NAND2X1 U232 ( .A(\REGS[7][3] ), .B(n320), .Y(n156) );
  OAI21X1 U233 ( .A(n345), .B(n320), .C(n157), .Y(n216) );
  NAND2X1 U234 ( .A(\REGS[7][4] ), .B(n320), .Y(n157) );
  OAI21X1 U235 ( .A(n344), .B(n320), .C(n158), .Y(n217) );
  NAND2X1 U236 ( .A(\REGS[7][5] ), .B(n320), .Y(n158) );
  OAI21X1 U237 ( .A(n343), .B(n320), .C(n159), .Y(n218) );
  NAND2X1 U238 ( .A(\REGS[7][6] ), .B(n320), .Y(n159) );
  OAI21X1 U239 ( .A(n342), .B(n320), .C(n160), .Y(n219) );
  NAND2X1 U240 ( .A(\REGS[7][7] ), .B(n320), .Y(n160) );
  NAND3X1 U241 ( .A(wa[1]), .B(wa[0]), .C(n350), .Y(n152) );
  NAND3X1 U242 ( .A(n124), .B(n352), .C(wa[2]), .Y(n161) );
  OAI21X1 U243 ( .A(wa[0]), .B(n163), .C(regwrite), .Y(n162) );
  NAND2X1 U244 ( .A(n353), .B(n354), .Y(n163) );
  NOR2X1 U245 ( .A(wa[4]), .B(wa[3]), .Y(n124) );
  BUFX2 U3 ( .A(clk), .Y(n335) );
  BUFX2 U4 ( .A(clk), .Y(n336) );
  BUFX2 U5 ( .A(clk), .Y(n337) );
  BUFX2 U6 ( .A(clk), .Y(n338) );
  BUFX2 U7 ( .A(clk), .Y(n339) );
  BUFX2 U8 ( .A(clk), .Y(n340) );
  INVX2 U9 ( .A(n325), .Y(n326) );
  INVX2 U10 ( .A(n125), .Y(n325) );
  INVX2 U82 ( .A(n72), .Y(n317) );
  INVX2 U100 ( .A(n74), .Y(n262) );
  BUFX2 U101 ( .A(n355), .Y(n329) );
  BUFX2 U102 ( .A(n355), .Y(n330) );
  BUFX2 U103 ( .A(n355), .Y(n331) );
  BUFX2 U104 ( .A(n355), .Y(n332) );
  BUFX2 U105 ( .A(n355), .Y(n333) );
  BUFX2 U106 ( .A(n355), .Y(n334) );
  OR2X1 U107 ( .A(n315), .B(n314), .Y(n72) );
  OR2X1 U108 ( .A(n260), .B(n259), .Y(n74) );
  INVX2 U109 ( .A(n327), .Y(n328) );
  INVX2 U110 ( .A(n114), .Y(n327) );
  INVX2 U111 ( .A(n323), .Y(n324) );
  INVX2 U112 ( .A(n134), .Y(n323) );
  INVX2 U113 ( .A(n321), .Y(n322) );
  INVX2 U114 ( .A(n143), .Y(n321) );
  INVX2 U115 ( .A(n319), .Y(n320) );
  INVX2 U246 ( .A(n152), .Y(n319) );
  INVX2 U247 ( .A(n76), .Y(n316) );
  INVX2 U248 ( .A(n78), .Y(n261) );
  INVX2 U249 ( .A(n75), .Y(n318) );
  INVX2 U250 ( .A(n77), .Y(n263) );
  OR2X1 U251 ( .A(n314), .B(N18), .Y(n75) );
  OR2X1 U252 ( .A(n315), .B(N17), .Y(n76) );
  OR2X1 U253 ( .A(n259), .B(N15), .Y(n77) );
  OR2X1 U254 ( .A(n260), .B(N14), .Y(n78) );
  AOI22X1 U255 ( .A(\REGS[4][0] ), .B(n261), .C(\REGS[6][0] ), .D(n262), .Y(
        n80) );
  NOR2X1 U256 ( .A(N14), .B(N15), .Y(n253) );
  AOI21X1 U257 ( .A(n80), .B(n79), .C(N13), .Y(n84) );
  AOI22X1 U258 ( .A(\REGS[5][0] ), .B(n261), .C(\REGS[7][0] ), .D(n262), .Y(
        n82) );
  AOI22X1 U259 ( .A(\REGS[1][0] ), .B(n253), .C(\REGS[3][0] ), .D(n263), .Y(
        n81) );
  AOI21X1 U260 ( .A(n82), .B(n81), .C(n258), .Y(n83) );
  OR2X1 U261 ( .A(n84), .B(n83), .Y(N26) );
  AOI22X1 U262 ( .A(\REGS[4][1] ), .B(n261), .C(\REGS[6][1] ), .D(n262), .Y(
        n86) );
  AOI21X1 U263 ( .A(n86), .B(n85), .C(N13), .Y(n220) );
  AOI22X1 U264 ( .A(\REGS[5][1] ), .B(n261), .C(\REGS[7][1] ), .D(n262), .Y(
        n88) );
  AOI22X1 U265 ( .A(\REGS[1][1] ), .B(n253), .C(\REGS[3][1] ), .D(n263), .Y(
        n87) );
  AOI21X1 U266 ( .A(n88), .B(n87), .C(n258), .Y(n89) );
  OR2X1 U267 ( .A(n220), .B(n89), .Y(N25) );
  AOI22X1 U268 ( .A(\REGS[4][2] ), .B(n261), .C(\REGS[6][2] ), .D(n262), .Y(
        n222) );
  AOI21X1 U269 ( .A(n222), .B(n221), .C(N13), .Y(n226) );
  AOI22X1 U270 ( .A(\REGS[5][2] ), .B(n261), .C(\REGS[7][2] ), .D(n262), .Y(
        n224) );
  AOI22X1 U271 ( .A(\REGS[1][2] ), .B(n253), .C(\REGS[3][2] ), .D(n263), .Y(
        n223) );
  AOI21X1 U272 ( .A(n224), .B(n223), .C(n258), .Y(n225) );
  OR2X1 U273 ( .A(n226), .B(n225), .Y(N24) );
  AOI22X1 U274 ( .A(\REGS[4][3] ), .B(n261), .C(\REGS[6][3] ), .D(n262), .Y(
        n228) );
  AOI21X1 U275 ( .A(n228), .B(n227), .C(N13), .Y(n232) );
  AOI22X1 U276 ( .A(\REGS[5][3] ), .B(n261), .C(\REGS[7][3] ), .D(n262), .Y(
        n230) );
  AOI22X1 U277 ( .A(\REGS[1][3] ), .B(n253), .C(\REGS[3][3] ), .D(n263), .Y(
        n229) );
  AOI21X1 U278 ( .A(n230), .B(n229), .C(n258), .Y(n231) );
  OR2X1 U279 ( .A(n232), .B(n231), .Y(N23) );
  AOI22X1 U280 ( .A(\REGS[4][4] ), .B(n261), .C(\REGS[6][4] ), .D(n262), .Y(
        n234) );
  AOI21X1 U281 ( .A(n234), .B(n233), .C(N13), .Y(n238) );
  AOI22X1 U282 ( .A(\REGS[5][4] ), .B(n261), .C(\REGS[7][4] ), .D(n262), .Y(
        n236) );
  AOI22X1 U283 ( .A(\REGS[1][4] ), .B(n253), .C(\REGS[3][4] ), .D(n263), .Y(
        n235) );
  AOI21X1 U284 ( .A(n236), .B(n235), .C(n258), .Y(n237) );
  OR2X1 U285 ( .A(n238), .B(n237), .Y(N22) );
  AOI22X1 U286 ( .A(\REGS[4][5] ), .B(n261), .C(\REGS[6][5] ), .D(n262), .Y(
        n240) );
  AOI21X1 U287 ( .A(n240), .B(n239), .C(N13), .Y(n244) );
  AOI22X1 U288 ( .A(\REGS[5][5] ), .B(n261), .C(\REGS[7][5] ), .D(n262), .Y(
        n242) );
  AOI22X1 U289 ( .A(\REGS[1][5] ), .B(n253), .C(\REGS[3][5] ), .D(n263), .Y(
        n241) );
  AOI21X1 U290 ( .A(n242), .B(n241), .C(n258), .Y(n243) );
  OR2X1 U291 ( .A(n244), .B(n243), .Y(N21) );
  AOI22X1 U292 ( .A(\REGS[4][6] ), .B(n261), .C(\REGS[6][6] ), .D(n262), .Y(
        n246) );
  AOI21X1 U293 ( .A(n246), .B(n245), .C(N13), .Y(n250) );
  AOI22X1 U294 ( .A(\REGS[5][6] ), .B(n261), .C(\REGS[7][6] ), .D(n262), .Y(
        n248) );
  AOI22X1 U295 ( .A(\REGS[1][6] ), .B(n253), .C(\REGS[3][6] ), .D(n263), .Y(
        n247) );
  AOI21X1 U296 ( .A(n248), .B(n247), .C(n258), .Y(n249) );
  OR2X1 U297 ( .A(n250), .B(n249), .Y(N20) );
  AOI22X1 U298 ( .A(\REGS[4][7] ), .B(n261), .C(\REGS[6][7] ), .D(n262), .Y(
        n252) );
  AOI21X1 U299 ( .A(n252), .B(n251), .C(N13), .Y(n257) );
  AOI22X1 U300 ( .A(\REGS[5][7] ), .B(n261), .C(\REGS[7][7] ), .D(n262), .Y(
        n255) );
  AOI22X1 U301 ( .A(\REGS[1][7] ), .B(n253), .C(\REGS[3][7] ), .D(n263), .Y(
        n254) );
  AOI21X1 U302 ( .A(n255), .B(n254), .C(n258), .Y(n256) );
  OR2X1 U303 ( .A(n257), .B(n256), .Y(N19) );
  NAND2X1 U304 ( .A(\REGS[2][7] ), .B(n263), .Y(n251) );
  NAND2X1 U305 ( .A(\REGS[2][6] ), .B(n263), .Y(n245) );
  NAND2X1 U306 ( .A(\REGS[2][5] ), .B(n263), .Y(n239) );
  NAND2X1 U307 ( .A(\REGS[2][4] ), .B(n263), .Y(n233) );
  NAND2X1 U308 ( .A(\REGS[2][3] ), .B(n263), .Y(n227) );
  NAND2X1 U309 ( .A(\REGS[2][2] ), .B(n263), .Y(n221) );
  NAND2X1 U310 ( .A(\REGS[2][1] ), .B(n263), .Y(n85) );
  NAND2X1 U311 ( .A(\REGS[2][0] ), .B(n263), .Y(n79) );
  INVX2 U312 ( .A(N13), .Y(n258) );
  INVX2 U313 ( .A(N14), .Y(n259) );
  INVX2 U314 ( .A(N15), .Y(n260) );
  AOI22X1 U315 ( .A(\REGS[4][0] ), .B(n316), .C(\REGS[6][0] ), .D(n317), .Y(
        n265) );
  NOR2X1 U316 ( .A(N17), .B(N18), .Y(n308) );
  AOI21X1 U317 ( .A(n265), .B(n264), .C(N16), .Y(n269) );
  AOI22X1 U318 ( .A(\REGS[5][0] ), .B(n316), .C(\REGS[7][0] ), .D(n317), .Y(
        n267) );
  AOI22X1 U319 ( .A(\REGS[1][0] ), .B(n308), .C(\REGS[3][0] ), .D(n318), .Y(
        n266) );
  AOI21X1 U320 ( .A(n267), .B(n266), .C(n313), .Y(n268) );
  OR2X1 U321 ( .A(n269), .B(n268), .Y(N34) );
  AOI22X1 U322 ( .A(\REGS[4][1] ), .B(n316), .C(\REGS[6][1] ), .D(n317), .Y(
        n271) );
  AOI21X1 U323 ( .A(n271), .B(n270), .C(N16), .Y(n275) );
  AOI22X1 U324 ( .A(\REGS[5][1] ), .B(n316), .C(\REGS[7][1] ), .D(n317), .Y(
        n273) );
  AOI22X1 U325 ( .A(\REGS[1][1] ), .B(n308), .C(\REGS[3][1] ), .D(n318), .Y(
        n272) );
  AOI21X1 U326 ( .A(n273), .B(n272), .C(n313), .Y(n274) );
  OR2X1 U327 ( .A(n275), .B(n274), .Y(N33) );
  AOI22X1 U328 ( .A(\REGS[4][2] ), .B(n316), .C(\REGS[6][2] ), .D(n317), .Y(
        n277) );
  AOI21X1 U329 ( .A(n277), .B(n276), .C(N16), .Y(n281) );
  AOI22X1 U330 ( .A(\REGS[5][2] ), .B(n316), .C(\REGS[7][2] ), .D(n317), .Y(
        n279) );
  AOI22X1 U331 ( .A(\REGS[1][2] ), .B(n308), .C(\REGS[3][2] ), .D(n318), .Y(
        n278) );
  AOI21X1 U332 ( .A(n279), .B(n278), .C(n313), .Y(n280) );
  OR2X1 U333 ( .A(n281), .B(n280), .Y(N32) );
  AOI22X1 U334 ( .A(\REGS[4][3] ), .B(n316), .C(\REGS[6][3] ), .D(n317), .Y(
        n283) );
  AOI21X1 U335 ( .A(n283), .B(n282), .C(N16), .Y(n287) );
  AOI22X1 U336 ( .A(\REGS[5][3] ), .B(n316), .C(\REGS[7][3] ), .D(n317), .Y(
        n285) );
  AOI22X1 U337 ( .A(\REGS[1][3] ), .B(n308), .C(\REGS[3][3] ), .D(n318), .Y(
        n284) );
  AOI21X1 U338 ( .A(n285), .B(n284), .C(n313), .Y(n286) );
  OR2X1 U339 ( .A(n287), .B(n286), .Y(N31) );
  AOI22X1 U340 ( .A(\REGS[4][4] ), .B(n316), .C(\REGS[6][4] ), .D(n317), .Y(
        n289) );
  AOI21X1 U341 ( .A(n289), .B(n288), .C(N16), .Y(n293) );
  AOI22X1 U342 ( .A(\REGS[5][4] ), .B(n316), .C(\REGS[7][4] ), .D(n317), .Y(
        n291) );
  AOI22X1 U343 ( .A(\REGS[1][4] ), .B(n308), .C(\REGS[3][4] ), .D(n318), .Y(
        n290) );
  AOI21X1 U344 ( .A(n291), .B(n290), .C(n313), .Y(n292) );
  OR2X1 U345 ( .A(n293), .B(n292), .Y(N30) );
  AOI22X1 U346 ( .A(\REGS[4][5] ), .B(n316), .C(\REGS[6][5] ), .D(n317), .Y(
        n295) );
  AOI21X1 U347 ( .A(n295), .B(n294), .C(N16), .Y(n299) );
  AOI22X1 U348 ( .A(\REGS[5][5] ), .B(n316), .C(\REGS[7][5] ), .D(n317), .Y(
        n297) );
  AOI22X1 U349 ( .A(\REGS[1][5] ), .B(n308), .C(\REGS[3][5] ), .D(n318), .Y(
        n296) );
  AOI21X1 U350 ( .A(n297), .B(n296), .C(n313), .Y(n298) );
  OR2X1 U351 ( .A(n299), .B(n298), .Y(N29) );
  AOI22X1 U352 ( .A(\REGS[4][6] ), .B(n316), .C(\REGS[6][6] ), .D(n317), .Y(
        n301) );
  AOI21X1 U353 ( .A(n301), .B(n300), .C(N16), .Y(n305) );
  AOI22X1 U354 ( .A(\REGS[5][6] ), .B(n316), .C(\REGS[7][6] ), .D(n317), .Y(
        n303) );
  AOI22X1 U355 ( .A(\REGS[1][6] ), .B(n308), .C(\REGS[3][6] ), .D(n318), .Y(
        n302) );
  AOI21X1 U356 ( .A(n303), .B(n302), .C(n313), .Y(n304) );
  OR2X1 U357 ( .A(n305), .B(n304), .Y(N28) );
  AOI22X1 U358 ( .A(\REGS[4][7] ), .B(n316), .C(\REGS[6][7] ), .D(n317), .Y(
        n307) );
  AOI21X1 U359 ( .A(n307), .B(n306), .C(N16), .Y(n312) );
  AOI22X1 U360 ( .A(\REGS[5][7] ), .B(n316), .C(\REGS[7][7] ), .D(n317), .Y(
        n310) );
  AOI22X1 U361 ( .A(\REGS[1][7] ), .B(n308), .C(\REGS[3][7] ), .D(n318), .Y(
        n309) );
  AOI21X1 U362 ( .A(n310), .B(n309), .C(n313), .Y(n311) );
  OR2X1 U363 ( .A(n312), .B(n311), .Y(N27) );
  NAND2X1 U364 ( .A(\REGS[2][7] ), .B(n318), .Y(n306) );
  NAND2X1 U365 ( .A(\REGS[2][6] ), .B(n318), .Y(n300) );
  NAND2X1 U366 ( .A(\REGS[2][5] ), .B(n318), .Y(n294) );
  NAND2X1 U367 ( .A(\REGS[2][4] ), .B(n318), .Y(n288) );
  NAND2X1 U368 ( .A(\REGS[2][3] ), .B(n318), .Y(n282) );
  NAND2X1 U369 ( .A(\REGS[2][2] ), .B(n318), .Y(n276) );
  NAND2X1 U370 ( .A(\REGS[2][1] ), .B(n318), .Y(n270) );
  NAND2X1 U371 ( .A(\REGS[2][0] ), .B(n318), .Y(n264) );
  INVX2 U372 ( .A(N16), .Y(n313) );
  INVX2 U373 ( .A(N17), .Y(n314) );
  INVX2 U374 ( .A(N18), .Y(n315) );
  INVX2 U375 ( .A(wd[0]), .Y(n341) );
  INVX2 U376 ( .A(wd[7]), .Y(n342) );
  INVX2 U377 ( .A(wd[6]), .Y(n343) );
  INVX2 U378 ( .A(wd[5]), .Y(n344) );
  INVX2 U379 ( .A(wd[4]), .Y(n345) );
  INVX2 U380 ( .A(wd[3]), .Y(n346) );
  INVX2 U381 ( .A(wd[2]), .Y(n347) );
  INVX2 U382 ( .A(wd[1]), .Y(n348) );
  INVX2 U383 ( .A(wa[0]), .Y(n349) );
  INVX2 U384 ( .A(n161), .Y(n350) );
  INVX2 U385 ( .A(n123), .Y(n351) );
  INVX2 U386 ( .A(n162), .Y(n352) );
  INVX2 U387 ( .A(wa[1]), .Y(n353) );
  INVX2 U388 ( .A(wa[2]), .Y(n354) );
  INVX2 U389 ( .A(reset), .Y(n355) );
endmodule


module flop_2 ( clk, reset, d, q );
  input [7:0] d;
  output [7:0] q;
  input clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n1, n2, n3;

  DFFPOSX1 \q_reg[7]  ( .D(N10), .CLK(n1), .Q(q[7]) );
  DFFPOSX1 \q_reg[6]  ( .D(N9), .CLK(n1), .Q(q[6]) );
  DFFPOSX1 \q_reg[5]  ( .D(N8), .CLK(n1), .Q(q[5]) );
  DFFPOSX1 \q_reg[4]  ( .D(N7), .CLK(n1), .Q(q[4]) );
  DFFPOSX1 \q_reg[3]  ( .D(N6), .CLK(n1), .Q(q[3]) );
  DFFPOSX1 \q_reg[2]  ( .D(N5), .CLK(n1), .Q(q[2]) );
  DFFPOSX1 \q_reg[1]  ( .D(N4), .CLK(n1), .Q(q[1]) );
  DFFPOSX1 \q_reg[0]  ( .D(N3), .CLK(n1), .Q(q[0]) );
  AND2X2 U3 ( .A(d[6]), .B(n3), .Y(N9) );
  AND2X2 U4 ( .A(d[5]), .B(n3), .Y(N8) );
  AND2X2 U5 ( .A(d[4]), .B(n3), .Y(N7) );
  AND2X2 U6 ( .A(d[3]), .B(n3), .Y(N6) );
  AND2X2 U7 ( .A(d[2]), .B(n3), .Y(N5) );
  AND2X2 U8 ( .A(d[1]), .B(n3), .Y(N4) );
  AND2X2 U9 ( .A(d[0]), .B(n3), .Y(N3) );
  AND2X2 U10 ( .A(d[7]), .B(n3), .Y(N10) );
  INVX2 U11 ( .A(n2), .Y(n1) );
  INVX2 U12 ( .A(clk), .Y(n2) );
  INVX2 U13 ( .A(reset), .Y(n3) );
endmodule


module flop_1 ( clk, reset, d, q );
  input [7:0] d;
  output [7:0] q;
  input clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n1, n2, n3;

  DFFPOSX1 \q_reg[7]  ( .D(N10), .CLK(n1), .Q(q[7]) );
  DFFPOSX1 \q_reg[6]  ( .D(N9), .CLK(n1), .Q(q[6]) );
  DFFPOSX1 \q_reg[5]  ( .D(N8), .CLK(n1), .Q(q[5]) );
  DFFPOSX1 \q_reg[4]  ( .D(N7), .CLK(n1), .Q(q[4]) );
  DFFPOSX1 \q_reg[3]  ( .D(N6), .CLK(n1), .Q(q[3]) );
  DFFPOSX1 \q_reg[2]  ( .D(N5), .CLK(n1), .Q(q[2]) );
  DFFPOSX1 \q_reg[1]  ( .D(N4), .CLK(n1), .Q(q[1]) );
  DFFPOSX1 \q_reg[0]  ( .D(N3), .CLK(n1), .Q(q[0]) );
  AND2X2 U3 ( .A(d[6]), .B(n3), .Y(N9) );
  AND2X2 U4 ( .A(d[5]), .B(n3), .Y(N8) );
  AND2X2 U5 ( .A(d[4]), .B(n3), .Y(N7) );
  AND2X2 U6 ( .A(d[3]), .B(n3), .Y(N6) );
  AND2X2 U7 ( .A(d[2]), .B(n3), .Y(N5) );
  AND2X2 U8 ( .A(d[1]), .B(n3), .Y(N4) );
  AND2X2 U9 ( .A(d[0]), .B(n3), .Y(N3) );
  AND2X2 U10 ( .A(d[7]), .B(n3), .Y(N10) );
  INVX2 U11 ( .A(n2), .Y(n1) );
  INVX2 U12 ( .A(clk), .Y(n2) );
  INVX2 U13 ( .A(reset), .Y(n3) );
endmodule


module mux2_0 ( a, b, sel, y );
  input [7:0] a;
  input [7:0] b;
  output [7:0] y;
  input sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;

  INVX2 U1 ( .A(n9), .Y(y[7]) );
  INVX2 U2 ( .A(n8), .Y(y[6]) );
  INVX2 U3 ( .A(n7), .Y(y[5]) );
  INVX2 U4 ( .A(n6), .Y(y[4]) );
  INVX2 U5 ( .A(n5), .Y(y[3]) );
  INVX2 U6 ( .A(n4), .Y(y[2]) );
  INVX2 U7 ( .A(n3), .Y(y[1]) );
  INVX2 U8 ( .A(n2), .Y(y[0]) );
  AOI22X1 U10 ( .A(a[7]), .B(n1), .C(sel), .D(b[7]), .Y(n9) );
  AOI22X1 U11 ( .A(a[6]), .B(n1), .C(b[6]), .D(sel), .Y(n8) );
  AOI22X1 U12 ( .A(a[5]), .B(n1), .C(b[5]), .D(sel), .Y(n7) );
  AOI22X1 U13 ( .A(a[4]), .B(n1), .C(b[4]), .D(sel), .Y(n6) );
  AOI22X1 U14 ( .A(a[3]), .B(n1), .C(b[3]), .D(sel), .Y(n5) );
  AOI22X1 U15 ( .A(a[2]), .B(n1), .C(b[2]), .D(sel), .Y(n4) );
  AOI22X1 U16 ( .A(a[1]), .B(n1), .C(b[1]), .D(sel), .Y(n3) );
  AOI22X1 U17 ( .A(a[0]), .B(n1), .C(b[0]), .D(sel), .Y(n2) );
  INVX2 U9 ( .A(sel), .Y(n1) );
endmodule


module mux4 ( a, b, c, d, sel, y );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [7:0] d;
  input [1:0] sel;
  output [7:0] y;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n1;

  AND2X2 U1 ( .A(sel[1]), .B(n1), .Y(n5) );
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
  NOR2X1 U29 ( .A(n1), .B(sel[1]), .Y(n6) );
  INVX2 U3 ( .A(sel[0]), .Y(n1) );
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
  wire   N53, n17, n18, n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n20;
  wire   [7:0] b2;
  wire   [7:0] sum;
  assign zero = N53;

  AND2X2 U2 ( .A(alucont[0]), .B(alucont[1]), .Y(n30) );
  XOR2X1 U17 ( .A(b[7]), .B(n4), .Y(b2[7]) );
  XOR2X1 U18 ( .A(b[6]), .B(n4), .Y(b2[6]) );
  XOR2X1 U19 ( .A(b[5]), .B(n4), .Y(b2[5]) );
  XOR2X1 U20 ( .A(b[4]), .B(alucont[2]), .Y(b2[4]) );
  XOR2X1 U21 ( .A(b[3]), .B(alucont[2]), .Y(b2[3]) );
  XOR2X1 U22 ( .A(b[2]), .B(alucont[2]), .Y(b2[2]) );
  XOR2X1 U23 ( .A(b[1]), .B(alucont[2]), .Y(b2[1]) );
  XOR2X1 U24 ( .A(b[0]), .B(n4), .Y(b2[0]) );
  NOR2X1 U25 ( .A(n17), .B(n18), .Y(N53) );
  NAND3X1 U26 ( .A(n6), .B(n15), .C(n19), .Y(n18) );
  NOR2X1 U27 ( .A(aluout[3]), .B(aluout[2]), .Y(n19) );
  OAI21X1 U28 ( .A(n5), .B(n14), .C(n21), .Y(aluout[2]) );
  AOI22X1 U29 ( .A(b[2]), .B(n22), .C(sum[2]), .D(n23), .Y(n21) );
  OAI21X1 U30 ( .A(alucont[1]), .B(n14), .C(n5), .Y(n22) );
  OAI21X1 U31 ( .A(n5), .B(n13), .C(n24), .Y(aluout[3]) );
  AOI22X1 U32 ( .A(b[3]), .B(n25), .C(sum[3]), .D(n23), .Y(n24) );
  OAI21X1 U33 ( .A(alucont[1]), .B(n13), .C(n5), .Y(n25) );
  OAI21X1 U34 ( .A(n5), .B(n16), .C(n26), .Y(aluout[1]) );
  AOI22X1 U35 ( .A(b[1]), .B(n27), .C(sum[1]), .D(n23), .Y(n26) );
  OAI21X1 U36 ( .A(alucont[1]), .B(n16), .C(n5), .Y(n27) );
  NAND2X1 U37 ( .A(n28), .B(n29), .Y(aluout[0]) );
  AOI22X1 U38 ( .A(n30), .B(sum[7]), .C(b[0]), .D(n31), .Y(n29) );
  OAI21X1 U39 ( .A(alucont[1]), .B(n20), .C(n5), .Y(n31) );
  AOI22X1 U40 ( .A(sum[0]), .B(n23), .C(a[0]), .D(n1), .Y(n28) );
  NAND3X1 U41 ( .A(n11), .B(n9), .C(n32), .Y(n17) );
  NOR2X1 U42 ( .A(aluout[7]), .B(aluout[6]), .Y(n32) );
  OAI21X1 U43 ( .A(n5), .B(n8), .C(n33), .Y(aluout[6]) );
  AOI22X1 U44 ( .A(b[6]), .B(n34), .C(sum[6]), .D(n23), .Y(n33) );
  OAI21X1 U45 ( .A(alucont[1]), .B(n8), .C(n5), .Y(n34) );
  OAI21X1 U46 ( .A(n7), .B(n5), .C(n35), .Y(aluout[7]) );
  AOI22X1 U47 ( .A(b[7]), .B(n36), .C(sum[7]), .D(n23), .Y(n35) );
  OAI21X1 U48 ( .A(alucont[1]), .B(n7), .C(n5), .Y(n36) );
  OAI21X1 U49 ( .A(n5), .B(n10), .C(n37), .Y(aluout[5]) );
  AOI22X1 U50 ( .A(b[5]), .B(n38), .C(sum[5]), .D(n23), .Y(n37) );
  OAI21X1 U51 ( .A(alucont[1]), .B(n10), .C(n5), .Y(n38) );
  OAI21X1 U52 ( .A(n5), .B(n12), .C(n39), .Y(aluout[4]) );
  AOI22X1 U53 ( .A(b[4]), .B(n40), .C(sum[4]), .D(n23), .Y(n39) );
  NOR2X1 U54 ( .A(n2), .B(alucont[0]), .Y(n23) );
  OAI21X1 U55 ( .A(alucont[1]), .B(n12), .C(n5), .Y(n40) );
  alu_DW01_add_0 add_1_root_add_16_2 ( .A(a), .B(b2), .CI(n4), .SUM(sum) );
  AND2X2 U3 ( .A(alucont[0]), .B(n2), .Y(n1) );
  INVX2 U4 ( .A(n3), .Y(n4) );
  INVX2 U5 ( .A(alucont[2]), .Y(n3) );
  INVX2 U6 ( .A(n1), .Y(n5) );
  INVX2 U7 ( .A(alucont[1]), .Y(n2) );
  INVX2 U8 ( .A(aluout[0]), .Y(n6) );
  INVX2 U9 ( .A(a[7]), .Y(n7) );
  INVX2 U10 ( .A(a[6]), .Y(n8) );
  INVX2 U11 ( .A(aluout[5]), .Y(n9) );
  INVX2 U12 ( .A(a[5]), .Y(n10) );
  INVX2 U13 ( .A(aluout[4]), .Y(n11) );
  INVX2 U14 ( .A(a[4]), .Y(n12) );
  INVX2 U15 ( .A(a[3]), .Y(n13) );
  INVX2 U16 ( .A(a[2]), .Y(n14) );
  INVX2 U56 ( .A(aluout[1]), .Y(n15) );
  INVX2 U57 ( .A(a[1]), .Y(n16) );
  INVX2 U58 ( .A(a[0]), .Y(n20) );
endmodule


module flop_0 ( clk, reset, d, q );
  input [7:0] d;
  output [7:0] q;
  input clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n1, n2, n3;

  DFFPOSX1 \q_reg[7]  ( .D(N10), .CLK(n1), .Q(q[7]) );
  DFFPOSX1 \q_reg[6]  ( .D(N9), .CLK(n1), .Q(q[6]) );
  DFFPOSX1 \q_reg[5]  ( .D(N8), .CLK(n1), .Q(q[5]) );
  DFFPOSX1 \q_reg[4]  ( .D(N7), .CLK(n1), .Q(q[4]) );
  DFFPOSX1 \q_reg[3]  ( .D(N6), .CLK(n1), .Q(q[3]) );
  DFFPOSX1 \q_reg[2]  ( .D(N5), .CLK(n1), .Q(q[2]) );
  DFFPOSX1 \q_reg[1]  ( .D(N4), .CLK(n1), .Q(q[1]) );
  DFFPOSX1 \q_reg[0]  ( .D(N3), .CLK(n1), .Q(q[0]) );
  AND2X2 U3 ( .A(d[6]), .B(n3), .Y(N9) );
  AND2X2 U4 ( .A(d[5]), .B(n3), .Y(N8) );
  AND2X2 U5 ( .A(d[4]), .B(n3), .Y(N7) );
  AND2X2 U6 ( .A(d[3]), .B(n3), .Y(N6) );
  AND2X2 U7 ( .A(d[2]), .B(n3), .Y(N5) );
  AND2X2 U8 ( .A(d[1]), .B(n3), .Y(N4) );
  AND2X2 U9 ( .A(d[0]), .B(n3), .Y(N3) );
  AND2X2 U10 ( .A(d[7]), .B(n3), .Y(N10) );
  INVX2 U11 ( .A(n2), .Y(n1) );
  INVX2 U12 ( .A(clk), .Y(n2) );
  INVX2 U13 ( .A(reset), .Y(n3) );
endmodule


module mux3 ( a, b, c, sel, y );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [1:0] sel;
  output [7:0] y;
  wire   N13, N14, N15, N16, N17, N18, N19, N20, N21, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10
;

  LATCH \y_reg[7]  ( .CLK(N13), .D(N21), .Q(y[7]) );
  LATCH \y_reg[6]  ( .CLK(N13), .D(N20), .Q(y[6]) );
  LATCH \y_reg[5]  ( .CLK(N13), .D(N19), .Q(y[5]) );
  LATCH \y_reg[4]  ( .CLK(N13), .D(N18), .Q(y[4]) );
  LATCH \y_reg[3]  ( .CLK(N13), .D(N17), .Q(y[3]) );
  LATCH \y_reg[2]  ( .CLK(N13), .D(N16), .Q(y[2]) );
  LATCH \y_reg[1]  ( .CLK(N13), .D(N15), .Q(y[1]) );
  LATCH \y_reg[0]  ( .CLK(N13), .D(N14), .Q(y[0]) );
  OAI21X1 U13 ( .A(n11), .B(n2), .C(n12), .Y(N21) );
  AOI22X1 U14 ( .A(c[7]), .B(n13), .C(b[7]), .D(n14), .Y(n12) );
  OAI21X1 U15 ( .A(n11), .B(n3), .C(n15), .Y(N20) );
  AOI22X1 U16 ( .A(c[6]), .B(n13), .C(b[6]), .D(n14), .Y(n15) );
  OAI21X1 U17 ( .A(n11), .B(n4), .C(n16), .Y(N19) );
  AOI22X1 U18 ( .A(c[5]), .B(n13), .C(b[5]), .D(n14), .Y(n16) );
  OAI21X1 U19 ( .A(n11), .B(n5), .C(n17), .Y(N18) );
  AOI22X1 U20 ( .A(c[4]), .B(n13), .C(b[4]), .D(n14), .Y(n17) );
  OAI21X1 U21 ( .A(n11), .B(n6), .C(n18), .Y(N17) );
  AOI22X1 U22 ( .A(c[3]), .B(n13), .C(b[3]), .D(n14), .Y(n18) );
  OAI21X1 U23 ( .A(n11), .B(n7), .C(n19), .Y(N16) );
  AOI22X1 U24 ( .A(c[2]), .B(n13), .C(b[2]), .D(n14), .Y(n19) );
  OAI21X1 U25 ( .A(n11), .B(n8), .C(n20), .Y(N15) );
  AOI22X1 U26 ( .A(c[1]), .B(n13), .C(b[1]), .D(n14), .Y(n20) );
  OAI21X1 U27 ( .A(n11), .B(n1), .C(n21), .Y(N14) );
  AOI22X1 U28 ( .A(c[0]), .B(n13), .C(b[0]), .D(n14), .Y(n21) );
  NOR2X1 U29 ( .A(n10), .B(sel[1]), .Y(n14) );
  NOR2X1 U30 ( .A(n9), .B(sel[0]), .Y(n13) );
  NAND2X1 U31 ( .A(n10), .B(n9), .Y(n11) );
  NAND2X1 U32 ( .A(sel[0]), .B(sel[1]), .Y(N13) );
  INVX2 U3 ( .A(a[0]), .Y(n1) );
  INVX2 U4 ( .A(a[7]), .Y(n2) );
  INVX2 U5 ( .A(a[6]), .Y(n3) );
  INVX2 U6 ( .A(a[5]), .Y(n4) );
  INVX2 U7 ( .A(a[4]), .Y(n5) );
  INVX2 U8 ( .A(a[3]), .Y(n6) );
  INVX2 U9 ( .A(a[2]), .Y(n7) );
  INVX2 U10 ( .A(a[1]), .Y(n8) );
  INVX2 U11 ( .A(sel[1]), .Y(n9) );
  INVX2 U12 ( .A(sel[0]), .Y(n10) );
endmodule


module datapath_test_design ( clk, reset, pcen, iord, irwrite, regdst, 
        memtoreg, regwrite, alusrca, alusrcb, alucont, pcsource, memdata, op, 
        funct, zero, addr, wdata );
  input [3:0] irwrite;
  input [1:0] alusrcb;
  input [2:0] alucont;
  input [1:0] pcsource;
  input [7:0] memdata;
  output [5:0] op;
  output [5:0] funct;
  output [7:0] addr;
  output [7:0] wdata;
  input clk, reset, pcen, iord, regdst, memtoreg, regwrite, alusrca;
  output zero;
  wire   n3, n5, n7, n9, n11, n13, n15, n17, n19, n20, n21, n22, n23, n25, n26,
         n27, n28, n29, n30, n31, n32, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n1, n2, n4, n6, n8, n10, n12, n14, n16, n18, n24, n33, n71, n72,
         n73, n74;
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

  DFFPOSX1 \instr_reg[31]  ( .D(n70), .CLK(n6), .Q(op[5]) );
  DFFPOSX1 \instr_reg[30]  ( .D(n69), .CLK(clk), .Q(op[4]) );
  DFFPOSX1 \instr_reg[29]  ( .D(n68), .CLK(n2), .Q(op[3]) );
  DFFPOSX1 \instr_reg[28]  ( .D(n67), .CLK(n2), .Q(op[2]) );
  DFFPOSX1 \instr_reg[27]  ( .D(n66), .CLK(n4), .Q(op[1]) );
  DFFPOSX1 \instr_reg[26]  ( .D(n65), .CLK(clk), .Q(op[0]) );
  DFFPOSX1 \instr_reg[25]  ( .D(n64), .CLK(n2), .Q(instr[25]) );
  DFFPOSX1 \instr_reg[24]  ( .D(n63), .CLK(n6), .Q(instr[24]) );
  DFFPOSX1 \instr_reg[23]  ( .D(n62), .CLK(n6), .Q(instr[23]) );
  DFFPOSX1 \instr_reg[22]  ( .D(n61), .CLK(n6), .Q(instr[22]) );
  DFFPOSX1 \instr_reg[21]  ( .D(n60), .CLK(n6), .Q(instr[21]) );
  DFFPOSX1 \instr_reg[20]  ( .D(n59), .CLK(n6), .Q(instr[20]) );
  DFFPOSX1 \instr_reg[19]  ( .D(n58), .CLK(n6), .Q(instr[19]) );
  DFFPOSX1 \instr_reg[18]  ( .D(n57), .CLK(n6), .Q(instr[18]) );
  DFFPOSX1 \instr_reg[17]  ( .D(n56), .CLK(n6), .Q(instr[17]) );
  DFFPOSX1 \instr_reg[16]  ( .D(n55), .CLK(n6), .Q(instr[16]) );
  DFFPOSX1 \instr_reg[15]  ( .D(n54), .CLK(n6), .Q(instr[15]) );
  DFFPOSX1 \instr_reg[14]  ( .D(n53), .CLK(n6), .Q(instr[14]) );
  DFFPOSX1 \instr_reg[13]  ( .D(n52), .CLK(n6), .Q(instr[13]) );
  DFFPOSX1 \instr_reg[12]  ( .D(n51), .CLK(n6), .Q(instr[12]) );
  DFFPOSX1 \instr_reg[11]  ( .D(n50), .CLK(n6), .Q(instr[11]) );
  DFFPOSX1 \instr_reg[7]  ( .D(n49), .CLK(n6), .Q(imm[7]) );
  DFFPOSX1 \instr_reg[6]  ( .D(n48), .CLK(n6), .Q(imm[6]) );
  DFFPOSX1 \instr_reg[5]  ( .D(n47), .CLK(n6), .Q(funct[5]) );
  DFFPOSX1 \instr_reg[4]  ( .D(n46), .CLK(n6), .Q(funct[4]) );
  DFFPOSX1 \instr_reg[3]  ( .D(n45), .CLK(n6), .Q(funct[3]) );
  DFFPOSX1 \instr_reg[2]  ( .D(n44), .CLK(n6), .Q(funct[2]) );
  DFFPOSX1 \instr_reg[1]  ( .D(n43), .CLK(n6), .Q(funct[1]) );
  DFFPOSX1 \instr_reg[0]  ( .D(n42), .CLK(n4), .Q(funct[0]) );
  OAI21X1 U3 ( .A(n10), .B(n74), .C(n3), .Y(n42) );
  NAND2X1 U4 ( .A(funct[0]), .B(n10), .Y(n3) );
  OAI21X1 U5 ( .A(n10), .B(n73), .C(n5), .Y(n43) );
  NAND2X1 U6 ( .A(funct[1]), .B(n10), .Y(n5) );
  OAI21X1 U7 ( .A(n10), .B(n72), .C(n7), .Y(n44) );
  NAND2X1 U8 ( .A(funct[2]), .B(n10), .Y(n7) );
  OAI21X1 U9 ( .A(n10), .B(n71), .C(n9), .Y(n45) );
  NAND2X1 U10 ( .A(funct[3]), .B(n10), .Y(n9) );
  OAI21X1 U11 ( .A(n10), .B(n33), .C(n11), .Y(n46) );
  NAND2X1 U12 ( .A(funct[4]), .B(n10), .Y(n11) );
  OAI21X1 U13 ( .A(n10), .B(n24), .C(n13), .Y(n47) );
  NAND2X1 U14 ( .A(funct[5]), .B(n10), .Y(n13) );
  OAI21X1 U15 ( .A(n10), .B(n18), .C(n15), .Y(n48) );
  NAND2X1 U16 ( .A(imm[6]), .B(n10), .Y(n15) );
  OAI21X1 U17 ( .A(n10), .B(n16), .C(n17), .Y(n49) );
  NAND2X1 U18 ( .A(imm[7]), .B(n10), .Y(n17) );
  OAI21X1 U20 ( .A(n71), .B(n12), .C(n19), .Y(n50) );
  NAND2X1 U21 ( .A(instr[11]), .B(n12), .Y(n19) );
  OAI21X1 U22 ( .A(n33), .B(n12), .C(n20), .Y(n51) );
  NAND2X1 U23 ( .A(instr[12]), .B(n12), .Y(n20) );
  OAI21X1 U24 ( .A(n24), .B(n12), .C(n21), .Y(n52) );
  NAND2X1 U25 ( .A(instr[13]), .B(n12), .Y(n21) );
  OAI21X1 U26 ( .A(n18), .B(n12), .C(n22), .Y(n53) );
  NAND2X1 U27 ( .A(instr[14]), .B(n12), .Y(n22) );
  OAI21X1 U28 ( .A(n16), .B(n12), .C(n23), .Y(n54) );
  NAND2X1 U29 ( .A(instr[15]), .B(n12), .Y(n23) );
  OAI21X1 U31 ( .A(n74), .B(n8), .C(n25), .Y(n55) );
  NAND2X1 U32 ( .A(instr[16]), .B(n8), .Y(n25) );
  OAI21X1 U33 ( .A(n73), .B(n8), .C(n26), .Y(n56) );
  NAND2X1 U34 ( .A(instr[17]), .B(n8), .Y(n26) );
  OAI21X1 U35 ( .A(n72), .B(n8), .C(n27), .Y(n57) );
  NAND2X1 U36 ( .A(instr[18]), .B(n8), .Y(n27) );
  OAI21X1 U37 ( .A(n71), .B(n8), .C(n28), .Y(n58) );
  NAND2X1 U38 ( .A(instr[19]), .B(n8), .Y(n28) );
  OAI21X1 U39 ( .A(n33), .B(n8), .C(n29), .Y(n59) );
  NAND2X1 U40 ( .A(instr[20]), .B(n8), .Y(n29) );
  OAI21X1 U41 ( .A(n24), .B(n8), .C(n30), .Y(n60) );
  NAND2X1 U42 ( .A(instr[21]), .B(n8), .Y(n30) );
  OAI21X1 U43 ( .A(n18), .B(n8), .C(n31), .Y(n61) );
  NAND2X1 U44 ( .A(instr[22]), .B(n8), .Y(n31) );
  OAI21X1 U45 ( .A(n16), .B(n8), .C(n32), .Y(n62) );
  NAND2X1 U46 ( .A(instr[23]), .B(n8), .Y(n32) );
  OAI21X1 U48 ( .A(n74), .B(n14), .C(n34), .Y(n63) );
  NAND2X1 U49 ( .A(instr[24]), .B(n14), .Y(n34) );
  OAI21X1 U51 ( .A(n73), .B(n14), .C(n35), .Y(n64) );
  NAND2X1 U52 ( .A(instr[25]), .B(n14), .Y(n35) );
  OAI21X1 U54 ( .A(n72), .B(n14), .C(n36), .Y(n65) );
  NAND2X1 U55 ( .A(op[0]), .B(n14), .Y(n36) );
  OAI21X1 U57 ( .A(n71), .B(n14), .C(n37), .Y(n66) );
  NAND2X1 U58 ( .A(op[1]), .B(n14), .Y(n37) );
  OAI21X1 U60 ( .A(n33), .B(n14), .C(n38), .Y(n67) );
  NAND2X1 U61 ( .A(op[2]), .B(n14), .Y(n38) );
  OAI21X1 U63 ( .A(n24), .B(n14), .C(n39), .Y(n68) );
  NAND2X1 U64 ( .A(op[3]), .B(n14), .Y(n39) );
  OAI21X1 U66 ( .A(n18), .B(n14), .C(n40), .Y(n69) );
  NAND2X1 U67 ( .A(op[4]), .B(n14), .Y(n40) );
  OAI21X1 U69 ( .A(n16), .B(n14), .C(n41), .Y(n70) );
  NAND2X1 U70 ( .A(op[5]), .B(n14), .Y(n41) );
  flop_en pc_flop ( .clk(n4), .reset(reset), .en(pcen), .d(pcnext), .q(pc) );
  mux2_2 mux2_pc ( .a(pc), .b(aluout), .sel(iord), .y(addr) );
  flop_3 memdata_flop ( .clk(n4), .reset(reset), .d(memdata), .q(data) );
  mux2_DATA_WIDTH5 mux2_a3 ( .a(instr[20:16]), .b(instr[15:11]), .sel(regdst), 
        .y(wa) );
  mux2_1 mux2_w3 ( .a(aluout), .b(data), .sel(memtoreg), .y(wd) );
  register_file regfile ( .clk(n2), .reset(reset), .regwrite(regwrite), .ra1(
        instr[25:21]), .ra2(instr[20:16]), .wa(wa), .wd(wd), .rd1(rd1), .rd2(
        rd2) );
  flop_2 rdata1_flop ( .clk(n4), .reset(reset), .d(rd1), .q(a) );
  flop_1 rdata2_flop ( .clk(n4), .reset(reset), .d(rd2), .q(wdata) );
  mux2_0 mux2_a ( .a(pc), .b(a), .sel(alusrca), .y(aluin1) );
  mux4 mux4_b ( .a(wdata), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .c({imm, funct}), .d({funct, 1'b0, 1'b0}), .sel(alusrcb), .y(aluin2) );
  alu alu ( .a(aluin1), .b(aluin2), .alucont(alucont), .aluout(aluout), .zero(
        zero) );
  flop_0 aluout_ff ( .clk(n4), .reset(reset), .d(aluout), .q(aluout_flop) );
  mux3 mux3_pc ( .a(aluout), .b(aluout_flop), .c({funct, 1'b0, 1'b0}), .sel(
        pcsource), .y(pcnext) );
  INVX2 U19 ( .A(irwrite[2]), .Y(n8) );
  INVX2 U30 ( .A(irwrite[3]), .Y(n14) );
  INVX2 U47 ( .A(n1), .Y(n2) );
  INVX2 U50 ( .A(irwrite[0]), .Y(n10) );
  BUFX2 U53 ( .A(clk), .Y(n4) );
  INVX2 U56 ( .A(irwrite[1]), .Y(n12) );
  INVX2 U59 ( .A(clk), .Y(n1) );
  BUFX4 U62 ( .A(clk), .Y(n6) );
  INVX2 U65 ( .A(memdata[7]), .Y(n16) );
  INVX2 U68 ( .A(memdata[6]), .Y(n18) );
  INVX2 U71 ( .A(memdata[5]), .Y(n24) );
  INVX2 U72 ( .A(memdata[4]), .Y(n33) );
  INVX2 U73 ( .A(memdata[3]), .Y(n71) );
  INVX2 U74 ( .A(memdata[2]), .Y(n72) );
  INVX2 U75 ( .A(memdata[1]), .Y(n73) );
  INVX2 U76 ( .A(memdata[0]), .Y(n74) );
endmodule


module alucontrol ( aluop, funct, alucont );
  input [1:0] aluop;
  input [5:0] funct;
  output [2:0] alucont;
  wire   n3, n4, n5, n1;

  INVX2 U3 ( .A(n5), .Y(alucont[0]) );
  OAI21X1 U5 ( .A(n3), .B(n1), .C(n4), .Y(alucont[2]) );
  NAND2X1 U6 ( .A(aluop[0]), .B(n1), .Y(n4) );
  NAND3X1 U7 ( .A(funct[2]), .B(aluop[1]), .C(n3), .Y(alucont[1]) );
  NOR2X1 U8 ( .A(funct[3]), .B(funct[1]), .Y(n3) );
  OAI21X1 U9 ( .A(funct[0]), .B(funct[3]), .C(aluop[1]), .Y(n5) );
  INVX2 U4 ( .A(aluop[1]), .Y(n1) );
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
  wire   n9, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n4, n6, n7, n8, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21;
  wire   [3:0] state;
  wire   [3:0] nextstate;

  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(1'b1), .S(n21), .Q(
        state[0]) );
  DFFSR \state_reg[3]  ( .D(nextstate[3]), .CLK(clk), .R(n21), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n21), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(nextstate[2]), .CLK(clk), .R(n21), .S(1'b1), .Q(
        state[2]) );
  INVX2 U8 ( .A(n26), .Y(pcsource[1]) );
  INVX2 U9 ( .A(n51), .Y(memtoreg) );
  INVX2 U10 ( .A(n53), .Y(irwrite[3]) );
  INVX2 U11 ( .A(n55), .Y(branch) );
  INVX2 U12 ( .A(n43), .Y(irwrite[1]) );
  INVX2 U16 ( .A(n28), .Y(n9) );
  INVX2 U17 ( .A(n55), .Y(pcsource[0]) );
  OR2X1 U32 ( .A(regdst), .B(memtoreg), .Y(regwrite) );
  NOR2X1 U33 ( .A(n14), .B(n25), .Y(regdst) );
  NAND2X1 U34 ( .A(n8), .B(n26), .Y(pcwrite) );
  NAND3X1 U35 ( .A(state[3]), .B(n14), .C(n27), .Y(n26) );
  NOR2X1 U36 ( .A(n4), .B(n15), .Y(n27) );
  NAND3X1 U37 ( .A(n28), .B(n29), .C(n30), .Y(nextstate[3]) );
  AOI22X1 U38 ( .A(n31), .B(op[3]), .C(n32), .D(n33), .Y(n30) );
  AOI21X1 U39 ( .A(op[1]), .B(op[3]), .C(op[5]), .Y(n32) );
  NOR2X1 U40 ( .A(n34), .B(n35), .Y(n31) );
  NAND3X1 U41 ( .A(n11), .B(n36), .C(n37), .Y(nextstate[2]) );
  AOI21X1 U42 ( .A(n33), .B(n38), .C(irwrite[3]), .Y(n37) );
  OAI21X1 U43 ( .A(op[1]), .B(n19), .C(n39), .Y(n38) );
  NAND3X1 U44 ( .A(n19), .B(n16), .C(op[1]), .Y(n39) );
  OR2X1 U45 ( .A(n40), .B(n41), .Y(nextstate[1]) );
  OAI21X1 U46 ( .A(n7), .B(n42), .C(n28), .Y(n41) );
  NAND2X1 U47 ( .A(n20), .B(n19), .Y(n42) );
  NAND3X1 U48 ( .A(n12), .B(n36), .C(n43), .Y(n40) );
  NAND2X1 U49 ( .A(n17), .B(n44), .Y(n36) );
  OAI21X1 U50 ( .A(op[3]), .B(n34), .C(n45), .Y(n44) );
  NAND3X1 U51 ( .A(n46), .B(n20), .C(op[5]), .Y(n35) );
  OR2X1 U52 ( .A(n47), .B(n48), .Y(nextstate[0]) );
  OAI21X1 U53 ( .A(n46), .B(n45), .C(state[0]), .Y(n48) );
  OAI21X1 U54 ( .A(n49), .B(n7), .C(n13), .Y(n47) );
  NOR2X1 U55 ( .A(n45), .B(n18), .Y(n33) );
  NOR2X1 U56 ( .A(op[0]), .B(n50), .Y(n46) );
  OR2X1 U57 ( .A(op[4]), .B(op[2]), .Y(n50) );
  AOI22X1 U58 ( .A(op[1]), .B(op[5]), .C(op[3]), .D(n16), .Y(n49) );
  NAND3X1 U59 ( .A(n52), .B(n14), .C(state[3]), .Y(n51) );
  NAND2X1 U60 ( .A(n6), .B(n29), .Y(iord) );
  NAND3X1 U61 ( .A(state[2]), .B(state[1]), .C(n54), .Y(n29) );
  NOR2X1 U62 ( .A(state[3]), .B(n4), .Y(n54) );
  NOR2X1 U63 ( .A(n25), .B(state[1]), .Y(memwrite) );
  NAND3X1 U64 ( .A(state[3]), .B(n15), .C(state[0]), .Y(n25) );
  NAND2X1 U65 ( .A(n45), .B(n34), .Y(alusrcb[1]) );
  NAND2X1 U66 ( .A(n8), .B(n45), .Y(alusrcb[0]) );
  NAND3X1 U67 ( .A(state[2]), .B(state[0]), .C(n56), .Y(n45) );
  NOR2X1 U68 ( .A(state[3]), .B(state[1]), .Y(n56) );
  NAND3X1 U69 ( .A(n53), .B(n11), .C(n58), .Y(n57) );
  NOR2X1 U70 ( .A(irwrite[0]), .B(irwrite[1]), .Y(n58) );
  NAND3X1 U71 ( .A(n52), .B(n13), .C(state[1]), .Y(n43) );
  NOR2X1 U72 ( .A(n59), .B(state[1]), .Y(irwrite[0]) );
  NOR2X1 U73 ( .A(n59), .B(n14), .Y(irwrite[2]) );
  NAND3X1 U74 ( .A(n15), .B(n13), .C(state[0]), .Y(n59) );
  NAND3X1 U75 ( .A(n14), .B(n13), .C(n60), .Y(n53) );
  NAND3X1 U76 ( .A(n34), .B(n55), .C(n28), .Y(alusrca) );
  NAND3X1 U77 ( .A(state[3]), .B(n52), .C(state[1]), .Y(n28) );
  NOR2X1 U78 ( .A(state[2]), .B(state[0]), .Y(n52) );
  NAND3X1 U79 ( .A(state[3]), .B(n14), .C(n60), .Y(n55) );
  NAND3X1 U80 ( .A(state[1]), .B(n13), .C(n60), .Y(n34) );
  NOR2X1 U81 ( .A(n15), .B(state[0]), .Y(n60) );
  alucontrol alucontt ( .aluop({n9, pcsource[0]}), .funct(funct), .alucont(
        alucont) );
  INVX2 U6 ( .A(state[0]), .Y(n4) );
  INVX2 U13 ( .A(memwrite), .Y(n6) );
  INVX2 U14 ( .A(n33), .Y(n7) );
  INVX2 U15 ( .A(n57), .Y(n8) );
  INVX2 U18 ( .A(irwrite[2]), .Y(n11) );
  INVX2 U19 ( .A(irwrite[0]), .Y(n12) );
  INVX2 U20 ( .A(state[3]), .Y(n13) );
  INVX2 U21 ( .A(state[1]), .Y(n14) );
  INVX2 U22 ( .A(state[2]), .Y(n15) );
  INVX2 U23 ( .A(op[5]), .Y(n16) );
  INVX2 U24 ( .A(n35), .Y(n17) );
  INVX2 U25 ( .A(n46), .Y(n18) );
  INVX2 U26 ( .A(op[3]), .Y(n19) );
  INVX2 U27 ( .A(op[1]), .Y(n20) );
  INVX2 U28 ( .A(reset), .Y(n21) );
endmodule


module mini_mips_test_design ( clk, reset, memdata, memwrite, adr, writedata
 );
  input [7:0] memdata;
  output [7:0] adr;
  output [7:0] writedata;
  input clk, reset;
  output memwrite;
  wire   iord, regdst, memtoreg, regwrite, alusrca, zero, branch, pcwrite, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;
  wire   [3:0] irwrite;
  wire   [1:0] alusrcb;
  wire   [2:0] alucont;
  wire   [1:0] pcsource;
  wire   [5:0] op;
  wire   [5:0] funct;

  INVX2 U1 ( .A(n2), .Y(n1) );
  AOI21X1 U2 ( .A(zero), .B(branch), .C(pcwrite), .Y(n2) );
  datapath_test_design dp ( .clk(n21), .reset(n20), .pcen(n1), .iord(iord), 
        .irwrite(irwrite), .regdst(regdst), .memtoreg(memtoreg), .regwrite(
        regwrite), .alusrca(alusrca), .alusrcb(alusrcb), .alucont(alucont), 
        .pcsource(pcsource), .memdata({n18, n16, n14, n12, n10, n8, n6, n4}), 
        .op(op), .funct(funct), .zero(zero), .addr(adr), .wdata(writedata) );
  controller cont ( .clk(n21), .reset(n20), .op(op), .funct(funct), .alusrca(
        alusrca), .alusrcb(alusrcb), .branch(branch), .iord(iord), .irwrite(
        irwrite), .memwrite(memwrite), .memtoreg(memtoreg), .pcwrite(pcwrite), 
        .pcsource(pcsource), .regwrite(regwrite), .regdst(regdst), .alucont(
        alucont) );
  INVX2 U3 ( .A(memdata[0]), .Y(n3) );
  INVX2 U4 ( .A(n3), .Y(n4) );
  INVX2 U5 ( .A(memdata[1]), .Y(n5) );
  INVX2 U6 ( .A(n5), .Y(n6) );
  INVX2 U7 ( .A(memdata[2]), .Y(n7) );
  INVX2 U8 ( .A(n7), .Y(n8) );
  INVX2 U9 ( .A(memdata[3]), .Y(n9) );
  INVX2 U10 ( .A(n9), .Y(n10) );
  INVX2 U11 ( .A(memdata[4]), .Y(n11) );
  INVX2 U12 ( .A(n11), .Y(n12) );
  INVX2 U13 ( .A(memdata[5]), .Y(n13) );
  INVX2 U14 ( .A(n13), .Y(n14) );
  INVX2 U15 ( .A(memdata[6]), .Y(n15) );
  INVX2 U16 ( .A(n15), .Y(n16) );
  INVX2 U17 ( .A(memdata[7]), .Y(n17) );
  INVX2 U18 ( .A(n17), .Y(n18) );
  INVX2 U19 ( .A(reset), .Y(n19) );
  INVX2 U20 ( .A(n19), .Y(n20) );
  INVX2 U21 ( .A(n22), .Y(n21) );
  INVX2 U22 ( .A(clk), .Y(n22) );
endmodule

