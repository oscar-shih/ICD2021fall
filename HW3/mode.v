`timescale 1ns/1ps

module mode_max (mode, i0, i1, i2, i3, i4);
//DO NOT CHANGE!
	input  [3:0] i0, i1, i2, i3, i4;
	output [3:0] mode;
//---------------------------------------------------
//p0 = 0.427
	wire [15:0] a, b, c, d, e;
	Identifier ID_a(a, i0);
	Identifier ID_b(b, i1);
	Identifier ID_c(c, i2);
	Identifier ID_d(d, i3);
	Identifier ID_e(e, i4);
//p1 = 0.764
	wire [15:0] once;
	Once once_0(once[0], a[0], b[0], c[0], d[0], e[0]);
    Once once_1(once[1], a[1], b[1], c[1], d[1], e[1]);
    Once once_2(once[2], a[2], b[2], c[2], d[2], e[2]);
    Once once_3(once[3], a[3], b[3], c[3], d[3], e[3]);
    Once once_4(once[4], a[4], b[4], c[4], d[4], e[4]);
    Once once_5(once[5], a[5], b[5], c[5], d[5], e[5]);
    Once once_6(once[6], a[6], b[6], c[6], d[6], e[6]);
    Once once_7(once[7], a[7], b[7], c[7], d[7], e[7]);
    Once once_8(once[8], a[8], b[8], c[8], d[8], e[8]);
    Once once_9(once[9], a[9], b[9], c[9], d[9], e[9]);
    Once once_10(once[10], a[10], b[10], c[10], d[10], e[10]);
    Once once_11(once[11], a[11], b[11], c[11], d[11], e[11]);
    Once once_12(once[12], a[12], b[12], c[12], d[12], e[12]);
    Once once_13(once[13], a[13], b[13], c[13], d[13], e[13]);
    Once once_14(once[14], a[14], b[14], c[14], d[14], e[14]);
    Once once_15(once[15], a[15], b[15], c[15], d[15], e[15]);
	

	wire [15:0] once_inv;
	Once_inv once_inv_0 (once_inv[0], a[0], b[0], c[0], d[0], e[0]);
    Once_inv once_inv_1 (once_inv[1], a[1], b[1], c[1], d[1], e[1]);
    Once_inv once_inv_2 (once_inv[2], a[2], b[2], c[2], d[2], e[2]);
    Once_inv once_inv_3 (once_inv[3], a[3], b[3], c[3], d[3], e[3]);
    Once_inv once_inv_4 (once_inv[4], a[4], b[4], c[4], d[4], e[4]);
    Once_inv once_inv_5 (once_inv[5], a[5], b[5], c[5], d[5], e[5]);
    Once_inv once_inv_6 (once_inv[6], a[6], b[6], c[6], d[6], e[6]);
    Once_inv once_inv_7 (once_inv[7], a[7], b[7], c[7], d[7], e[7]);
    Once_inv once_inv_8 (once_inv[8], a[8], b[8], c[8], d[8], e[8]);
    Once_inv once_inv_9 (once_inv[9], a[9], b[9], c[9], d[9], e[9]);
    Once_inv once_inv_10(once_inv[10], a[10], b[10], c[10], d[10], e[10]);
    Once_inv once_inv_11(once_inv[11], a[11], b[11], c[11], d[11], e[11]);
    Once_inv once_inv_12(once_inv[12], a[12], b[12], c[12], d[12], e[12]);
    Once_inv once_inv_13(once_inv[13], a[13], b[13], c[13], d[13], e[13]);
    Once_inv once_inv_14(once_inv[14], a[14], b[14], c[14], d[14], e[14]);
    Once_inv once_inv_15(once_inv[15], a[15], b[15], c[15], d[15], e[15]);

	wire [15:0] twice;
    Twice twice_0(twice[0], a[0], b[0], c[0], d[0], e[0]);
	Twice twice_1(twice[1], a[1], b[1], c[1], d[1], e[1]);
	Twice twice_2(twice[2], a[2], b[2], c[2], d[2], e[2]);
	Twice twice_3(twice[3], a[3], b[3], c[3], d[3], e[3]);
	Twice twice_4(twice[4], a[4], b[4], c[4], d[4], e[4]);
	Twice twice_5(twice[5], a[5], b[5], c[5], d[5], e[5]);
	Twice twice_6(twice[6], a[6], b[6], c[6], d[6], e[6]);
	Twice twice_7(twice[7], a[7], b[7], c[7], d[7], e[7]);
	Twice twice_8(twice[8], a[8], b[8], c[8], d[8], e[8]);
	Twice twice_9(twice[9], a[9], b[9], c[9], d[9], e[9]);
	Twice twice_10(twice[10], a[10], b[10], c[10], d[10], e[10]);
	Twice twice_11(twice[11], a[11], b[11], c[11], d[11], e[11]);
	Twice twice_12(twice[12], a[12], b[12], c[12], d[12], e[12]);
	Twice twice_13(twice[13], a[13], b[13], c[13], d[13], e[13]);
	Twice twice_14(twice[14], a[14], b[14], c[14], d[14], e[14]);
	Twice twice_15(twice[15], a[15], b[15], c[15], d[15], e[15]);

    wire [15:0] twice_inv;
    Twice_inv twice_inv_0(twice_inv[0], a[0], b[0], c[0], d[0], e[0]);
	Twice_inv twice_inv_1(twice_inv[1], a[1], b[1], c[1], d[1], e[1]);
	Twice_inv twice_inv_2(twice_inv[2], a[2], b[2], c[2], d[2], e[2]);
	Twice_inv twice_inv_3(twice_inv[3], a[3], b[3], c[3], d[3], e[3]);
	Twice_inv twice_inv_4(twice_inv[4], a[4], b[4], c[4], d[4], e[4]);
	Twice_inv twice_inv_5(twice_inv[5], a[5], b[5], c[5], d[5], e[5]);
	Twice_inv twice_inv_6(twice_inv[6], a[6], b[6], c[6], d[6], e[6]);
	Twice_inv twice_inv_7(twice_inv[7], a[7], b[7], c[7], d[7], e[7]);
	Twice_inv twice_inv_8(twice_inv[8], a[8], b[8], c[8], d[8], e[8]);
	Twice_inv twice_inv_9(twice_inv[9], a[9], b[9], c[9], d[9], e[9]);
	Twice_inv twice_inv_10(twice_inv[10], a[10], b[10], c[10], d[10], e[10]);
	Twice_inv twice_inv_11(twice_inv[11], a[11], b[11], c[11], d[11], e[11]);
	Twice_inv twice_inv_12(twice_inv[12], a[12], b[12], c[12], d[12], e[12]);
	Twice_inv twice_inv_13(twice_inv[13], a[13], b[13], c[13], d[13], e[13]);
	Twice_inv twice_inv_14(twice_inv[14], a[14], b[14], c[14], d[14], e[14]);
	Twice_inv twice_inv_15(twice_inv[15], a[15], b[15], c[15], d[15], e[15]);

    wire [15:0] three;
    Three_time three_0(three[0], a[0], b[0], c[0], d[0], e[0]);
	Three_time three_1(three[1], a[1], b[1], c[1], d[1], e[1]);
	Three_time three_2(three[2], a[2], b[2], c[2], d[2], e[2]);
	Three_time three_3(three[3], a[3], b[3], c[3], d[3], e[3]);
	Three_time three_4(three[4], a[4], b[4], c[4], d[4], e[4]);
	Three_time three_5(three[5], a[5], b[5], c[5], d[5], e[5]);
	Three_time three_6(three[6], a[6], b[6], c[6], d[6], e[6]);
	Three_time three_7(three[7], a[7], b[7], c[7], d[7], e[7]);
	Three_time three_8(three[8], a[8], b[8], c[8], d[8], e[8]);
	Three_time three_9(three[9], a[9], b[9], c[9], d[9], e[9]);
	Three_time three_10(three[10], a[10], b[10], c[10], d[10], e[10]);
	Three_time three_11(three[11], a[11], b[11], c[11], d[11], e[11]);
	Three_time three_12(three[12], a[12], b[12], c[12], d[12], e[12]);
	Three_time three_13(three[13], a[13], b[13], c[13], d[13], e[13]);
	Three_time three_14(three[14], a[14], b[14], c[14], d[14], e[14]);
	Three_time three_15(three[15], a[15], b[15], c[15], d[15], e[15]);

	wire [15:0] three_inv;
    Three_time_inv three_inv_0(three_inv[0], a[0], b[0], c[0], d[0], e[0]);
	Three_time_inv three_inv_1(three_inv[1], a[1], b[1], c[1], d[1], e[1]);
	Three_time_inv three_inv_2(three_inv[2], a[2], b[2], c[2], d[2], e[2]);
	Three_time_inv three_inv_3(three_inv[3], a[3], b[3], c[3], d[3], e[3]);
	Three_time_inv three_inv_4(three_inv[4], a[4], b[4], c[4], d[4], e[4]);
	Three_time_inv three_inv_5(three_inv[5], a[5], b[5], c[5], d[5], e[5]);
	Three_time_inv three_inv_6(three_inv[6], a[6], b[6], c[6], d[6], e[6]);
	Three_time_inv three_inv_7(three_inv[7], a[7], b[7], c[7], d[7], e[7]);
	Three_time_inv three_inv_8(three_inv[8], a[8], b[8], c[8], d[8], e[8]);
	Three_time_inv three_inv_9(three_inv[9], a[9], b[9], c[9], d[9], e[9]);
	Three_time_inv three_inv_10(three_inv[10], a[10], b[10], c[10], d[10], e[10]);
	Three_time_inv three_inv_11(three_inv[11], a[11], b[11], c[11], d[11], e[11]);
	Three_time_inv three_inv_12(three_inv[12], a[12], b[12], c[12], d[12], e[12]);
	Three_time_inv three_inv_13(three_inv[13], a[13], b[13], c[13], d[13], e[13]);
	Three_time_inv three_inv_14(three_inv[14], a[14], b[14], c[14], d[14], e[14]);
	Three_time_inv three_inv_15(three_inv[15], a[15], b[15], c[15], d[15], e[15]);
//p2 = 1.184
	wire s2, s3, s2_inv, s3_inv;
	S S2(s2, twice_inv);
	S S3(s3, three_inv);
	S_inv S2_inv(s2_inv, twice_inv);
	S_inv S3_inv(s3_inv, three_inv);

	wire [3:0] digit3, digit2, digit1;
	special_decoder D3(digit3, three_inv);
	Decoder D2(digit2, twice, twice_inv);
	Decoder D1(digit1, once, once_inv);
//p3 = 0.452
	new_ans ans3(mode[3], digit3[3], digit2[3], digit1[3], s3, s2, s3_inv, s2_inv);
	new_ans ans2(mode[2], digit3[2], digit2[2], digit1[2], s3, s2, s3_inv, s2_inv);
	new_ans ans1(mode[1], digit3[1], digit2[1], digit1[1], s3, s2, s3_inv, s2_inv);
	new_ans ans0(mode[0], digit3[0], digit2[0], digit1[0], s3, s2, s3_inv, s2_inv);
endmodule

module Identifier(out, in); //0.427
	output [15:0] out;
	input [3:0] in;

	wire [3:0] in_inv;
	IV inv_3(in_inv[3], in[3]);
	IV inv_2(in_inv[2], in[2]);
	IV inv_1(in_inv[1], in[1]);
	IV inv_0(in_inv[0], in[0]);

	NR4 nr_0 (out[0],  in[3], 	   in[2], 		in[1], 		in[0]);
	NR4 nr_1 (out[1],  in[3], 	   in[2], 		in[1], 		in_inv[0]);
	NR4 nr_2 (out[2],  in[3], 	   in[2], 		in_inv[1], 	in[0]);
	NR4 nr_3 (out[3],  in[3], 	   in[2], 		in_inv[1], 	in_inv[0]);
	NR4 nr_4 (out[4],  in[3], 	   in_inv[2], 	in[1], 		in[0]);
	NR4 nr_5 (out[5],  in[3], 	   in_inv[2], 	in[1], 		in_inv[0]);
	NR4 nr_6 (out[6],  in[3], 	   in_inv[2], 	in_inv[1], 	in[0]);
	NR4 nr_7 (out[7],  in[3], 	   in_inv[2], 	in_inv[1], 	in_inv[0]);
	NR4 nr_8 (out[8],  in_inv[3], in[2], 		in[1], 		in[0]);
	NR4 nr_9 (out[9],  in_inv[3], in[2], 		in[1], 		in_inv[0]);
	NR4 nr_10(out[10], in_inv[3], in[2], 		in_inv[1], 	in[0]);
	NR4 nr_11(out[11], in_inv[3], in[2], 		in_inv[1], 	in_inv[0]);
	NR4 nr_12(out[12], in_inv[3], in_inv[2], 	in[1], 		in[0]);
	NR4 nr_13(out[13], in_inv[3], in_inv[2], 	in[1], 		in_inv[0]);
	NR4 nr_14(out[14], in_inv[3], in_inv[2], 	in_inv[1], 	in[0]);
	NR4 nr_15(out[15], in_inv[3], in_inv[2], 	in_inv[1], 	in_inv[0]);
endmodule

module Once(once, a, b, c, d, e); //0.653
    output once;
    input a, b, c, d, e;
    wire node_0, node_1;
	wire a_inv, b_inv, c_inv;
	IV iv_1(a_inv, a);
	IV iv_2(b_inv, b);
	IV iv_3(c_inv, c);
    ND3 nand_1(node_0, a_inv, b_inv, c_inv);
    OR2 or_2(node_1, d, e);
    OR2 or_3(once, node_0, node_1);
endmodule

module Once_inv(Once_inv, a, b, c, d, e); //0.580
    output Once_inv;
    input a, b, c, d, e;
    wire node_2, node_3;
	wire a_inv, b_inv, c_inv;
	IV iv_1(a_inv, a);
	IV iv_2(b_inv, b);
	IV iv_3(c_inv, c);
    ND3 nand_3(node_2, a_inv, b_inv, c_inv);
    OR2 or_4(node_3, d, e);
    NR2 Nor_3(Once_inv, node_2, node_3);
endmodule

module Twice (twice, a, b, c, d, e); //0.764
    output twice;
    input a, b, c, d, e;
	wire [12:0] node;

	AN2 and_1(node[0], a, b);

	ND2 nd_1(node[1], a, c);
	ND2 nd_2(node[2], a, d);
	ND2 nd_3(node[3], a, e);
	ND3 nd_4(node[4], node[1], node[2], node[3]);

	ND2 nd_11(node[5], b, c);
	ND2 nd_12(node[6], b, d);
	ND2 nd_13(node[7], b, e);
	ND3 nd_14(node[8], node[5], node[6], node[7]);

	ND2 nd_21(node[9], c, d);
	ND2 nd_22(node[10], c, e);
	ND2 nd_23(node[11], d, e);
	ND3 nd_24(node[12], node[9], node[10], node[11]);

	wire [3:0] node_inv;
	IV iv_1(node_inv[3], node[0]);
	IV iv_2(node_inv[2], node[4]);
	IV iv_3(node_inv[1], node[8]);
	IV iv_4(node_inv[0], node[12]);
	ND4 nr_4(twice, node_inv[0], node_inv[1], node_inv[2], node_inv[3]);
endmodule

module Twice_inv (twice_inv, a, b, c, d, e); //0.747
    output twice_inv;
    input a, b, c, d, e;
    wire [12:0] node;

	AN2 and_1(node[0], a, b);

	ND2 nd_1(node[1], a, c);
	ND2 nd_2(node[2], a, d);
	ND2 nd_3(node[3], a, e);
	ND3 nd_4(node[4], node[1], node[2], node[3]);

	ND2 nd_11(node[5], b, c);
	ND2 nd_12(node[6], b, d);
	ND2 nd_13(node[7], b, e);
	ND3 nd_14(node[8], node[5], node[6], node[7]);

	ND2 nd_21(node[9], c, d);
	ND2 nd_22(node[10], c, e);
	ND2 nd_23(node[11], d, e);
	ND3 nd_24(node[12], node[9], node[10], node[11]);

	NR4 nr_4(twice_inv, node[0], node[4], node[8], node[12]);
endmodule

module Three_time (three, a, b, c, d, e); //0.628
    output three;
    input a, b, c, d, e;
    wire [8:0] node3;
	wire a_inv, b_inv, c_inv, d_inv, e_inv;
	IV iv_1(a_inv, a);
	IV iv_2(b_inv, b);
	IV iv_3(c_inv, c);
	IV iv_4(d_inv, d);
	IV iv_5(e_inv, e);

    AN2 And_1(node3[0], a, b);
    ND3 Or_1(node3[1], c_inv, d_inv, e_inv);
    ND2 And_2(node3[2], node3[0], node3[1]);
    OR2 Or_2(node3[3], a, b);
    OR2 Or_3(node3[4], d, e);
    ND3 And_3(node3[5], node3[3], node3[4], c);
    ND3 Or_4(node3[6], a_inv, b_inv, c_inv);
    AN2 And_4(node3[7], d, e);
    ND2 And_5(node3[8], node3[6], node3[7]);
    ND3 Or_5(three, node3[2], node3[5], node3[8]);
endmodule

module Three_time_inv (three_inv, a, b, c, d, e); //0.677
    output three_inv;
    input a, b, c, d, e;
    wire [8:0] node3;
	wire a_inv, b_inv, c_inv, d_inv, e_inv;
	IV iv_1(a_inv, a);
	IV iv_2(b_inv, b);
	IV iv_3(c_inv, c);
	IV iv_4(d_inv, d);
	IV iv_5(e_inv, e);

    AN2 And_1(node3[0], a, b);
    ND3 Or_1(node3[1], c_inv, d_inv, e_inv);
    ND2 And_2(node3[2], node3[0], node3[1]);
    OR2 Or_2(node3[3], a, b);
    OR2 Or_3(node3[4], d, e);
    ND3 And_3(node3[5], node3[3], node3[4], c);
    ND3 Or_4(node3[6], a_inv, b_inv, c_inv);
    AN2 And_4(node3[7], d, e);
    ND2 And_5(node3[8], node3[6], node3[7]);
    AN3 Or_5(three_inv, node3[2], node3[5], node3[8]);
endmodule

module S(s, arr); //0.667
    output s;
    input [15:0] arr;
    wire [3:0] node4;
    AN4 or_1(node4[3], arr[15], arr[14], arr[13], arr[12]);
    AN4 or_2(node4[2], arr[11], arr[10], arr[9], arr[8]);
    AN4 or_3(node4[1], arr[7], arr[6], arr[5], arr[4]);
    AN4 or_4(node4[0], arr[3], arr[2], arr[1], arr[0]);
    ND4 or_5(s, node4[3], node4[2], node4[1], node4[0]);
endmodule

module S_inv (s_inv, arr); //0.742
	output s_inv;
	input [15:0] arr;
	wire [3:0] node4;
	AN4 or_1(node4[3], arr[15], arr[14], arr[13], arr[12]);
    AN4 or_2(node4[2], arr[11], arr[10], arr[9], arr[8]);
    AN4 or_3(node4[1], arr[7], arr[6], arr[5], arr[4]);
    AN4 or_4(node4[0], arr[3], arr[2], arr[1], arr[0]);
    AN4 or_5(s_inv, node4[3], node4[2], node4[1], node4[0]);
endmodule

module special_decoder(D3, three); //0.596
	output [3:0] D3;
	input [15:0] three;

	wire [5:0] node5;
	ND4 or4_d1(node5[0], three[15], three[14], three[13], three[12]);
	ND4 or4_d2(node5[1], three[11], three[10], three[9], three[8]);
	OR2 or2_d1(D3[3], node5[0], node5[1]);

	ND4 or4_d3(node5[2], three[4], three[5], three[6], three[7]);
	OR2 or2_d2(D3[2], node5[2], node5[0]);

	ND4 or4_d4(node5[3], three[3], three[7], three[11], three[15]);
	ND4 or4_d5(node5[4], three[2], three[6], three[10], three[14]);
	OR2 or2_d3(D3[1], node5[3], node5[4]);

	ND4 or4_d6(node5[5], three[1], three[5], three[9], three[13]);
	OR2 or2_d4(D3[0], node5[3], node5[5]);
endmodule

module Decoder(D2, twice, twice_inv); //1.184
	output [3:0] D2;
	input [15:0] twice, twice_inv;
	wire [3:0] a, b, c, d;
	wire a_e, b_e, c_e, d_e, a_ne, b_ne, c_ne;
//p1 = 0.592
	ND4 or4_1(a_e, twice_inv[15], twice_inv[14], twice_inv[13], twice_inv[12]);
	ND4 or4_2(b_e, twice_inv[11], twice_inv[10], twice_inv[9], twice_inv[8]);
	ND4 or4_3(c_e, twice_inv[7], twice_inv[6], twice_inv[5], twice_inv[4]);
	ND4 or4_4(d_e, twice_inv[3], twice_inv[2], twice_inv[1], twice_inv[0]);

	NR4 nr4_1(a_ne, twice[15], twice[14], twice[13], twice[12]);
	NR4 nr4_2(b_ne, twice[11], twice[10], twice[9], twice[8]);
	NR4 nr4_3(c_ne, twice[7], twice[6], twice[5], twice[4]);

	assign a[3] = 1'b1;
	assign a[2] = 1'b1;
	wire [7:0] node6;
	ND2 and2_1(node6[0], 1'b1, twice[15]);
	ND3 and3_1(node6[1], 1'b1, twice[14], twice_inv[15]);
	ND4 and4_1(node6[2], 1'b0, twice[13], twice_inv[14], twice_inv[15]);
	ND4 and4_2(node6[3], 1'b0, twice_inv[13], twice_inv[14], twice_inv[15]);
	ND4 or4_5(a[1], node6[0], node6[1], node6[2], node6[3]);

	ND2 and2_2(node6[4], 1'b1, twice[15]);
	ND3 and3_2(node6[5], 1'b0, twice[14], twice_inv[15]);
	ND4 and4_3(node6[6], 1'b1, twice[13], twice_inv[14], twice_inv[15]);
	ND4 and4_4(node6[7], 1'b0, twice_inv[13], twice_inv[14], twice_inv[15]);
	ND4 or4_6(a[0], node6[4], node6[5], node6[6], node6[7]);

	assign b[3] = 1'b1;
	assign b[2] = 1'b0;
	wire [7:0] node7;
	ND2 and2_11(node7[0], 1'b1, twice[11]);
	ND3 and3_11(node7[1], 1'b1, twice[10], twice_inv[11]);
	ND4 and4_11(node7[2], 1'b0, twice[9], twice_inv[10], twice_inv[11]);
	ND4 and4_21(node7[3], 1'b0, twice_inv[9], twice_inv[10], twice_inv[11]);
	ND4 or4_51(b[1], node7[0], node7[1], node7[2], node7[3]);
	ND2 and2_21(node7[4], 1'b1, twice[11]);
	ND3 and3_21(node7[5], 1'b0, twice[10], twice_inv[11]);
	ND4 and4_22(node7[6], 1'b1, twice[9], twice_inv[10], twice_inv[11]);
	ND4 and4_33(node7[7], 1'b0, twice_inv[9], twice_inv[10], twice_inv[11]);
	ND4 or4_61(b[0], node7[4], node7[5], node7[6], node7[7]);

	assign c[3] = 1'b0;
	assign c[2] = 1'b1;
	wire [7:0] node8;
	ND2 and2_12(node8[0], 1'b1, twice[7]);
	ND3 and3_12(node8[1], 1'b1, twice[6], twice_inv[7]);
	ND4 and4_12(node8[2], 1'b0, twice[5], twice_inv[6], twice_inv[7]);
	ND4 and4_24(node8[3], 1'b0, twice_inv[5], twice_inv[6], twice_inv[7]);
	ND4 or4_52(c[1], node8[0], node8[1], node8[2], node8[3]);
	ND2 and2_22(node8[4], 1'b1, twice[7]);
	ND3 and3_22(node8[5], 1'b0, twice[6], twice_inv[7]);
	ND4 and4_25(node8[6], 1'b1, twice[5], twice_inv[6], twice_inv[7]);
	ND4 and4_32(node8[7], 1'b0, twice_inv[5], twice_inv[6], twice_inv[7]);
	ND4 or4_62(c[0], node8[4], node8[5], node8[6], node8[7]);

	assign d[3] = 1'b0;
	assign d[2] = 1'b0;
	wire [7:0] node9;
	ND2 and2_13(node9[0], 1'b1, twice[3]);
	ND3 and3_13(node9[1], 1'b1, twice[2], twice_inv[3]);
	ND4 and4_13(node9[2], 1'b0, twice[1], twice_inv[2], twice_inv[3]);
	ND4 and4_26(node9[3], 1'b0, twice_inv[1], twice_inv[2], twice_inv[3]);
	ND4 or4_53(d[1], node9[0], node9[1], node9[2], node9[3]);
	ND2 and2_23(node9[4], 1'b1, twice[3]);
	ND3 and3_23(node9[5], 1'b0, twice[2], twice_inv[3]);
	ND4 and4_27(node9[6], 1'b1, twice[1], twice_inv[2], twice_inv[3]);
	ND4 and4_43(node9[7], 1'b0, twice_inv[1], twice_inv[2], twice_inv[3]);
	ND4 or4_63(d[0], node9[4], node9[5], node9[6], node9[7]);
//p2 = 0.592
	wire [15:0] node10;
	ND2 and2_a(node10[0], a[3], a_e);
	ND3 and3_a(node10[1], b[3], b_e, a_ne);
	ND4 and4_a(node10[2], c[3], c_e, b_ne, a_ne);
	ND4 and4_a2(node10[3], d[3], c_ne, b_ne, a_ne);
	ND4 or4_a(D2[3], node10[0], node10[1], node10[2], node10[3]);

	ND2 and2_a1(node10[4], a[2], a_e);
	ND3 and3_a1(node10[5], b[2], b_e, a_ne);
	ND4 and4_a1(node10[6], c[2], c_e, b_ne, a_ne);
	ND4 and4_a21(node10[7], d[2], c_ne, b_ne, a_ne);
	ND4 or4_a1(D2[2], node10[4], node10[5], node10[6], node10[7]);

	ND2 and2_a2(node10[8], a[1], a_e);
	ND3 and3_a2(node10[9], b[1], b_e, a_ne);
	ND4 and4_a3(node10[10], c[1], c_e, b_ne, a_ne);
	ND4 and4_a22(node10[11], d[1], c_ne, b_ne, a_ne);
	ND4 or4_a2(D2[1], node10[8], node10[9], node10[10], node10[11]);

	ND2 and2_a3(node10[12], a[0], a_e);
	ND3 and3_a3(node10[13], b[0], b_e, a_ne);
	ND4 and4_a4(node10[14], c[0], c_e, b_ne, a_ne);
	ND4 and4_a23(node10[15], d[0], c_ne, b_ne, a_ne);
	ND4 or4_a3(D2[0], node10[12], node10[13], node10[14], node10[15]);
endmodule

module new_ans(mode, d3, d2, d1, s3, s2, s3_inv, s2_inv); //0.452
	output mode;
	input d3, d2, d1, s3, s2, s2_inv, s3_inv;
	wire node0, node1, node2;
	ND2 nand2(node0, d3, s3);
	ND3 nand30(node1, d2, s2, s3_inv);
	ND3 nand31(node2, d1, s2_inv, s3_inv); // 0.226
	ND3 nand3(mode, node0, node1, node2); // 0.226
endmodule