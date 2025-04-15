/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Apr 15 13:25:52 2025
/////////////////////////////////////////////////////////////


module flop_en ( clk, reset, en, d, q );
  input [7:0] d;
  output [7:0] q;
  input clk, reset, en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19;

  DFFPOSX1 \q_reg[7]  ( .D(n12), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 \q_reg[6]  ( .D(n13), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 \q_reg[5]  ( .D(n14), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 \q_reg[4]  ( .D(n15), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 \q_reg[3]  ( .D(n16), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 \q_reg[2]  ( .D(n17), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 \q_reg[1]  ( .D(n18), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 \q_reg[0]  ( .D(n19), .CLK(clk), .Q(q[0]) );
  INVX1 U3 ( .A(n1), .Y(n12) );
  AOI22X1 U4 ( .A(q[7]), .B(n2), .C(d[7]), .D(n3), .Y(n1) );
  INVX1 U5 ( .A(n4), .Y(n13) );
  AOI22X1 U6 ( .A(q[6]), .B(n2), .C(d[6]), .D(n3), .Y(n4) );
  INVX1 U7 ( .A(n5), .Y(n14) );
  AOI22X1 U8 ( .A(q[5]), .B(n2), .C(d[5]), .D(n3), .Y(n5) );
  INVX1 U9 ( .A(n6), .Y(n15) );
  AOI22X1 U10 ( .A(q[4]), .B(n2), .C(d[4]), .D(n3), .Y(n6) );
  INVX1 U11 ( .A(n7), .Y(n16) );
  AOI22X1 U12 ( .A(q[3]), .B(n2), .C(d[3]), .D(n3), .Y(n7) );
  INVX1 U13 ( .A(n8), .Y(n17) );
  AOI22X1 U14 ( .A(q[2]), .B(n2), .C(d[2]), .D(n3), .Y(n8) );
  INVX1 U15 ( .A(n9), .Y(n18) );
  AOI22X1 U16 ( .A(q[1]), .B(n2), .C(d[1]), .D(n3), .Y(n9) );
  INVX1 U17 ( .A(n10), .Y(n19) );
  AOI22X1 U18 ( .A(q[0]), .B(n2), .C(d[0]), .D(n3), .Y(n10) );
  NOR2X1 U19 ( .A(n3), .B(reset), .Y(n2) );
  NOR2X1 U20 ( .A(n11), .B(reset), .Y(n3) );
  INVX1 U21 ( .A(en), .Y(n11) );
endmodule


module mux2_2 ( a, b, sel, y );
  input [7:0] a;
  input [7:0] b;
  output [7:0] y;
  input sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  INVX1 U1 ( .A(n1), .Y(y[7]) );
  MUX2X1 U2 ( .B(a[7]), .A(b[7]), .S(sel), .Y(n1) );
  INVX1 U3 ( .A(n2), .Y(y[6]) );
  MUX2X1 U4 ( .B(a[6]), .A(b[6]), .S(sel), .Y(n2) );
  INVX1 U5 ( .A(n3), .Y(y[5]) );
  MUX2X1 U6 ( .B(a[5]), .A(b[5]), .S(sel), .Y(n3) );
  INVX1 U7 ( .A(n4), .Y(y[4]) );
  MUX2X1 U8 ( .B(a[4]), .A(b[4]), .S(sel), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(y[3]) );
  MUX2X1 U10 ( .B(a[3]), .A(b[3]), .S(sel), .Y(n5) );
  INVX1 U11 ( .A(n6), .Y(y[2]) );
  MUX2X1 U12 ( .B(a[2]), .A(b[2]), .S(sel), .Y(n6) );
  INVX1 U13 ( .A(n7), .Y(y[1]) );
  MUX2X1 U14 ( .B(a[1]), .A(b[1]), .S(sel), .Y(n7) );
  INVX1 U15 ( .A(n8), .Y(y[0]) );
  MUX2X1 U16 ( .B(a[0]), .A(b[0]), .S(sel), .Y(n8) );
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
  INVX2 U3 ( .A(n2), .Y(n1) );
  INVX2 U4 ( .A(clk), .Y(n2) );
  AND2X1 U5 ( .A(d[6]), .B(n3), .Y(N9) );
  AND2X1 U6 ( .A(d[5]), .B(n3), .Y(N8) );
  AND2X1 U7 ( .A(d[4]), .B(n3), .Y(N7) );
  AND2X1 U8 ( .A(d[3]), .B(n3), .Y(N6) );
  AND2X1 U9 ( .A(d[2]), .B(n3), .Y(N5) );
  AND2X1 U10 ( .A(d[1]), .B(n3), .Y(N4) );
  AND2X1 U11 ( .A(d[0]), .B(n3), .Y(N3) );
  AND2X1 U12 ( .A(d[7]), .B(n3), .Y(N10) );
  INVX1 U13 ( .A(reset), .Y(n3) );
endmodule


module mux2_DATA_WIDTH5 ( a, b, sel, y );
  input [4:0] a;
  input [4:0] b;
  output [4:0] y;
  input sel;
  wire   n1, n2, n3, n4, n5;

  INVX1 U1 ( .A(n1), .Y(y[4]) );
  MUX2X1 U2 ( .B(a[4]), .A(b[4]), .S(sel), .Y(n1) );
  INVX1 U3 ( .A(n2), .Y(y[3]) );
  MUX2X1 U4 ( .B(a[3]), .A(b[3]), .S(sel), .Y(n2) );
  INVX1 U5 ( .A(n3), .Y(y[2]) );
  MUX2X1 U6 ( .B(a[2]), .A(b[2]), .S(sel), .Y(n3) );
  INVX1 U7 ( .A(n4), .Y(y[1]) );
  MUX2X1 U8 ( .B(a[1]), .A(b[1]), .S(sel), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(y[0]) );
  MUX2X1 U10 ( .B(a[0]), .A(b[0]), .S(sel), .Y(n5) );
endmodule


module mux2_1 ( a, b, sel, y );
  input [7:0] a;
  input [7:0] b;
  output [7:0] y;
  input sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  INVX1 U1 ( .A(n1), .Y(y[7]) );
  MUX2X1 U2 ( .B(a[7]), .A(b[7]), .S(sel), .Y(n1) );
  INVX1 U3 ( .A(n2), .Y(y[6]) );
  MUX2X1 U4 ( .B(a[6]), .A(b[6]), .S(sel), .Y(n2) );
  INVX1 U5 ( .A(n3), .Y(y[5]) );
  MUX2X1 U6 ( .B(a[5]), .A(b[5]), .S(sel), .Y(n3) );
  INVX1 U7 ( .A(n4), .Y(y[4]) );
  MUX2X1 U8 ( .B(a[4]), .A(b[4]), .S(sel), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(y[3]) );
  MUX2X1 U10 ( .B(a[3]), .A(b[3]), .S(sel), .Y(n5) );
  INVX1 U11 ( .A(n6), .Y(y[2]) );
  MUX2X1 U12 ( .B(a[2]), .A(b[2]), .S(sel), .Y(n6) );
  INVX1 U13 ( .A(n7), .Y(y[1]) );
  MUX2X1 U14 ( .B(a[1]), .A(b[1]), .S(sel), .Y(n7) );
  INVX1 U15 ( .A(n8), .Y(y[0]) );
  MUX2X1 U16 ( .B(a[0]), .A(b[0]), .S(sel), .Y(n8) );
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
         N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n72,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328;
  wire   [7:0] rd1_next;
  wire   [7:0] rd2_next;
  assign N13 = ra1[0];
  assign N14 = ra1[1];
  assign N15 = ra1[2];
  assign N16 = ra2[0];
  assign N17 = ra2[1];
  assign N18 = ra2[2];

  DFFSR \rd1_reg[7]  ( .D(rd1_next[7]), .CLK(n83), .R(n328), .S(1'b1), .Q(
        rd1[7]) );
  DFFSR \rd1_reg[6]  ( .D(rd1_next[6]), .CLK(n82), .R(n328), .S(1'b1), .Q(
        rd1[6]) );
  DFFSR \rd1_reg[5]  ( .D(rd1_next[5]), .CLK(n81), .R(n328), .S(1'b1), .Q(
        rd1[5]) );
  DFFSR \rd1_reg[4]  ( .D(rd1_next[4]), .CLK(n81), .R(n328), .S(1'b1), .Q(
        rd1[4]) );
  DFFSR \rd1_reg[3]  ( .D(rd1_next[3]), .CLK(n80), .R(n328), .S(1'b1), .Q(
        rd1[3]) );
  DFFSR \rd1_reg[2]  ( .D(rd1_next[2]), .CLK(n79), .R(n328), .S(1'b1), .Q(
        rd1[2]) );
  DFFSR \rd1_reg[1]  ( .D(rd1_next[1]), .CLK(n79), .R(n328), .S(1'b1), .Q(
        rd1[1]) );
  DFFSR \rd1_reg[0]  ( .D(rd1_next[0]), .CLK(n83), .R(n328), .S(1'b1), .Q(
        rd1[0]) );
  DFFSR \rd2_reg[7]  ( .D(rd2_next[7]), .CLK(n84), .R(n328), .S(1'b1), .Q(
        rd2[7]) );
  DFFSR \rd2_reg[6]  ( .D(rd2_next[6]), .CLK(n82), .R(n328), .S(1'b1), .Q(
        rd2[6]) );
  DFFSR \rd2_reg[5]  ( .D(rd2_next[5]), .CLK(n81), .R(n328), .S(1'b1), .Q(
        rd2[5]) );
  DFFSR \rd2_reg[4]  ( .D(rd2_next[4]), .CLK(n81), .R(n328), .S(1'b1), .Q(
        rd2[4]) );
  DFFSR \rd2_reg[3]  ( .D(rd2_next[3]), .CLK(n80), .R(n328), .S(1'b1), .Q(
        rd2[3]) );
  DFFSR \rd2_reg[2]  ( .D(rd2_next[2]), .CLK(n79), .R(n328), .S(1'b1), .Q(
        rd2[2]) );
  DFFSR \rd2_reg[1]  ( .D(rd2_next[1]), .CLK(n79), .R(n328), .S(1'b1), .Q(
        rd2[1]) );
  DFFSR \rd2_reg[0]  ( .D(rd2_next[0]), .CLK(n83), .R(n328), .S(1'b1), .Q(
        rd2[0]) );
  DFFSR \REGS_reg[7][7]  ( .D(n219), .CLK(n84), .R(n328), .S(1'b1), .Q(
        \REGS[7][7] ) );
  DFFSR \REGS_reg[7][6]  ( .D(n218), .CLK(n83), .R(n328), .S(1'b1), .Q(
        \REGS[7][6] ) );
  DFFSR \REGS_reg[7][5]  ( .D(n217), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[7][5] ) );
  DFFSR \REGS_reg[7][4]  ( .D(n216), .CLK(n81), .R(n328), .S(1'b1), .Q(
        \REGS[7][4] ) );
  DFFSR \REGS_reg[7][3]  ( .D(n215), .CLK(n81), .R(n328), .S(1'b1), .Q(
        \REGS[7][3] ) );
  DFFSR \REGS_reg[7][2]  ( .D(n214), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[7][2] ) );
  DFFSR \REGS_reg[7][1]  ( .D(n213), .CLK(n79), .R(n328), .S(1'b1), .Q(
        \REGS[7][1] ) );
  DFFSR \REGS_reg[7][0]  ( .D(n212), .CLK(n83), .R(n328), .S(1'b1), .Q(
        \REGS[7][0] ) );
  DFFSR \REGS_reg[6][7]  ( .D(n211), .CLK(n84), .R(n328), .S(1'b1), .Q(
        \REGS[6][7] ) );
  DFFSR \REGS_reg[6][6]  ( .D(n210), .CLK(n83), .R(n328), .S(1'b1), .Q(
        \REGS[6][6] ) );
  DFFSR \REGS_reg[6][5]  ( .D(n209), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[6][5] ) );
  DFFSR \REGS_reg[6][4]  ( .D(n208), .CLK(n81), .R(n328), .S(1'b1), .Q(
        \REGS[6][4] ) );
  DFFSR \REGS_reg[6][3]  ( .D(n207), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[6][3] ) );
  DFFSR \REGS_reg[6][2]  ( .D(n206), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[6][2] ) );
  DFFSR \REGS_reg[6][1]  ( .D(n205), .CLK(n79), .R(n328), .S(1'b1), .Q(
        \REGS[6][1] ) );
  DFFSR \REGS_reg[6][0]  ( .D(n204), .CLK(n83), .R(n328), .S(1'b1), .Q(
        \REGS[6][0] ) );
  DFFSR \REGS_reg[5][7]  ( .D(n203), .CLK(n84), .R(n328), .S(1'b1), .Q(
        \REGS[5][7] ) );
  DFFSR \REGS_reg[5][6]  ( .D(n202), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[5][6] ) );
  DFFSR \REGS_reg[5][5]  ( .D(n201), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[5][5] ) );
  DFFSR \REGS_reg[5][4]  ( .D(n200), .CLK(n81), .R(n328), .S(1'b1), .Q(
        \REGS[5][4] ) );
  DFFSR \REGS_reg[5][3]  ( .D(n199), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[5][3] ) );
  DFFSR \REGS_reg[5][2]  ( .D(n198), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[5][2] ) );
  DFFSR \REGS_reg[5][1]  ( .D(n197), .CLK(n79), .R(n328), .S(1'b1), .Q(
        \REGS[5][1] ) );
  DFFSR \REGS_reg[5][0]  ( .D(n196), .CLK(n83), .R(n328), .S(1'b1), .Q(
        \REGS[5][0] ) );
  DFFSR \REGS_reg[4][7]  ( .D(n195), .CLK(n84), .R(n328), .S(1'b1), .Q(
        \REGS[4][7] ) );
  DFFSR \REGS_reg[4][6]  ( .D(n194), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[4][6] ) );
  DFFSR \REGS_reg[4][5]  ( .D(n193), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[4][5] ) );
  DFFSR \REGS_reg[4][4]  ( .D(n192), .CLK(n81), .R(n328), .S(1'b1), .Q(
        \REGS[4][4] ) );
  DFFSR \REGS_reg[4][3]  ( .D(n191), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[4][3] ) );
  DFFSR \REGS_reg[4][2]  ( .D(n190), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[4][2] ) );
  DFFSR \REGS_reg[4][1]  ( .D(n189), .CLK(n79), .R(n328), .S(1'b1), .Q(
        \REGS[4][1] ) );
  DFFSR \REGS_reg[4][0]  ( .D(n188), .CLK(n83), .R(n328), .S(1'b1), .Q(
        \REGS[4][0] ) );
  DFFSR \REGS_reg[3][7]  ( .D(n187), .CLK(n84), .R(n328), .S(1'b1), .Q(
        \REGS[3][7] ) );
  DFFSR \REGS_reg[3][6]  ( .D(n186), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[3][6] ) );
  DFFSR \REGS_reg[3][5]  ( .D(n185), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[3][5] ) );
  DFFSR \REGS_reg[3][4]  ( .D(n184), .CLK(n81), .R(n328), .S(1'b1), .Q(
        \REGS[3][4] ) );
  DFFSR \REGS_reg[3][3]  ( .D(n183), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[3][3] ) );
  DFFSR \REGS_reg[3][2]  ( .D(n182), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[3][2] ) );
  DFFSR \REGS_reg[3][1]  ( .D(n181), .CLK(n79), .R(n328), .S(1'b1), .Q(
        \REGS[3][1] ) );
  DFFSR \REGS_reg[3][0]  ( .D(n180), .CLK(n83), .R(n328), .S(1'b1), .Q(
        \REGS[3][0] ) );
  DFFSR \REGS_reg[2][7]  ( .D(n179), .CLK(n84), .R(n328), .S(1'b1), .Q(
        \REGS[2][7] ) );
  DFFSR \REGS_reg[2][6]  ( .D(n178), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[2][6] ) );
  DFFSR \REGS_reg[2][5]  ( .D(n177), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[2][5] ) );
  DFFSR \REGS_reg[2][4]  ( .D(n176), .CLK(n81), .R(n328), .S(1'b1), .Q(
        \REGS[2][4] ) );
  DFFSR \REGS_reg[2][3]  ( .D(n175), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[2][3] ) );
  DFFSR \REGS_reg[2][2]  ( .D(n174), .CLK(n79), .R(n328), .S(1'b1), .Q(
        \REGS[2][2] ) );
  DFFSR \REGS_reg[2][1]  ( .D(n173), .CLK(n79), .R(n328), .S(1'b1), .Q(
        \REGS[2][1] ) );
  DFFSR \REGS_reg[2][0]  ( .D(n172), .CLK(n83), .R(n328), .S(1'b1), .Q(
        \REGS[2][0] ) );
  DFFSR \REGS_reg[1][7]  ( .D(n171), .CLK(n83), .R(n328), .S(1'b1), .Q(
        \REGS[1][7] ) );
  DFFSR \REGS_reg[1][6]  ( .D(n170), .CLK(n82), .R(n328), .S(1'b1), .Q(
        \REGS[1][6] ) );
  DFFSR \REGS_reg[1][5]  ( .D(n169), .CLK(n81), .R(n328), .S(1'b1), .Q(
        \REGS[1][5] ) );
  DFFSR \REGS_reg[1][4]  ( .D(n168), .CLK(n81), .R(n328), .S(1'b1), .Q(
        \REGS[1][4] ) );
  DFFSR \REGS_reg[1][3]  ( .D(n167), .CLK(n80), .R(n328), .S(1'b1), .Q(
        \REGS[1][3] ) );
  DFFSR \REGS_reg[1][2]  ( .D(n166), .CLK(n79), .R(n328), .S(1'b1), .Q(
        \REGS[1][2] ) );
  DFFSR \REGS_reg[1][1]  ( .D(n165), .CLK(n79), .R(n328), .S(1'b1), .Q(
        \REGS[1][1] ) );
  DFFSR \REGS_reg[1][0]  ( .D(n164), .CLK(n83), .R(n328), .S(1'b1), .Q(
        \REGS[1][0] ) );
  INVX8 U3 ( .A(reset), .Y(n328) );
  BUFX2 U4 ( .A(n131), .Y(n72) );
  BUFX2 U5 ( .A(n241), .Y(n74) );
  BUFX2 U6 ( .A(n130), .Y(n75) );
  BUFX2 U7 ( .A(n240), .Y(n76) );
  BUFX2 U8 ( .A(n129), .Y(n77) );
  BUFX2 U9 ( .A(n239), .Y(n78) );
  BUFX2 U10 ( .A(clk), .Y(n79) );
  BUFX2 U82 ( .A(clk), .Y(n80) );
  BUFX2 U84 ( .A(clk), .Y(n81) );
  BUFX2 U85 ( .A(clk), .Y(n82) );
  BUFX2 U86 ( .A(clk), .Y(n83) );
  BUFX2 U87 ( .A(clk), .Y(n84) );
  NOR2X1 U88 ( .A(n255), .B(N14), .Y(n130) );
  NOR2X1 U89 ( .A(n255), .B(n138), .Y(n129) );
  AOI22X1 U90 ( .A(\REGS[4][0] ), .B(n75), .C(\REGS[6][0] ), .D(n77), .Y(n86)
         );
  NOR2X1 U91 ( .A(N14), .B(N15), .Y(n132) );
  NOR2X1 U92 ( .A(n138), .B(N15), .Y(n131) );
  AOI21X1 U93 ( .A(n86), .B(n85), .C(N13), .Y(n90) );
  AOI22X1 U94 ( .A(\REGS[5][0] ), .B(n75), .C(\REGS[7][0] ), .D(n77), .Y(n88)
         );
  AOI22X1 U95 ( .A(\REGS[1][0] ), .B(n132), .C(\REGS[3][0] ), .D(n72), .Y(n87)
         );
  AOI21X1 U96 ( .A(n88), .B(n87), .C(n137), .Y(n89) );
  OR2X1 U97 ( .A(n90), .B(n89), .Y(N26) );
  AOI22X1 U98 ( .A(\REGS[4][1] ), .B(n75), .C(\REGS[6][1] ), .D(n77), .Y(n92)
         );
  AOI21X1 U99 ( .A(n92), .B(n91), .C(N13), .Y(n96) );
  AOI22X1 U100 ( .A(\REGS[5][1] ), .B(n75), .C(\REGS[7][1] ), .D(n77), .Y(n94)
         );
  AOI22X1 U101 ( .A(\REGS[1][1] ), .B(n132), .C(\REGS[3][1] ), .D(n72), .Y(n93) );
  AOI21X1 U102 ( .A(n94), .B(n93), .C(n137), .Y(n95) );
  OR2X1 U103 ( .A(n96), .B(n95), .Y(N25) );
  AOI22X1 U104 ( .A(\REGS[4][2] ), .B(n75), .C(\REGS[6][2] ), .D(n77), .Y(n98)
         );
  AOI21X1 U105 ( .A(n98), .B(n97), .C(N13), .Y(n102) );
  AOI22X1 U106 ( .A(\REGS[5][2] ), .B(n75), .C(\REGS[7][2] ), .D(n77), .Y(n100) );
  AOI22X1 U107 ( .A(\REGS[1][2] ), .B(n132), .C(\REGS[3][2] ), .D(n72), .Y(n99) );
  AOI21X1 U108 ( .A(n100), .B(n99), .C(n137), .Y(n101) );
  OR2X1 U109 ( .A(n102), .B(n101), .Y(N24) );
  AOI22X1 U110 ( .A(\REGS[4][3] ), .B(n75), .C(\REGS[6][3] ), .D(n77), .Y(n104) );
  AOI21X1 U111 ( .A(n104), .B(n103), .C(N13), .Y(n108) );
  AOI22X1 U112 ( .A(\REGS[5][3] ), .B(n75), .C(\REGS[7][3] ), .D(n77), .Y(n106) );
  AOI22X1 U113 ( .A(\REGS[1][3] ), .B(n132), .C(\REGS[3][3] ), .D(n72), .Y(
        n105) );
  AOI21X1 U114 ( .A(n106), .B(n105), .C(n137), .Y(n107) );
  OR2X1 U115 ( .A(n108), .B(n107), .Y(N23) );
  AOI22X1 U116 ( .A(\REGS[4][4] ), .B(n75), .C(\REGS[6][4] ), .D(n77), .Y(n110) );
  AOI21X1 U117 ( .A(n110), .B(n109), .C(N13), .Y(n114) );
  AOI22X1 U118 ( .A(\REGS[5][4] ), .B(n75), .C(\REGS[7][4] ), .D(n77), .Y(n112) );
  AOI22X1 U119 ( .A(\REGS[1][4] ), .B(n132), .C(\REGS[3][4] ), .D(n72), .Y(
        n111) );
  AOI21X1 U120 ( .A(n112), .B(n111), .C(n137), .Y(n113) );
  OR2X1 U121 ( .A(n114), .B(n113), .Y(N22) );
  AOI22X1 U122 ( .A(\REGS[4][5] ), .B(n75), .C(\REGS[6][5] ), .D(n77), .Y(n116) );
  AOI21X1 U123 ( .A(n116), .B(n115), .C(N13), .Y(n120) );
  AOI22X1 U124 ( .A(\REGS[5][5] ), .B(n75), .C(\REGS[7][5] ), .D(n77), .Y(n118) );
  AOI22X1 U125 ( .A(\REGS[1][5] ), .B(n132), .C(\REGS[3][5] ), .D(n72), .Y(
        n117) );
  AOI21X1 U126 ( .A(n118), .B(n117), .C(n137), .Y(n119) );
  OR2X1 U127 ( .A(n120), .B(n119), .Y(N21) );
  AOI22X1 U128 ( .A(\REGS[4][6] ), .B(n75), .C(\REGS[6][6] ), .D(n77), .Y(n122) );
  AOI21X1 U129 ( .A(n122), .B(n121), .C(N13), .Y(n126) );
  AOI22X1 U130 ( .A(\REGS[5][6] ), .B(n75), .C(\REGS[7][6] ), .D(n77), .Y(n124) );
  AOI22X1 U131 ( .A(\REGS[1][6] ), .B(n132), .C(\REGS[3][6] ), .D(n72), .Y(
        n123) );
  AOI21X1 U132 ( .A(n124), .B(n123), .C(n137), .Y(n125) );
  OR2X1 U133 ( .A(n126), .B(n125), .Y(N20) );
  AOI22X1 U134 ( .A(\REGS[4][7] ), .B(n75), .C(\REGS[6][7] ), .D(n77), .Y(n128) );
  AOI21X1 U135 ( .A(n128), .B(n127), .C(N13), .Y(n136) );
  AOI22X1 U136 ( .A(\REGS[5][7] ), .B(n75), .C(\REGS[7][7] ), .D(n77), .Y(n134) );
  AOI22X1 U137 ( .A(\REGS[1][7] ), .B(n132), .C(\REGS[3][7] ), .D(n72), .Y(
        n133) );
  AOI21X1 U138 ( .A(n134), .B(n133), .C(n137), .Y(n135) );
  OR2X1 U139 ( .A(n136), .B(n135), .Y(N19) );
  NAND2X1 U140 ( .A(\REGS[2][7] ), .B(n72), .Y(n127) );
  NAND2X1 U141 ( .A(\REGS[2][6] ), .B(n72), .Y(n121) );
  NAND2X1 U142 ( .A(\REGS[2][5] ), .B(n72), .Y(n115) );
  NAND2X1 U143 ( .A(\REGS[2][4] ), .B(n72), .Y(n109) );
  NAND2X1 U144 ( .A(\REGS[2][3] ), .B(n72), .Y(n103) );
  NAND2X1 U145 ( .A(\REGS[2][2] ), .B(n72), .Y(n97) );
  NAND2X1 U146 ( .A(\REGS[2][1] ), .B(n72), .Y(n91) );
  NAND2X1 U147 ( .A(\REGS[2][0] ), .B(n72), .Y(n85) );
  INVX2 U148 ( .A(N13), .Y(n137) );
  INVX2 U149 ( .A(N14), .Y(n138) );
  NOR2X1 U150 ( .A(n251), .B(N17), .Y(n240) );
  NOR2X1 U151 ( .A(n251), .B(n248), .Y(n239) );
  AOI22X1 U152 ( .A(\REGS[4][0] ), .B(n76), .C(\REGS[6][0] ), .D(n78), .Y(n140) );
  NOR2X1 U153 ( .A(N17), .B(N18), .Y(n242) );
  NOR2X1 U154 ( .A(n248), .B(N18), .Y(n241) );
  AOI21X1 U155 ( .A(n140), .B(n139), .C(N16), .Y(n144) );
  AOI22X1 U156 ( .A(\REGS[5][0] ), .B(n76), .C(\REGS[7][0] ), .D(n78), .Y(n142) );
  AOI22X1 U157 ( .A(\REGS[1][0] ), .B(n242), .C(\REGS[3][0] ), .D(n74), .Y(
        n141) );
  AOI21X1 U158 ( .A(n142), .B(n141), .C(n247), .Y(n143) );
  OR2X1 U159 ( .A(n144), .B(n143), .Y(N34) );
  AOI22X1 U160 ( .A(\REGS[4][1] ), .B(n76), .C(\REGS[6][1] ), .D(n78), .Y(n146) );
  AOI21X1 U161 ( .A(n146), .B(n145), .C(N16), .Y(n150) );
  AOI22X1 U162 ( .A(\REGS[5][1] ), .B(n76), .C(\REGS[7][1] ), .D(n78), .Y(n148) );
  AOI22X1 U163 ( .A(\REGS[1][1] ), .B(n242), .C(\REGS[3][1] ), .D(n74), .Y(
        n147) );
  AOI21X1 U164 ( .A(n148), .B(n147), .C(n247), .Y(n149) );
  OR2X1 U165 ( .A(n150), .B(n149), .Y(N33) );
  AOI22X1 U166 ( .A(\REGS[4][2] ), .B(n76), .C(\REGS[6][2] ), .D(n78), .Y(n152) );
  AOI21X1 U167 ( .A(n152), .B(n151), .C(N16), .Y(n156) );
  AOI22X1 U168 ( .A(\REGS[5][2] ), .B(n76), .C(\REGS[7][2] ), .D(n78), .Y(n154) );
  AOI22X1 U169 ( .A(\REGS[1][2] ), .B(n242), .C(\REGS[3][2] ), .D(n74), .Y(
        n153) );
  AOI21X1 U170 ( .A(n154), .B(n153), .C(n247), .Y(n155) );
  OR2X1 U171 ( .A(n156), .B(n155), .Y(N32) );
  AOI22X1 U172 ( .A(\REGS[4][3] ), .B(n76), .C(\REGS[6][3] ), .D(n78), .Y(n158) );
  AOI21X1 U173 ( .A(n158), .B(n157), .C(N16), .Y(n162) );
  AOI22X1 U174 ( .A(\REGS[5][3] ), .B(n76), .C(\REGS[7][3] ), .D(n78), .Y(n160) );
  AOI22X1 U175 ( .A(\REGS[1][3] ), .B(n242), .C(\REGS[3][3] ), .D(n74), .Y(
        n159) );
  AOI21X1 U176 ( .A(n160), .B(n159), .C(n247), .Y(n161) );
  OR2X1 U177 ( .A(n162), .B(n161), .Y(N31) );
  AOI22X1 U178 ( .A(\REGS[4][4] ), .B(n76), .C(\REGS[6][4] ), .D(n78), .Y(n220) );
  AOI21X1 U179 ( .A(n220), .B(n163), .C(N16), .Y(n224) );
  AOI22X1 U180 ( .A(\REGS[5][4] ), .B(n76), .C(\REGS[7][4] ), .D(n78), .Y(n222) );
  AOI22X1 U181 ( .A(\REGS[1][4] ), .B(n242), .C(\REGS[3][4] ), .D(n74), .Y(
        n221) );
  AOI21X1 U182 ( .A(n222), .B(n221), .C(n247), .Y(n223) );
  OR2X1 U183 ( .A(n224), .B(n223), .Y(N30) );
  AOI22X1 U184 ( .A(\REGS[4][5] ), .B(n76), .C(\REGS[6][5] ), .D(n78), .Y(n226) );
  AOI21X1 U185 ( .A(n226), .B(n225), .C(N16), .Y(n230) );
  AOI22X1 U186 ( .A(\REGS[5][5] ), .B(n76), .C(\REGS[7][5] ), .D(n78), .Y(n228) );
  AOI22X1 U187 ( .A(\REGS[1][5] ), .B(n242), .C(\REGS[3][5] ), .D(n74), .Y(
        n227) );
  AOI21X1 U188 ( .A(n228), .B(n227), .C(n247), .Y(n229) );
  OR2X1 U189 ( .A(n230), .B(n229), .Y(N29) );
  AOI22X1 U190 ( .A(\REGS[4][6] ), .B(n76), .C(\REGS[6][6] ), .D(n78), .Y(n232) );
  AOI21X1 U191 ( .A(n232), .B(n231), .C(N16), .Y(n236) );
  AOI22X1 U192 ( .A(\REGS[5][6] ), .B(n76), .C(\REGS[7][6] ), .D(n78), .Y(n234) );
  AOI22X1 U193 ( .A(\REGS[1][6] ), .B(n242), .C(\REGS[3][6] ), .D(n74), .Y(
        n233) );
  AOI21X1 U194 ( .A(n234), .B(n233), .C(n247), .Y(n235) );
  OR2X1 U195 ( .A(n236), .B(n235), .Y(N28) );
  AOI22X1 U196 ( .A(\REGS[4][7] ), .B(n76), .C(\REGS[6][7] ), .D(n78), .Y(n238) );
  AOI21X1 U197 ( .A(n238), .B(n237), .C(N16), .Y(n246) );
  AOI22X1 U198 ( .A(\REGS[5][7] ), .B(n76), .C(\REGS[7][7] ), .D(n78), .Y(n244) );
  AOI22X1 U199 ( .A(\REGS[1][7] ), .B(n242), .C(\REGS[3][7] ), .D(n74), .Y(
        n243) );
  AOI21X1 U200 ( .A(n244), .B(n243), .C(n247), .Y(n245) );
  OR2X1 U201 ( .A(n246), .B(n245), .Y(N27) );
  NAND2X1 U202 ( .A(\REGS[2][7] ), .B(n74), .Y(n237) );
  NAND2X1 U203 ( .A(\REGS[2][6] ), .B(n74), .Y(n231) );
  NAND2X1 U204 ( .A(\REGS[2][5] ), .B(n74), .Y(n225) );
  NAND2X1 U205 ( .A(\REGS[2][4] ), .B(n74), .Y(n163) );
  NAND2X1 U206 ( .A(\REGS[2][3] ), .B(n74), .Y(n157) );
  NAND2X1 U207 ( .A(\REGS[2][2] ), .B(n74), .Y(n151) );
  NAND2X1 U208 ( .A(\REGS[2][1] ), .B(n74), .Y(n145) );
  NAND2X1 U209 ( .A(\REGS[2][0] ), .B(n74), .Y(n139) );
  INVX2 U210 ( .A(N16), .Y(n247) );
  INVX2 U211 ( .A(N17), .Y(n248) );
  AND2X1 U212 ( .A(N27), .B(n249), .Y(rd2_next[7]) );
  AND2X1 U213 ( .A(N28), .B(n249), .Y(rd2_next[6]) );
  AND2X1 U214 ( .A(N29), .B(n249), .Y(rd2_next[5]) );
  AND2X1 U215 ( .A(N30), .B(n249), .Y(rd2_next[4]) );
  AND2X1 U216 ( .A(N31), .B(n249), .Y(rd2_next[3]) );
  AND2X1 U217 ( .A(N32), .B(n249), .Y(rd2_next[2]) );
  AND2X1 U218 ( .A(N33), .B(n249), .Y(rd2_next[1]) );
  AND2X1 U219 ( .A(N34), .B(n249), .Y(rd2_next[0]) );
  NAND3X1 U220 ( .A(n250), .B(n251), .C(n252), .Y(n249) );
  NOR2X1 U221 ( .A(N17), .B(N16), .Y(n252) );
  INVX1 U222 ( .A(N18), .Y(n251) );
  NOR2X1 U223 ( .A(ra2[4]), .B(ra2[3]), .Y(n250) );
  AND2X1 U224 ( .A(N19), .B(n253), .Y(rd1_next[7]) );
  AND2X1 U225 ( .A(N20), .B(n253), .Y(rd1_next[6]) );
  AND2X1 U226 ( .A(N21), .B(n253), .Y(rd1_next[5]) );
  AND2X1 U227 ( .A(N22), .B(n253), .Y(rd1_next[4]) );
  AND2X1 U228 ( .A(N23), .B(n253), .Y(rd1_next[3]) );
  AND2X1 U229 ( .A(N24), .B(n253), .Y(rd1_next[2]) );
  AND2X1 U230 ( .A(N25), .B(n253), .Y(rd1_next[1]) );
  AND2X1 U231 ( .A(N26), .B(n253), .Y(rd1_next[0]) );
  NAND3X1 U232 ( .A(n254), .B(n255), .C(n256), .Y(n253) );
  NOR2X1 U233 ( .A(N14), .B(N13), .Y(n256) );
  INVX1 U234 ( .A(N15), .Y(n255) );
  NOR2X1 U235 ( .A(ra1[4]), .B(ra1[3]), .Y(n254) );
  INVX1 U236 ( .A(n257), .Y(n219) );
  MUX2X1 U237 ( .B(wd[7]), .A(\REGS[7][7] ), .S(n258), .Y(n257) );
  INVX1 U238 ( .A(n259), .Y(n218) );
  MUX2X1 U239 ( .B(wd[6]), .A(\REGS[7][6] ), .S(n258), .Y(n259) );
  INVX1 U240 ( .A(n260), .Y(n217) );
  MUX2X1 U241 ( .B(wd[5]), .A(\REGS[7][5] ), .S(n258), .Y(n260) );
  INVX1 U242 ( .A(n261), .Y(n216) );
  MUX2X1 U243 ( .B(wd[4]), .A(\REGS[7][4] ), .S(n258), .Y(n261) );
  INVX1 U244 ( .A(n262), .Y(n215) );
  MUX2X1 U245 ( .B(wd[3]), .A(\REGS[7][3] ), .S(n258), .Y(n262) );
  INVX1 U246 ( .A(n263), .Y(n214) );
  MUX2X1 U247 ( .B(wd[2]), .A(\REGS[7][2] ), .S(n258), .Y(n263) );
  INVX1 U248 ( .A(n264), .Y(n213) );
  MUX2X1 U249 ( .B(wd[1]), .A(\REGS[7][1] ), .S(n258), .Y(n264) );
  INVX1 U250 ( .A(n265), .Y(n212) );
  MUX2X1 U251 ( .B(wd[0]), .A(\REGS[7][0] ), .S(n258), .Y(n265) );
  NAND3X1 U252 ( .A(wa[0]), .B(n266), .C(wa[1]), .Y(n258) );
  INVX1 U253 ( .A(n267), .Y(n211) );
  MUX2X1 U254 ( .B(wd[7]), .A(\REGS[6][7] ), .S(n268), .Y(n267) );
  INVX1 U255 ( .A(n269), .Y(n210) );
  MUX2X1 U256 ( .B(wd[6]), .A(\REGS[6][6] ), .S(n268), .Y(n269) );
  INVX1 U257 ( .A(n270), .Y(n209) );
  MUX2X1 U258 ( .B(wd[5]), .A(\REGS[6][5] ), .S(n268), .Y(n270) );
  INVX1 U259 ( .A(n271), .Y(n208) );
  MUX2X1 U260 ( .B(wd[4]), .A(\REGS[6][4] ), .S(n268), .Y(n271) );
  INVX1 U261 ( .A(n272), .Y(n207) );
  MUX2X1 U262 ( .B(wd[3]), .A(\REGS[6][3] ), .S(n268), .Y(n272) );
  INVX1 U263 ( .A(n273), .Y(n206) );
  MUX2X1 U264 ( .B(wd[2]), .A(\REGS[6][2] ), .S(n268), .Y(n273) );
  INVX1 U265 ( .A(n274), .Y(n205) );
  MUX2X1 U266 ( .B(wd[1]), .A(\REGS[6][1] ), .S(n268), .Y(n274) );
  INVX1 U267 ( .A(n275), .Y(n204) );
  MUX2X1 U268 ( .B(wd[0]), .A(\REGS[6][0] ), .S(n268), .Y(n275) );
  NAND3X1 U269 ( .A(n266), .B(n276), .C(wa[1]), .Y(n268) );
  INVX1 U270 ( .A(n277), .Y(n203) );
  MUX2X1 U271 ( .B(wd[7]), .A(\REGS[5][7] ), .S(n278), .Y(n277) );
  INVX1 U272 ( .A(n279), .Y(n202) );
  MUX2X1 U273 ( .B(wd[6]), .A(\REGS[5][6] ), .S(n278), .Y(n279) );
  INVX1 U274 ( .A(n280), .Y(n201) );
  MUX2X1 U275 ( .B(wd[5]), .A(\REGS[5][5] ), .S(n278), .Y(n280) );
  INVX1 U276 ( .A(n281), .Y(n200) );
  MUX2X1 U277 ( .B(wd[4]), .A(\REGS[5][4] ), .S(n278), .Y(n281) );
  INVX1 U278 ( .A(n282), .Y(n199) );
  MUX2X1 U279 ( .B(wd[3]), .A(\REGS[5][3] ), .S(n278), .Y(n282) );
  INVX1 U280 ( .A(n283), .Y(n198) );
  MUX2X1 U281 ( .B(wd[2]), .A(\REGS[5][2] ), .S(n278), .Y(n283) );
  INVX1 U282 ( .A(n284), .Y(n197) );
  MUX2X1 U283 ( .B(wd[1]), .A(\REGS[5][1] ), .S(n278), .Y(n284) );
  INVX1 U284 ( .A(n285), .Y(n196) );
  MUX2X1 U285 ( .B(wd[0]), .A(\REGS[5][0] ), .S(n278), .Y(n285) );
  NAND3X1 U286 ( .A(n266), .B(n286), .C(wa[0]), .Y(n278) );
  INVX1 U287 ( .A(n287), .Y(n195) );
  MUX2X1 U288 ( .B(wd[7]), .A(\REGS[4][7] ), .S(n288), .Y(n287) );
  INVX1 U289 ( .A(n289), .Y(n194) );
  MUX2X1 U290 ( .B(wd[6]), .A(\REGS[4][6] ), .S(n288), .Y(n289) );
  INVX1 U291 ( .A(n290), .Y(n193) );
  MUX2X1 U292 ( .B(wd[5]), .A(\REGS[4][5] ), .S(n288), .Y(n290) );
  INVX1 U293 ( .A(n291), .Y(n192) );
  MUX2X1 U294 ( .B(wd[4]), .A(\REGS[4][4] ), .S(n288), .Y(n291) );
  INVX1 U295 ( .A(n292), .Y(n191) );
  MUX2X1 U296 ( .B(wd[3]), .A(\REGS[4][3] ), .S(n288), .Y(n292) );
  INVX1 U297 ( .A(n293), .Y(n190) );
  MUX2X1 U298 ( .B(wd[2]), .A(\REGS[4][2] ), .S(n288), .Y(n293) );
  INVX1 U299 ( .A(n294), .Y(n189) );
  MUX2X1 U300 ( .B(wd[1]), .A(\REGS[4][1] ), .S(n288), .Y(n294) );
  INVX1 U301 ( .A(n295), .Y(n188) );
  MUX2X1 U302 ( .B(wd[0]), .A(\REGS[4][0] ), .S(n288), .Y(n295) );
  NAND3X1 U303 ( .A(n276), .B(n286), .C(n266), .Y(n288) );
  NOR2X1 U304 ( .A(n296), .B(n297), .Y(n266) );
  INVX1 U305 ( .A(n298), .Y(n187) );
  MUX2X1 U306 ( .B(wd[7]), .A(\REGS[3][7] ), .S(n299), .Y(n298) );
  INVX1 U307 ( .A(n300), .Y(n186) );
  MUX2X1 U308 ( .B(wd[6]), .A(\REGS[3][6] ), .S(n299), .Y(n300) );
  INVX1 U309 ( .A(n301), .Y(n185) );
  MUX2X1 U310 ( .B(wd[5]), .A(\REGS[3][5] ), .S(n299), .Y(n301) );
  INVX1 U311 ( .A(n302), .Y(n184) );
  MUX2X1 U312 ( .B(wd[4]), .A(\REGS[3][4] ), .S(n299), .Y(n302) );
  INVX1 U313 ( .A(n303), .Y(n183) );
  MUX2X1 U314 ( .B(wd[3]), .A(\REGS[3][3] ), .S(n299), .Y(n303) );
  INVX1 U315 ( .A(n304), .Y(n182) );
  MUX2X1 U316 ( .B(wd[2]), .A(\REGS[3][2] ), .S(n299), .Y(n304) );
  INVX1 U317 ( .A(n305), .Y(n181) );
  MUX2X1 U318 ( .B(wd[1]), .A(\REGS[3][1] ), .S(n299), .Y(n305) );
  INVX1 U319 ( .A(n306), .Y(n180) );
  MUX2X1 U320 ( .B(wd[0]), .A(\REGS[3][0] ), .S(n299), .Y(n306) );
  NAND3X1 U321 ( .A(wa[1]), .B(wa[0]), .C(n307), .Y(n299) );
  INVX1 U322 ( .A(n308), .Y(n179) );
  MUX2X1 U323 ( .B(\REGS[2][7] ), .A(wd[7]), .S(n309), .Y(n308) );
  INVX1 U324 ( .A(n310), .Y(n178) );
  MUX2X1 U325 ( .B(\REGS[2][6] ), .A(wd[6]), .S(n309), .Y(n310) );
  INVX1 U326 ( .A(n311), .Y(n177) );
  MUX2X1 U327 ( .B(\REGS[2][5] ), .A(wd[5]), .S(n309), .Y(n311) );
  INVX1 U328 ( .A(n312), .Y(n176) );
  MUX2X1 U329 ( .B(\REGS[2][4] ), .A(wd[4]), .S(n309), .Y(n312) );
  INVX1 U330 ( .A(n313), .Y(n175) );
  MUX2X1 U331 ( .B(\REGS[2][3] ), .A(wd[3]), .S(n309), .Y(n313) );
  INVX1 U332 ( .A(n314), .Y(n174) );
  MUX2X1 U333 ( .B(\REGS[2][2] ), .A(wd[2]), .S(n309), .Y(n314) );
  INVX1 U334 ( .A(n315), .Y(n173) );
  MUX2X1 U335 ( .B(\REGS[2][1] ), .A(wd[1]), .S(n309), .Y(n315) );
  INVX1 U336 ( .A(n316), .Y(n172) );
  MUX2X1 U337 ( .B(\REGS[2][0] ), .A(wd[0]), .S(n309), .Y(n316) );
  AND2X1 U338 ( .A(n307), .B(n276), .Y(n309) );
  INVX1 U339 ( .A(wa[0]), .Y(n276) );
  INVX1 U340 ( .A(n317), .Y(n171) );
  MUX2X1 U341 ( .B(\REGS[1][7] ), .A(wd[7]), .S(n318), .Y(n317) );
  INVX1 U342 ( .A(n319), .Y(n170) );
  MUX2X1 U343 ( .B(\REGS[1][6] ), .A(wd[6]), .S(n318), .Y(n319) );
  INVX1 U344 ( .A(n320), .Y(n169) );
  MUX2X1 U345 ( .B(\REGS[1][5] ), .A(wd[5]), .S(n318), .Y(n320) );
  INVX1 U346 ( .A(n321), .Y(n168) );
  MUX2X1 U347 ( .B(\REGS[1][4] ), .A(wd[4]), .S(n318), .Y(n321) );
  INVX1 U348 ( .A(n322), .Y(n167) );
  MUX2X1 U349 ( .B(\REGS[1][3] ), .A(wd[3]), .S(n318), .Y(n322) );
  INVX1 U350 ( .A(n323), .Y(n166) );
  MUX2X1 U351 ( .B(\REGS[1][2] ), .A(wd[2]), .S(n318), .Y(n323) );
  INVX1 U352 ( .A(n324), .Y(n165) );
  MUX2X1 U353 ( .B(\REGS[1][1] ), .A(wd[1]), .S(n318), .Y(n324) );
  INVX1 U354 ( .A(n325), .Y(n164) );
  MUX2X1 U355 ( .B(\REGS[1][0] ), .A(wd[0]), .S(n318), .Y(n325) );
  AND2X1 U356 ( .A(n307), .B(n286), .Y(n318) );
  INVX1 U357 ( .A(wa[1]), .Y(n286) );
  NOR2X1 U358 ( .A(n297), .B(n326), .Y(n307) );
  OAI21X1 U359 ( .A(wa[1]), .B(wa[0]), .C(n296), .Y(n326) );
  INVX1 U360 ( .A(wa[2]), .Y(n296) );
  NAND2X1 U361 ( .A(n327), .B(regwrite), .Y(n297) );
  NOR2X1 U362 ( .A(wa[4]), .B(wa[3]), .Y(n327) );
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
  INVX2 U3 ( .A(n2), .Y(n1) );
  INVX2 U4 ( .A(clk), .Y(n2) );
  AND2X1 U5 ( .A(d[6]), .B(n3), .Y(N9) );
  AND2X1 U6 ( .A(d[5]), .B(n3), .Y(N8) );
  AND2X1 U7 ( .A(d[4]), .B(n3), .Y(N7) );
  AND2X1 U8 ( .A(d[3]), .B(n3), .Y(N6) );
  AND2X1 U9 ( .A(d[2]), .B(n3), .Y(N5) );
  AND2X1 U10 ( .A(d[1]), .B(n3), .Y(N4) );
  AND2X1 U11 ( .A(d[0]), .B(n3), .Y(N3) );
  AND2X1 U12 ( .A(d[7]), .B(n3), .Y(N10) );
  INVX1 U13 ( .A(reset), .Y(n3) );
endmodule


module flop_1 ( clk, reset, d, q );
  input [7:0] d;
  output [7:0] q;
  input clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n1;

  DFFPOSX1 \q_reg[7]  ( .D(N10), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 \q_reg[6]  ( .D(N9), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 \q_reg[5]  ( .D(N8), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 \q_reg[4]  ( .D(N7), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 \q_reg[3]  ( .D(N6), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 \q_reg[2]  ( .D(N5), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 \q_reg[1]  ( .D(N4), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 \q_reg[0]  ( .D(N3), .CLK(clk), .Q(q[0]) );
  AND2X1 U3 ( .A(d[6]), .B(n1), .Y(N9) );
  AND2X1 U4 ( .A(d[5]), .B(n1), .Y(N8) );
  AND2X1 U5 ( .A(d[4]), .B(n1), .Y(N7) );
  AND2X1 U6 ( .A(d[3]), .B(n1), .Y(N6) );
  AND2X1 U7 ( .A(d[2]), .B(n1), .Y(N5) );
  AND2X1 U8 ( .A(d[1]), .B(n1), .Y(N4) );
  AND2X1 U9 ( .A(d[0]), .B(n1), .Y(N3) );
  AND2X1 U10 ( .A(d[7]), .B(n1), .Y(N10) );
  INVX1 U11 ( .A(reset), .Y(n1) );
endmodule


module mux2_0 ( a, b, sel, y );
  input [7:0] a;
  input [7:0] b;
  output [7:0] y;
  input sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  INVX1 U1 ( .A(n1), .Y(y[7]) );
  MUX2X1 U2 ( .B(a[7]), .A(b[7]), .S(sel), .Y(n1) );
  INVX1 U3 ( .A(n2), .Y(y[6]) );
  MUX2X1 U4 ( .B(a[6]), .A(b[6]), .S(sel), .Y(n2) );
  INVX1 U5 ( .A(n3), .Y(y[5]) );
  MUX2X1 U6 ( .B(a[5]), .A(b[5]), .S(sel), .Y(n3) );
  INVX1 U7 ( .A(n4), .Y(y[4]) );
  MUX2X1 U8 ( .B(a[4]), .A(b[4]), .S(sel), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(y[3]) );
  MUX2X1 U10 ( .B(a[3]), .A(b[3]), .S(sel), .Y(n5) );
  INVX1 U11 ( .A(n6), .Y(y[2]) );
  MUX2X1 U12 ( .B(a[2]), .A(b[2]), .S(sel), .Y(n6) );
  INVX1 U13 ( .A(n7), .Y(y[1]) );
  MUX2X1 U14 ( .B(a[1]), .A(b[1]), .S(sel), .Y(n7) );
  INVX1 U15 ( .A(n8), .Y(y[0]) );
  MUX2X1 U16 ( .B(a[0]), .A(b[0]), .S(sel), .Y(n8) );
endmodule


module mux4 ( a, b, c, d, sel, y );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [7:0] d;
  input [1:0] sel;
  output [7:0] y;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;

  NAND2X1 U1 ( .A(n1), .B(n2), .Y(y[7]) );
  AOI22X1 U2 ( .A(c[7]), .B(n3), .C(d[7]), .D(n4), .Y(n2) );
  AOI22X1 U3 ( .A(a[7]), .B(n5), .C(b[7]), .D(n6), .Y(n1) );
  NAND2X1 U4 ( .A(n7), .B(n8), .Y(y[6]) );
  AOI22X1 U5 ( .A(c[6]), .B(n3), .C(d[6]), .D(n4), .Y(n8) );
  AOI22X1 U6 ( .A(a[6]), .B(n5), .C(b[6]), .D(n6), .Y(n7) );
  NAND2X1 U7 ( .A(n9), .B(n10), .Y(y[5]) );
  AOI22X1 U8 ( .A(c[5]), .B(n3), .C(d[5]), .D(n4), .Y(n10) );
  AOI22X1 U9 ( .A(a[5]), .B(n5), .C(b[5]), .D(n6), .Y(n9) );
  NAND2X1 U10 ( .A(n11), .B(n12), .Y(y[4]) );
  AOI22X1 U11 ( .A(c[4]), .B(n3), .C(d[4]), .D(n4), .Y(n12) );
  AOI22X1 U12 ( .A(a[4]), .B(n5), .C(b[4]), .D(n6), .Y(n11) );
  NAND2X1 U13 ( .A(n13), .B(n14), .Y(y[3]) );
  AOI22X1 U14 ( .A(c[3]), .B(n3), .C(d[3]), .D(n4), .Y(n14) );
  AOI22X1 U15 ( .A(a[3]), .B(n5), .C(b[3]), .D(n6), .Y(n13) );
  NAND2X1 U16 ( .A(n15), .B(n16), .Y(y[2]) );
  AOI22X1 U17 ( .A(c[2]), .B(n3), .C(d[2]), .D(n4), .Y(n16) );
  AOI22X1 U18 ( .A(a[2]), .B(n5), .C(b[2]), .D(n6), .Y(n15) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Y(y[1]) );
  AOI22X1 U20 ( .A(c[1]), .B(n3), .C(d[1]), .D(n4), .Y(n18) );
  AOI22X1 U21 ( .A(a[1]), .B(n5), .C(b[1]), .D(n6), .Y(n17) );
  NAND2X1 U22 ( .A(n19), .B(n20), .Y(y[0]) );
  AOI22X1 U23 ( .A(c[0]), .B(n3), .C(d[0]), .D(n4), .Y(n20) );
  AND2X1 U24 ( .A(sel[0]), .B(sel[1]), .Y(n4) );
  AND2X1 U25 ( .A(sel[1]), .B(n21), .Y(n3) );
  AOI22X1 U26 ( .A(a[0]), .B(n5), .C(b[0]), .D(n6), .Y(n19) );
  NOR2X1 U27 ( .A(n21), .B(sel[1]), .Y(n6) );
  INVX1 U28 ( .A(sel[0]), .Y(n21) );
  NOR2X1 U29 ( .A(sel[0]), .B(sel[1]), .Y(n5) );
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
  wire   N53, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38;
  wire   [7:0] b2;
  wire   [7:0] sum;
  assign zero = N53;

  alu_DW01_add_0 add_1_root_add_16_2 ( .A(a), .B(b2), .CI(alucont[2]), .SUM(
        sum) );
  XOR2X1 U2 ( .A(b[7]), .B(alucont[2]), .Y(b2[7]) );
  XOR2X1 U3 ( .A(b[6]), .B(alucont[2]), .Y(b2[6]) );
  XOR2X1 U4 ( .A(b[5]), .B(alucont[2]), .Y(b2[5]) );
  XOR2X1 U5 ( .A(b[4]), .B(alucont[2]), .Y(b2[4]) );
  XOR2X1 U6 ( .A(b[3]), .B(alucont[2]), .Y(b2[3]) );
  XOR2X1 U7 ( .A(b[2]), .B(alucont[2]), .Y(b2[2]) );
  XOR2X1 U8 ( .A(b[1]), .B(alucont[2]), .Y(b2[1]) );
  XOR2X1 U9 ( .A(b[0]), .B(alucont[2]), .Y(b2[0]) );
  NOR2X1 U10 ( .A(n1), .B(n2), .Y(N53) );
  NAND3X1 U11 ( .A(n3), .B(n4), .C(n5), .Y(n2) );
  NOR2X1 U12 ( .A(aluout[3]), .B(aluout[2]), .Y(n5) );
  OAI21X1 U13 ( .A(n6), .B(n7), .C(n8), .Y(aluout[2]) );
  AOI22X1 U14 ( .A(b[2]), .B(n9), .C(sum[2]), .D(n10), .Y(n8) );
  OAI21X1 U15 ( .A(alucont[1]), .B(n7), .C(n6), .Y(n9) );
  INVX1 U16 ( .A(a[2]), .Y(n7) );
  OAI21X1 U17 ( .A(n6), .B(n11), .C(n12), .Y(aluout[3]) );
  AOI22X1 U18 ( .A(b[3]), .B(n13), .C(sum[3]), .D(n10), .Y(n12) );
  OAI21X1 U19 ( .A(alucont[1]), .B(n11), .C(n6), .Y(n13) );
  INVX1 U20 ( .A(a[3]), .Y(n11) );
  INVX1 U21 ( .A(aluout[1]), .Y(n4) );
  OAI21X1 U22 ( .A(n6), .B(n14), .C(n15), .Y(aluout[1]) );
  AOI22X1 U23 ( .A(b[1]), .B(n16), .C(sum[1]), .D(n10), .Y(n15) );
  OAI21X1 U24 ( .A(alucont[1]), .B(n14), .C(n6), .Y(n16) );
  INVX1 U25 ( .A(a[1]), .Y(n14) );
  INVX1 U26 ( .A(aluout[0]), .Y(n3) );
  NAND2X1 U27 ( .A(n17), .B(n18), .Y(aluout[0]) );
  AOI22X1 U28 ( .A(n19), .B(sum[7]), .C(b[0]), .D(n20), .Y(n18) );
  OAI21X1 U29 ( .A(alucont[1]), .B(n21), .C(n6), .Y(n20) );
  INVX1 U30 ( .A(a[0]), .Y(n21) );
  AND2X1 U31 ( .A(alucont[0]), .B(alucont[1]), .Y(n19) );
  AOI22X1 U32 ( .A(sum[0]), .B(n10), .C(a[0]), .D(n22), .Y(n17) );
  INVX1 U33 ( .A(n6), .Y(n22) );
  NAND3X1 U34 ( .A(n23), .B(n24), .C(n25), .Y(n1) );
  NOR2X1 U35 ( .A(aluout[7]), .B(aluout[6]), .Y(n25) );
  OAI21X1 U36 ( .A(n6), .B(n26), .C(n27), .Y(aluout[6]) );
  AOI22X1 U37 ( .A(b[6]), .B(n28), .C(sum[6]), .D(n10), .Y(n27) );
  OAI21X1 U38 ( .A(alucont[1]), .B(n26), .C(n6), .Y(n28) );
  INVX1 U39 ( .A(a[6]), .Y(n26) );
  OAI21X1 U40 ( .A(n29), .B(n6), .C(n30), .Y(aluout[7]) );
  AOI22X1 U41 ( .A(b[7]), .B(n31), .C(sum[7]), .D(n10), .Y(n30) );
  OAI21X1 U42 ( .A(alucont[1]), .B(n29), .C(n6), .Y(n31) );
  INVX1 U43 ( .A(a[7]), .Y(n29) );
  INVX1 U44 ( .A(aluout[5]), .Y(n24) );
  OAI21X1 U45 ( .A(n6), .B(n32), .C(n33), .Y(aluout[5]) );
  AOI22X1 U46 ( .A(b[5]), .B(n34), .C(sum[5]), .D(n10), .Y(n33) );
  OAI21X1 U47 ( .A(alucont[1]), .B(n32), .C(n6), .Y(n34) );
  INVX1 U48 ( .A(a[5]), .Y(n32) );
  INVX1 U49 ( .A(aluout[4]), .Y(n23) );
  OAI21X1 U50 ( .A(n6), .B(n35), .C(n36), .Y(aluout[4]) );
  AOI22X1 U51 ( .A(b[4]), .B(n37), .C(sum[4]), .D(n10), .Y(n36) );
  NOR2X1 U52 ( .A(n38), .B(alucont[0]), .Y(n10) );
  OAI21X1 U53 ( .A(alucont[1]), .B(n35), .C(n6), .Y(n37) );
  INVX1 U54 ( .A(a[4]), .Y(n35) );
  NAND2X1 U55 ( .A(alucont[0]), .B(n38), .Y(n6) );
  INVX1 U56 ( .A(alucont[1]), .Y(n38) );
endmodule


module flop_0 ( clk, reset, d, q );
  input [7:0] d;
  output [7:0] q;
  input clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, n1;

  DFFPOSX1 \q_reg[7]  ( .D(N10), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 \q_reg[6]  ( .D(N9), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 \q_reg[5]  ( .D(N8), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 \q_reg[4]  ( .D(N7), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 \q_reg[3]  ( .D(N6), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 \q_reg[2]  ( .D(N5), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 \q_reg[1]  ( .D(N4), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 \q_reg[0]  ( .D(N3), .CLK(clk), .Q(q[0]) );
  AND2X1 U3 ( .A(d[6]), .B(n1), .Y(N9) );
  AND2X1 U4 ( .A(d[5]), .B(n1), .Y(N8) );
  AND2X1 U5 ( .A(d[4]), .B(n1), .Y(N7) );
  AND2X1 U6 ( .A(d[3]), .B(n1), .Y(N6) );
  AND2X1 U7 ( .A(d[2]), .B(n1), .Y(N5) );
  AND2X1 U8 ( .A(d[1]), .B(n1), .Y(N4) );
  AND2X1 U9 ( .A(d[0]), .B(n1), .Y(N3) );
  AND2X1 U10 ( .A(d[7]), .B(n1), .Y(N10) );
  INVX1 U11 ( .A(reset), .Y(n1) );
endmodule


module mux3 ( a, b, c, sel, y );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [1:0] sel;
  output [7:0] y;
  wire   N13, N14, N15, N16, N17, N18, N19, N20, N21, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21;

  LATCH \y_reg[7]  ( .CLK(N13), .D(N21), .Q(y[7]) );
  LATCH \y_reg[6]  ( .CLK(N13), .D(N20), .Q(y[6]) );
  LATCH \y_reg[5]  ( .CLK(N13), .D(N19), .Q(y[5]) );
  LATCH \y_reg[4]  ( .CLK(N13), .D(N18), .Q(y[4]) );
  LATCH \y_reg[3]  ( .CLK(N13), .D(N17), .Q(y[3]) );
  LATCH \y_reg[2]  ( .CLK(N13), .D(N16), .Q(y[2]) );
  LATCH \y_reg[1]  ( .CLK(N13), .D(N15), .Q(y[1]) );
  LATCH \y_reg[0]  ( .CLK(N13), .D(N14), .Q(y[0]) );
  OAI21X1 U3 ( .A(n1), .B(n2), .C(n3), .Y(N21) );
  AOI22X1 U4 ( .A(b[7]), .B(n4), .C(c[7]), .D(n5), .Y(n3) );
  INVX1 U5 ( .A(a[7]), .Y(n2) );
  OAI21X1 U6 ( .A(n1), .B(n6), .C(n7), .Y(N20) );
  AOI22X1 U7 ( .A(b[6]), .B(n4), .C(c[6]), .D(n5), .Y(n7) );
  INVX1 U8 ( .A(a[6]), .Y(n6) );
  OAI21X1 U9 ( .A(n1), .B(n8), .C(n9), .Y(N19) );
  AOI22X1 U10 ( .A(b[5]), .B(n4), .C(c[5]), .D(n5), .Y(n9) );
  INVX1 U11 ( .A(a[5]), .Y(n8) );
  OAI21X1 U12 ( .A(n1), .B(n10), .C(n11), .Y(N18) );
  AOI22X1 U13 ( .A(b[4]), .B(n4), .C(c[4]), .D(n5), .Y(n11) );
  INVX1 U14 ( .A(a[4]), .Y(n10) );
  OAI21X1 U15 ( .A(n1), .B(n12), .C(n13), .Y(N17) );
  AOI22X1 U16 ( .A(b[3]), .B(n4), .C(c[3]), .D(n5), .Y(n13) );
  INVX1 U17 ( .A(a[3]), .Y(n12) );
  OAI21X1 U18 ( .A(n1), .B(n14), .C(n15), .Y(N16) );
  AOI22X1 U19 ( .A(b[2]), .B(n4), .C(c[2]), .D(n5), .Y(n15) );
  INVX1 U20 ( .A(a[2]), .Y(n14) );
  OAI21X1 U21 ( .A(n1), .B(n16), .C(n17), .Y(N15) );
  AOI22X1 U22 ( .A(b[1]), .B(n4), .C(c[1]), .D(n5), .Y(n17) );
  INVX1 U23 ( .A(a[1]), .Y(n16) );
  OAI21X1 U24 ( .A(n1), .B(n18), .C(n19), .Y(N14) );
  AOI22X1 U25 ( .A(b[0]), .B(n4), .C(c[0]), .D(n5), .Y(n19) );
  NOR2X1 U26 ( .A(n20), .B(sel[0]), .Y(n5) );
  NOR2X1 U27 ( .A(n21), .B(sel[1]), .Y(n4) );
  INVX1 U28 ( .A(a[0]), .Y(n18) );
  NAND2X1 U29 ( .A(n20), .B(n21), .Y(n1) );
  INVX1 U30 ( .A(sel[0]), .Y(n21) );
  INVX1 U31 ( .A(sel[1]), .Y(n20) );
  NAND2X1 U32 ( .A(sel[1]), .B(sel[0]), .Y(N13) );
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
  wire   n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32;
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

  DFFPOSX1 \instr_reg[31]  ( .D(n70), .CLK(n3), .Q(op[5]) );
  DFFPOSX1 \instr_reg[30]  ( .D(n69), .CLK(n2), .Q(op[4]) );
  DFFPOSX1 \instr_reg[29]  ( .D(n68), .CLK(n2), .Q(op[3]) );
  DFFPOSX1 \instr_reg[28]  ( .D(n67), .CLK(n2), .Q(op[2]) );
  DFFPOSX1 \instr_reg[27]  ( .D(n66), .CLK(n2), .Q(op[1]) );
  DFFPOSX1 \instr_reg[26]  ( .D(n65), .CLK(n2), .Q(op[0]) );
  DFFPOSX1 \instr_reg[25]  ( .D(n64), .CLK(n3), .Q(instr[25]) );
  DFFPOSX1 \instr_reg[24]  ( .D(n63), .CLK(n3), .Q(instr[24]) );
  DFFPOSX1 \instr_reg[23]  ( .D(n62), .CLK(n3), .Q(instr[23]) );
  DFFPOSX1 \instr_reg[22]  ( .D(n61), .CLK(n3), .Q(instr[22]) );
  DFFPOSX1 \instr_reg[21]  ( .D(n60), .CLK(n3), .Q(instr[21]) );
  DFFPOSX1 \instr_reg[20]  ( .D(n59), .CLK(n3), .Q(instr[20]) );
  DFFPOSX1 \instr_reg[19]  ( .D(n58), .CLK(n3), .Q(instr[19]) );
  DFFPOSX1 \instr_reg[18]  ( .D(n57), .CLK(n3), .Q(instr[18]) );
  DFFPOSX1 \instr_reg[17]  ( .D(n56), .CLK(n3), .Q(instr[17]) );
  DFFPOSX1 \instr_reg[16]  ( .D(n55), .CLK(n3), .Q(instr[16]) );
  DFFPOSX1 \instr_reg[15]  ( .D(n54), .CLK(n3), .Q(instr[15]) );
  DFFPOSX1 \instr_reg[14]  ( .D(n53), .CLK(n3), .Q(instr[14]) );
  DFFPOSX1 \instr_reg[13]  ( .D(n52), .CLK(n3), .Q(instr[13]) );
  DFFPOSX1 \instr_reg[12]  ( .D(n51), .CLK(n3), .Q(instr[12]) );
  DFFPOSX1 \instr_reg[11]  ( .D(n50), .CLK(n1), .Q(instr[11]) );
  DFFPOSX1 \instr_reg[7]  ( .D(n49), .CLK(n2), .Q(imm[7]) );
  DFFPOSX1 \instr_reg[6]  ( .D(n48), .CLK(n3), .Q(imm[6]) );
  DFFPOSX1 \instr_reg[5]  ( .D(n47), .CLK(n3), .Q(funct[5]) );
  DFFPOSX1 \instr_reg[4]  ( .D(n46), .CLK(n3), .Q(funct[4]) );
  DFFPOSX1 \instr_reg[3]  ( .D(n45), .CLK(n3), .Q(funct[3]) );
  DFFPOSX1 \instr_reg[2]  ( .D(n44), .CLK(n3), .Q(funct[2]) );
  DFFPOSX1 \instr_reg[1]  ( .D(n43), .CLK(n3), .Q(funct[1]) );
  DFFPOSX1 \instr_reg[0]  ( .D(n42), .CLK(n3), .Q(funct[0]) );
  flop_en pc_flop ( .clk(n2), .reset(reset), .en(pcen), .d(pcnext), .q(pc) );
  mux2_2 mux2_pc ( .a(pc), .b(aluout), .sel(iord), .y(addr) );
  flop_3 memdata_flop ( .clk(n2), .reset(reset), .d(memdata), .q(data) );
  mux2_DATA_WIDTH5 mux2_a3 ( .a(instr[20:16]), .b(instr[15:11]), .sel(regdst), 
        .y(wa) );
  mux2_1 mux2_w3 ( .a(aluout), .b(data), .sel(memtoreg), .y(wd) );
  register_file regfile ( .clk(n2), .reset(reset), .regwrite(regwrite), .ra1(
        instr[25:21]), .ra2(instr[20:16]), .wa(wa), .wd(wd), .rd1(rd1), .rd2(
        rd2) );
  flop_2 rdata1_flop ( .clk(n1), .reset(reset), .d(rd1), .q(a) );
  flop_1 rdata2_flop ( .clk(n1), .reset(reset), .d(rd2), .q(wdata) );
  mux2_0 mux2_a ( .a(pc), .b(a), .sel(alusrca), .y(aluin1) );
  mux4 mux4_b ( .a(wdata), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .c({imm, funct}), .d({funct, 1'b0, 1'b0}), .sel(alusrcb), .y(aluin2) );
  alu alu ( .a(aluin1), .b(aluin2), .alucont(alucont), .aluout(aluout), .zero(
        zero) );
  flop_0 aluout_ff ( .clk(n1), .reset(reset), .d(aluout), .q(aluout_flop) );
  mux3 mux3_pc ( .a(aluout), .b(aluout_flop), .c({funct, 1'b0, 1'b0}), .sel(
        pcsource), .y(pcnext) );
  BUFX2 U3 ( .A(clk), .Y(n2) );
  BUFX2 U4 ( .A(clk), .Y(n1) );
  BUFX4 U5 ( .A(clk), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n70) );
  MUX2X1 U7 ( .B(op[5]), .A(memdata[7]), .S(irwrite[3]), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n69) );
  MUX2X1 U9 ( .B(op[4]), .A(memdata[6]), .S(irwrite[3]), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n68) );
  MUX2X1 U11 ( .B(op[3]), .A(memdata[5]), .S(irwrite[3]), .Y(n6) );
  INVX1 U12 ( .A(n7), .Y(n67) );
  MUX2X1 U13 ( .B(op[2]), .A(memdata[4]), .S(irwrite[3]), .Y(n7) );
  INVX1 U14 ( .A(n8), .Y(n66) );
  MUX2X1 U15 ( .B(op[1]), .A(memdata[3]), .S(irwrite[3]), .Y(n8) );
  INVX1 U16 ( .A(n9), .Y(n65) );
  MUX2X1 U17 ( .B(op[0]), .A(memdata[2]), .S(irwrite[3]), .Y(n9) );
  INVX1 U18 ( .A(n10), .Y(n64) );
  MUX2X1 U19 ( .B(instr[25]), .A(memdata[1]), .S(irwrite[3]), .Y(n10) );
  INVX1 U20 ( .A(n11), .Y(n63) );
  MUX2X1 U21 ( .B(instr[24]), .A(memdata[0]), .S(irwrite[3]), .Y(n11) );
  INVX1 U22 ( .A(n12), .Y(n62) );
  MUX2X1 U23 ( .B(instr[23]), .A(memdata[7]), .S(irwrite[2]), .Y(n12) );
  INVX1 U24 ( .A(n13), .Y(n61) );
  MUX2X1 U25 ( .B(instr[22]), .A(memdata[6]), .S(irwrite[2]), .Y(n13) );
  INVX1 U26 ( .A(n14), .Y(n60) );
  MUX2X1 U27 ( .B(instr[21]), .A(memdata[5]), .S(irwrite[2]), .Y(n14) );
  INVX1 U28 ( .A(n15), .Y(n59) );
  MUX2X1 U29 ( .B(instr[20]), .A(memdata[4]), .S(irwrite[2]), .Y(n15) );
  INVX1 U30 ( .A(n16), .Y(n58) );
  MUX2X1 U31 ( .B(instr[19]), .A(memdata[3]), .S(irwrite[2]), .Y(n16) );
  INVX1 U32 ( .A(n17), .Y(n57) );
  MUX2X1 U33 ( .B(instr[18]), .A(memdata[2]), .S(irwrite[2]), .Y(n17) );
  INVX1 U34 ( .A(n18), .Y(n56) );
  MUX2X1 U35 ( .B(instr[17]), .A(memdata[1]), .S(irwrite[2]), .Y(n18) );
  INVX1 U36 ( .A(n19), .Y(n55) );
  MUX2X1 U37 ( .B(instr[16]), .A(memdata[0]), .S(irwrite[2]), .Y(n19) );
  INVX1 U38 ( .A(n20), .Y(n54) );
  MUX2X1 U39 ( .B(instr[15]), .A(memdata[7]), .S(irwrite[1]), .Y(n20) );
  INVX1 U40 ( .A(n21), .Y(n53) );
  MUX2X1 U41 ( .B(instr[14]), .A(memdata[6]), .S(irwrite[1]), .Y(n21) );
  INVX1 U42 ( .A(n22), .Y(n52) );
  MUX2X1 U43 ( .B(instr[13]), .A(memdata[5]), .S(irwrite[1]), .Y(n22) );
  INVX1 U44 ( .A(n23), .Y(n51) );
  MUX2X1 U45 ( .B(instr[12]), .A(memdata[4]), .S(irwrite[1]), .Y(n23) );
  INVX1 U46 ( .A(n24), .Y(n50) );
  MUX2X1 U47 ( .B(instr[11]), .A(memdata[3]), .S(irwrite[1]), .Y(n24) );
  INVX1 U48 ( .A(n25), .Y(n49) );
  MUX2X1 U49 ( .B(imm[7]), .A(memdata[7]), .S(irwrite[0]), .Y(n25) );
  INVX1 U50 ( .A(n26), .Y(n48) );
  MUX2X1 U51 ( .B(imm[6]), .A(memdata[6]), .S(irwrite[0]), .Y(n26) );
  INVX1 U52 ( .A(n27), .Y(n47) );
  MUX2X1 U53 ( .B(funct[5]), .A(memdata[5]), .S(irwrite[0]), .Y(n27) );
  INVX1 U54 ( .A(n28), .Y(n46) );
  MUX2X1 U55 ( .B(funct[4]), .A(memdata[4]), .S(irwrite[0]), .Y(n28) );
  INVX1 U56 ( .A(n29), .Y(n45) );
  MUX2X1 U57 ( .B(funct[3]), .A(memdata[3]), .S(irwrite[0]), .Y(n29) );
  INVX1 U58 ( .A(n30), .Y(n44) );
  MUX2X1 U59 ( .B(funct[2]), .A(memdata[2]), .S(irwrite[0]), .Y(n30) );
  INVX1 U60 ( .A(n31), .Y(n43) );
  MUX2X1 U61 ( .B(funct[1]), .A(memdata[1]), .S(irwrite[0]), .Y(n31) );
  INVX1 U62 ( .A(n32), .Y(n42) );
  MUX2X1 U63 ( .B(funct[0]), .A(memdata[0]), .S(irwrite[0]), .Y(n32) );
endmodule


module alucontrol ( aluop, funct, alucont );
  input [1:0] aluop;
  input [5:0] funct;
  output [2:0] alucont;
  wire   n5, n2, n3, n4;

  BUFX2 U3 ( .A(n5), .Y(alucont[2]) );
  MUX2X1 U4 ( .B(n2), .A(n3), .S(aluop[1]), .Y(n5) );
  INVX1 U5 ( .A(aluop[0]), .Y(n2) );
  NAND3X1 U6 ( .A(n3), .B(aluop[1]), .C(funct[2]), .Y(alucont[1]) );
  NOR2X1 U7 ( .A(funct[1]), .B(funct[3]), .Y(n3) );
  INVX1 U8 ( .A(n4), .Y(alucont[0]) );
  OAI21X1 U9 ( .A(funct[0]), .B(funct[3]), .C(aluop[1]), .Y(n4) );
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
  wire   n9, n6, n7, n8, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58;
  wire   [3:0] state;
  wire   [3:0] nextstate;

  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(1'b1), .S(n58), .Q(
        state[0]) );
  DFFSR \state_reg[3]  ( .D(nextstate[3]), .CLK(clk), .R(n58), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n58), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(nextstate[2]), .CLK(clk), .R(n58), .S(1'b1), .Q(
        state[2]) );
  alucontrol alucontt ( .aluop({n9, branch}), .funct(funct), .alucont(alucont)
         );
  BUFX2 U6 ( .A(branch), .Y(pcsource[0]) );
  NAND2X1 U8 ( .A(n6), .B(n7), .Y(regwrite) );
  INVX1 U9 ( .A(n6), .Y(regdst) );
  NAND3X1 U10 ( .A(n8), .B(state[3]), .C(state[1]), .Y(n6) );
  NAND2X1 U11 ( .A(n10), .B(n11), .Y(pcwrite) );
  INVX1 U12 ( .A(n11), .Y(pcsource[1]) );
  NAND3X1 U13 ( .A(state[0]), .B(n12), .C(state[2]), .Y(n11) );
  NAND3X1 U14 ( .A(n13), .B(n14), .C(n15), .Y(nextstate[3]) );
  AOI22X1 U15 ( .A(n16), .B(n17), .C(n18), .D(n19), .Y(n15) );
  OAI21X1 U16 ( .A(n20), .B(n21), .C(n22), .Y(n16) );
  NAND2X1 U17 ( .A(op[5]), .B(op[3]), .Y(n21) );
  OR2X1 U18 ( .A(n23), .B(n24), .Y(n20) );
  NAND3X1 U19 ( .A(n25), .B(n26), .C(n27), .Y(nextstate[2]) );
  NOR2X1 U20 ( .A(irwrite[2]), .B(irwrite[3]), .Y(n27) );
  MUX2X1 U21 ( .B(n28), .A(n29), .S(op[3]), .Y(n25) );
  NOR2X1 U22 ( .A(op[1]), .B(n30), .Y(n29) );
  NOR2X1 U23 ( .A(n22), .B(n17), .Y(n28) );
  OR2X1 U24 ( .A(n31), .B(n32), .Y(nextstate[1]) );
  OAI21X1 U25 ( .A(n30), .B(n33), .C(n26), .Y(n32) );
  NAND3X1 U26 ( .A(op[5]), .B(n34), .C(n35), .Y(n26) );
  AOI21X1 U27 ( .A(op[3]), .B(n36), .C(n37), .Y(n35) );
  NAND2X1 U28 ( .A(alusrcb[1]), .B(n17), .Y(n37) );
  NAND2X1 U29 ( .A(n17), .B(n19), .Y(n33) );
  INVX1 U30 ( .A(op[1]), .Y(n17) );
  NAND3X1 U31 ( .A(n38), .B(n39), .C(n13), .Y(n31) );
  OR2X1 U32 ( .A(n40), .B(n41), .Y(nextstate[0]) );
  OAI21X1 U33 ( .A(n34), .B(n36), .C(state[0]), .Y(n41) );
  OAI21X1 U34 ( .A(n19), .B(n22), .C(n42), .Y(n40) );
  AOI21X1 U35 ( .A(n43), .B(op[1]), .C(state[3]), .Y(n42) );
  AND2X1 U36 ( .A(op[5]), .B(n44), .Y(n43) );
  INVX1 U37 ( .A(n18), .Y(n22) );
  NOR2X1 U38 ( .A(n30), .B(op[5]), .Y(n18) );
  INVX1 U39 ( .A(n44), .Y(n30) );
  NOR2X1 U40 ( .A(n36), .B(n23), .Y(n44) );
  INVX1 U41 ( .A(n34), .Y(n23) );
  NOR2X1 U42 ( .A(op[0]), .B(n45), .Y(n34) );
  OR2X1 U43 ( .A(op[4]), .B(op[2]), .Y(n45) );
  INVX1 U44 ( .A(op[3]), .Y(n19) );
  INVX1 U45 ( .A(reset), .Y(n58) );
  INVX1 U46 ( .A(n13), .Y(n9) );
  INVX1 U47 ( .A(n46), .Y(branch) );
  INVX1 U48 ( .A(n47), .Y(memwrite) );
  INVX1 U49 ( .A(n7), .Y(memtoreg) );
  NAND3X1 U50 ( .A(n48), .B(n49), .C(n12), .Y(n7) );
  INVX1 U51 ( .A(n50), .Y(irwrite[2]) );
  INVX1 U52 ( .A(n39), .Y(irwrite[0]) );
  NAND2X1 U53 ( .A(n47), .B(n14), .Y(iord) );
  NAND3X1 U54 ( .A(state[1]), .B(state[0]), .C(n51), .Y(n14) );
  NAND2X1 U55 ( .A(n8), .B(n12), .Y(n47) );
  NAND2X1 U56 ( .A(n24), .B(n36), .Y(alusrcb[1]) );
  NAND2X1 U57 ( .A(n10), .B(n36), .Y(alusrcb[0]) );
  NAND3X1 U58 ( .A(state[0]), .B(n52), .C(n51), .Y(n36) );
  INVX1 U59 ( .A(n53), .Y(n10) );
  NAND3X1 U60 ( .A(n39), .B(n50), .C(n54), .Y(n53) );
  NOR2X1 U61 ( .A(irwrite[3]), .B(irwrite[1]), .Y(n54) );
  INVX1 U62 ( .A(n38), .Y(irwrite[1]) );
  NAND3X1 U63 ( .A(n49), .B(n55), .C(n56), .Y(n38) );
  INVX1 U64 ( .A(n57), .Y(irwrite[3]) );
  NAND3X1 U65 ( .A(n48), .B(n52), .C(n51), .Y(n57) );
  NAND3X1 U66 ( .A(n8), .B(n55), .C(state[1]), .Y(n50) );
  NAND3X1 U67 ( .A(n52), .B(n55), .C(n8), .Y(n39) );
  NOR2X1 U68 ( .A(n48), .B(state[2]), .Y(n8) );
  NAND3X1 U69 ( .A(n13), .B(n46), .C(n24), .Y(alusrca) );
  NAND2X1 U70 ( .A(n56), .B(n51), .Y(n24) );
  NOR2X1 U71 ( .A(n49), .B(state[3]), .Y(n51) );
  NAND3X1 U72 ( .A(n12), .B(n48), .C(state[2]), .Y(n46) );
  INVX1 U73 ( .A(state[0]), .Y(n48) );
  NOR2X1 U74 ( .A(n55), .B(state[1]), .Y(n12) );
  INVX1 U75 ( .A(state[3]), .Y(n55) );
  NAND3X1 U76 ( .A(state[3]), .B(n49), .C(n56), .Y(n13) );
  NOR2X1 U77 ( .A(n52), .B(state[0]), .Y(n56) );
  INVX1 U78 ( .A(state[1]), .Y(n52) );
  INVX1 U79 ( .A(state[2]), .Y(n49) );
endmodule


module mini_mips_test_design ( clk, reset, memdata, memwrite, adr, writedata
 );
  input [7:0] memdata;
  output [7:0] adr;
  output [7:0] writedata;
  input clk, reset;
  output memwrite;
  wire   iord, regdst, memtoreg, regwrite, alusrca, zero, pcwrite, n1, n3;
  wire   [3:0] irwrite;
  wire   [1:0] alusrcb;
  wire   [2:0] alucont;
  wire   [1:0] pcsource;
  wire   [5:0] op;
  wire   [5:0] funct;

  datapath_test_design dp ( .clk(clk), .reset(reset), .pcen(n1), .iord(iord), 
        .irwrite(irwrite), .regdst(regdst), .memtoreg(memtoreg), .regwrite(
        regwrite), .alusrca(alusrca), .alusrcb(alusrcb), .alucont(alucont), 
        .pcsource(pcsource), .memdata(memdata), .op(op), .funct(funct), .zero(
        zero), .addr(adr), .wdata(writedata) );
  controller cont ( .clk(clk), .reset(reset), .op(op), .funct(funct), 
        .alusrca(alusrca), .alusrcb(alusrcb), .iord(iord), .irwrite(irwrite), 
        .memwrite(memwrite), .memtoreg(memtoreg), .pcwrite(pcwrite), 
        .pcsource(pcsource), .regwrite(regwrite), .regdst(regdst), .alucont(
        alucont) );
  INVX1 U3 ( .A(n3), .Y(n1) );
  AOI21X1 U4 ( .A(zero), .B(pcsource[0]), .C(pcwrite), .Y(n3) );
endmodule

