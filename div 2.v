//`include "lib.v"
//=============================================
module div (
	input  clk,
	input  rst_n,
	input  i_in_valid,
	input  [7:0] i_a,
	input  [4:0] i_b,
	output [7:0] o_q,
	output [4:0] o_r,
	output       o_out_valid,
	output [50:0] number
);
	wire [6:0] o;
	wire [50:0] num[15:0];
	FD2 ff1(o[0], 1'b1, clk, rst_n, num[0]);
	FD2 ff2(o[1], o[0], clk, rst_n, num[1]);
	FD2 ff3(o[2], o[1], clk, rst_n, num[2]);
	FD2 ff4(o[3], o[2], clk, rst_n, num[3]);
	FD2 ff5(o[4], o[3], clk, rst_n, num[4]);
	FD2 ff6(o[5], o[4], clk, rst_n, num[5]);
	FD2 ff7(o[6], o[5], clk, rst_n, num[6]);
	FD2 ff8(o_out_valid, o[6], clk, rst_n, num[7]);

	wire [7:0] a[7:0];
	wire [4:0] b[6:0];
	wire [7:0] q[6:0];
	wire [4:0] r[4:0];
	wire [5:0] r1[2:0];
	assign r[0] = {4'b0000, i_a[7]};

	S1 s1(clk, rst_n, r[0], i_b, i_a, q[0], r[1], a[0], b[0], num[8]);
	S2 s2(clk, rst_n, r[1], b[0], a[0],  q[0], q[1] , r[2], a[1], b[1], num[9]);
	S3 s3(clk, rst_n, r[2], b[1], a[1],  q[1], q[2] , r[3], a[2], b[2], num[10]);
	S4 s4(clk, rst_n, r[3], b[2], a[2],  q[2], q[3] , r[4], a[3], b[3], num[11]);
	S5 s5(clk, rst_n, r[4], b[3], a[3],  q[3], q[4] , r1[0], a[4], b[4], num[12]);
	S6 s6(clk, rst_n, r1[0], b[4], a[4],  q[4], q[5], r1[1], a[5], b[5], num[13]);
	S7 s7(clk, rst_n, r1[1], b[5], a[5],  q[5], q[6], r1[2], a[6], b[6], num[14]);
	S8 s8(clk, rst_n, r1[2], b[6], a[6],  q[6], o_q, o_r, num[15]);
	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + num[6] + num[7] +
					num[8] + num[9] + num[10] + num[11] + num[12] + num[13] + num[14] + num[15];
endmodule

module S1 (clk, rst_n, r, b, a, Q, R, a2, b2, number);
	input clk, rst_n;
	input [4:0] r, b;
    input [7:0] a;
    output[4:0] R, b2;
	output[7:0] a2, Q;
    output[50:0] number;
	wire [50:0] num[8:0];
	
	wire [4:0] b_inv;
	IV in0(b_inv[0], b[0], num[0]);
	IV in1(b_inv[1], b[1], num[1]);
	IV in2(b_inv[2], b[2], num[2]);
	IV in3(b_inv[3], b[3], num[3]);
	IV in4(b_inv[4], b[4], num[4]);
	
	wire Q_, R1, b1, b1_inv;
	ND4 nd0(b1, b_inv[4], b_inv[3], b_inv[2], b_inv[1], num[5]);
	AN4 and0(b1_inv,  b_inv[4], b_inv[3], b_inv[2], b_inv[1], num[6]);
	AN2 and1(Q_, b1_inv, r[0], num[7]);
	AN2 and2(R1, r[0], b1, num[8]);

	assign R[4] = 1'b0;
	assign R[3] = 1'b0;
	assign R[2] = 1'b0;
	assign R[1] = R1;
	assign R[0] = a[6];

	assign a2 = a;
	assign b2 = b_inv;
	assign Q[7] = Q_;
	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + num[6] + num[7] + num[8];
endmodule

module S2 (clk, rst_n, r, B, A, q1, q2, R, a2, b2, number);
	input clk, rst_n;
	input [4:0] r, B;
	input [7:0] A, q1;
	output [4:0] R, b2;
	output [7:0] a2, q2;
	output [50:0] number;
	wire [50:0] num[21:0];

	wire [1:0] R1;
	wire Q_inv, b;
	wire [1:0] s0;
	wire [1:0] c;
	wire s0_inv;

	AN3 and0(b, B[4], B[3], B[2], num[0]);
	OR2 or1(c[0], r[0], B[0], num[1]);
	EN xr1(s0[0], r[0], B[0], num[2]);

	FA1 fa0(c[1], s0[1], r[1], B[1], c[0], num[3]);
	AN2 and1(Q_inv, c[1], b, num[4]);
	MUX21H mux1(R1[1], r[1], s0[1], Q_inv, num[5]);
	MUX21H mux2(R1[0], r[0], s0[0], Q_inv, num[6]);

	assign R[4] = 1'b0;
	assign R[3] = 1'b0;
	FD2 ff0(R[2], R1[1], clk, rst_n, num[7]);
	FD2 ff1(R[1], R1[0], clk, rst_n, num[8]);
	FD2 ff2(R[0], A[5], clk, rst_n, num[9]);

	FD2 ff3(a2[4], A[4], clk, rst_n, num[10]);
	FD2 ff4(a2[3], A[3], clk, rst_n, num[11]);
	FD2 ff5(a2[2], A[2], clk, rst_n, num[12]);
	FD2 ff6(a2[1], A[1], clk, rst_n, num[13]);
	FD2 ff7(a2[0], A[0], clk, rst_n, num[14]);

	FD2 ff8(b2[4], B[4], clk, rst_n, num[15]);
	FD2 ff9(b2[3], B[3], clk, rst_n, num[16]);
	FD2 f10(b2[2], B[2], clk, rst_n, num[17]);
	FD2 f11(b2[1], B[1], clk, rst_n, num[18]);
	FD2 f12(b2[0], B[0], clk, rst_n, num[19]);

	FD2 f13(q2[6], Q_inv, clk, rst_n, num[20]);
	FD2 f14(q2[7], q1[7], clk, rst_n, num[21]);

	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + num[6] + num[7] +
					num[8] + num[9] + num[10] + num[11] + num[12] + num[13] + num[14] + num[15]+
					num[16] + num[17] + num[18] + num[19] + num[20] + num[21];
endmodule

module S3 (clk, rst_n, r, B, A, q1, q2, R, a2, b2, number);
	input clk, rst_n;
	input [4:0] r, B;
	input [7:0] A, q1;
	output [4:0] R, b2;
	output [7:0] a2, q2;
	output [50:0] number;
	wire [50:0] num[24:0];

	wire [4:0] R1, s0;
	wire Q_inv, b;
	AN2 and1(b, B[4], B[3], num[0]);
	wire [2:0] c;
	OR2 or1(c[0], r[0], B[0], num[1]);
	EN  eo1(s0[0], r[0], B[0], num[2]);
	FA1 fa1(c[1], s0[1], r[1], B[1], c[0], num[3]);
	FA1 fa2(c[2], s0[2], r[2], B[2], c[1], num[4]);
	AN2 and2(Q_inv, c[2], b, num[5]);
	MUX21H mux1(R1[2], r[2], s0[2], Q_inv, num[6]);
	MUX21H mux2(R1[1], r[1], s0[1], Q_inv, num[7]);
	MUX21H mux3(R1[0], r[0], s0[0], Q_inv, num[8]);

	assign R[4] = 1'b0;
	FD2 rf4(R[3], R1[2], clk, rst_n, num[9]);
	FD2 rf5(R[2], R1[1], clk, rst_n, num[10]);
	FD2 rf6(R[1], R1[0], clk, rst_n, num[11]);
	FD2 rf7(R[0], A[4], clk, rst_n, num[12]);

	FD2 ff1(a2[3], A[3], clk, rst_n, num[13]);
	FD2 ff2(a2[2], A[2], clk, rst_n, num[14]);
	FD2 ff3(a2[1], A[1], clk, rst_n, num[15]);
	FD2 ff4(a2[0], A[0], clk, rst_n, num[16]);

	FD2 ff5(b2[4], B[4], clk, rst_n, num[17]);
	FD2 ff6(b2[3], B[3], clk, rst_n, num[18]);
	FD2 f10(b2[2], B[2], clk, rst_n, num[19]);
	FD2 f11(b2[1], B[1], clk, rst_n, num[20]);
	FD2 f12(b2[0], B[0], clk, rst_n, num[21]);

	FD2 qf1(q2[5], Q_inv, clk, rst_n, num[22]);
	FD2 qf2(q2[6], q1[6], clk, rst_n, num[23]);
	FD2 qf3(q2[7], q1[7], clk, rst_n, num[24]);
	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + num[6] + num[7] + num[8] + 
	num[9] + num[10] + num[11] + num[12] + num[13] + num[14] + num[15]+ num[16] + num[17] + num[18] + 
	num[19] + num[20] + num[21] + num[22] + num[23] + num[24];
endmodule

module S4 (clk, rst_n, r, B, A, q1, q2, R, a2, b2, number);
	input clk,rst_n;
	input [4:0] r, B;
	input [7:0] A, q1;
	output [4:0] R, b2;
	output [7:0] a2, q2;
	output [50:0] number;
	wire [50:0] num[26:0];

	wire [4:0] R1, s;
	wire Q_inv;
	wire [3:0] c;

	OR2 or1(c[0], r[0], B[0], num[0]);
	EN  eo1(s[0], r[0], B[0], num[1]);
	FA1 fa1(c[1], s[1], r[1], B[1], c[0], num[2]);
	FA1 fa2(c[2], s[2], r[2], B[2], c[1], num[3]);
	FA1 fa3(c[3], s[3], r[3], B[3], c[2], num[4]);
	AN2 and1(Q_inv, c[3], B[4], num[5]);

	MUX21H mux1(R1[3], r[3], s[3], Q_inv, num[6]);
	MUX21H mux2(R1[2], r[2], s[2], Q_inv, num[7]);
	MUX21H mux3(R1[1], r[1], s[1], Q_inv, num[8]);
	MUX21H mux4(R1[0], r[0], s[0], Q_inv, num[9]);

	FD2 rf3(R[4], R1[3], clk, rst_n, num[10]);
	FD2 rf4(R[3], R1[2], clk, rst_n, num[11]);
	FD2 rf5(R[2], R1[1], clk, rst_n, num[12]);
	FD2 rf6(R[1], R1[0], clk, rst_n, num[13]);
	FD2 rf7(R[0], A[3], clk, rst_n, num[14]);

	FD2 ff5(a2[2], A[2], clk, rst_n, num[15]);
	FD2 ff6(a2[1], A[1], clk, rst_n, num[16]);
	FD2 ff7(a2[0], A[0], clk, rst_n, num[17]);

	FD2 ff8(b2[4], B[4], clk, rst_n, num[18]);
	FD2 ff9(b2[3], B[3], clk, rst_n, num[19]);
	FD2 f10(b2[2], B[2], clk, rst_n, num[20]);
	FD2 f11(b2[1], B[1], clk, rst_n, num[21]);
	FD2 f12(b2[0], B[0], clk, rst_n, num[22]);

	FD2 qf1(q2[5], q1[5], clk, rst_n, num[23]);
	FD2 qf2(q2[6], q1[6], clk, rst_n, num[24]);
	FD2 qf3(q2[7], q1[7], clk, rst_n, num[25]);
	FD2 qf4(q2[4], Q_inv, clk, rst_n, num[26]);
	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + num[6] + num[7] + num[8] +
	num[9] + num[10] + num[11] + num[12] + num[13] + num[14] + num[15]+ num[16] + num[17] + num[18] +
	num[19] + num[20] + num[21] + num[22] + num[23] + num[24] + num[25] + num[26];
endmodule

module S5 (clk, rst_n, r, B, A, q1, q2, R, a2, b2, number);
	input clk, rst_n;
	input [4:0] r, B;
	input [7:0] A, q1;
	output [5:0] R;
	output [4:0] b2;
	output [7:0] q2, a2;
	output [50:0] number;
	wire [50:0] num[23:0];

	wire [4:0] R1, s;
	wire Q_inv;
	substract1 sub0(r, B, s, Q_inv, num[0]);
	MUX21H mux1(R1[4], r[4], s[4], Q_inv, num[1]);
	MUX21H mux2(R1[3], r[3], s[3], Q_inv, num[2]);
	MUX21H mux3(R1[2], r[2], s[2], Q_inv, num[3]);
	MUX21H mux4(R1[1], r[1], s[1], Q_inv, num[4]);
	MUX21H mux5(R1[0], r[0], s[0], Q_inv, num[5]);

	FD2 rf2(R[5], R1[4], clk, rst_n, num[6]);
	FD2 rf3(R[4], R1[3], clk, rst_n, num[7]);
	FD2 rf4(R[3], R1[2], clk, rst_n, num[8]);
	FD2 rf5(R[2], R1[1], clk, rst_n, num[9]);
	FD2 rf6(R[1], R1[0], clk, rst_n, num[10]);
	FD2 rf7(R[0], A[2], clk, rst_n, num[11]);

	FD2 ff6(a2[1], A[1], clk, rst_n, num[12]);
	FD2 ff7(a2[0], A[0], clk, rst_n, num[13]);

	FD2 ff8(b2[4], B[4], clk, rst_n, num[14]);
	FD2 ff9(b2[3], B[3], clk, rst_n, num[15]);
	FD2 f10(b2[2], B[2], clk, rst_n, num[16]);
	FD2 f11(b2[1], B[1], clk, rst_n, num[17]);
	FD2 f12(b2[0], B[0], clk, rst_n, num[18]);

	FD2 qf1(q2[7], q1[7], clk, rst_n, num[19]);
	FD2 qf2(q2[6], q1[6], clk, rst_n, num[20]);
	FD2 qf3(q2[5], q1[5], clk, rst_n, num[21]);
	FD2 qf4(q2[4], q1[4], clk, rst_n, num[22]);
	FD2 qf5(q2[3], Q_inv, clk, rst_n, num[23]);

	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + num[6] + num[7] + num[8] +
	num[9] + num[10] + num[11] + num[12] + num[13] + num[14] + num[15]+ num[16] + num[17] + num[18] +
	num[19] + num[20] + num[21] + num[22] + num[23];
endmodule

module S6 (clk, rst_n, r, B, A, q1, q2, R, a2, b2, number);
	input clk, rst_n;
	input [5:0] r;
	input [4:0] B;
	input [7:0] A, q1;
	output [5:0] R;
	output [4:0] b2;
	output [7:0] q2, a2;
	output [50:0] number;
	wire [50:0] num[23:0];

	wire [4:0] R1, s;
	wire Q_inv;
	substract2 sub0(r, B, s, Q_inv, num[0]);
	MUX21H mux1(R1[4], r[4], s[4], Q_inv, num[1]);
	MUX21H mux2(R1[3], r[3], s[3], Q_inv, num[2]);
	MUX21H mux3(R1[2], r[2], s[2], Q_inv, num[3]);
	MUX21H mux4(R1[1], r[1], s[1], Q_inv, num[4]);
	MUX21H mux5(R1[0], r[0], s[0], Q_inv, num[5]);

	FD2 rf2(R[5], R1[4], clk, rst_n, num[6]);
	FD2 rf3(R[4], R1[3], clk, rst_n, num[7]);
	FD2 rf4(R[3], R1[2], clk, rst_n, num[8]);
	FD2 rf5(R[2], R1[1], clk, rst_n, num[9]);
	FD2 rf6(R[1], R1[0], clk, rst_n, num[10]);
	FD2 rf7(R[0], A[1], clk, rst_n, num[11]);

	FD2 ff7(a2[0], A[0], clk, rst_n, num[12]);

	FD2 ff8(b2[4], B[4], clk, rst_n, num[13]);
	FD2 ff9(b2[3], B[3], clk, rst_n, num[14]);
	FD2 f10(b2[2], B[2], clk, rst_n, num[15]);
	FD2 f11(b2[1], B[1], clk, rst_n, num[16]);
	FD2 f12(b2[0], B[0], clk, rst_n, num[17]);

	FD2 qf1(q2[7], q1[7], clk, rst_n, num[18]);
	FD2 qf2(q2[6], q1[6], clk, rst_n, num[19]);
	FD2 qf3(q2[5], q1[5], clk, rst_n, num[20]);
	FD2 qf4(q2[4], q1[4], clk, rst_n, num[21]);
	FD2 qf5(q2[3], q1[3], clk, rst_n, num[22]);
	FD2 qf6(q2[2], Q_inv, clk, rst_n, num[23]);
	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + num[6] + num[7] + num[8] +
	num[9] + num[10] + num[11] + num[12] + num[13] + num[14] + num[15]+ num[16] + num[17] + num[18] + 
	num[19] + num[20] + num[21] + num[22] + num[23];
endmodule

module S7 (clk, rst_n, r, B, A, q1, q2, R, a2, b2, number);
	input clk, rst_n;
	input [5:0] r;
	input [4:0] B;
	input [7:0] A, q1;
	output[5:0] R;
	output[4:0] b2;
	output [7:0] q2, a2;
	output [50:0] number;
	wire [50:0] num[23:0];

	wire [4:0] R1, s;
	wire Q_inv;
	substract2 sub0(r, B, s, Q_inv, num[0]);
	MUX21H mux1(R1[4], r[4], s[4], Q_inv, num[1]);
	MUX21H mux2(R1[3], r[3], s[3], Q_inv, num[2]);
	MUX21H mux3(R1[2], r[2], s[2], Q_inv, num[3]);
	MUX21H mux4(R1[1], r[1], s[1], Q_inv, num[4]);
	MUX21H mux5(R1[0], r[0], s[0], Q_inv, num[5]);

	FD2 ff1(R[5], R1[4], clk, rst_n, num[6]);
	FD2 ff2(R[4], R1[3], clk, rst_n, num[7]);
	FD2 ff3(R[3], R1[2], clk, rst_n, num[8]);
	FD2 ff4(R[2], R1[1], clk, rst_n, num[9]);
	FD2 ff5(R[1], R1[0], clk, rst_n, num[10]);
	FD2 ff6(R[0], A[0], clk, rst_n, num[11]);

	FD2 ff7(b2[4], B[4], clk, rst_n, num[12]);
	FD2 ff8(b2[3], B[3], clk, rst_n, num[13]);
	FD2 ff9(b2[2], B[2], clk, rst_n, num[14]);
	FD2 f10(b2[1], B[1], clk, rst_n, num[15]);
	FD2 f11(b2[0], B[0], clk, rst_n, num[16]);

	FD2 qf1(q2[7], q1[7], clk, rst_n, num[17]);
	FD2 qf2(q2[6], q1[6], clk, rst_n, num[18]);
	FD2 qf3(q2[5], q1[5], clk, rst_n, num[19]);
	FD2 qf4(q2[4], q1[4], clk, rst_n, num[20]);
	FD2 qf5(q2[3], q1[3], clk, rst_n, num[21]);
	FD2 qf6(q2[2], q1[2], clk, rst_n, num[22]);
	FD2 qf7(q2[1], Q_inv, clk, rst_n, num[23]);
	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + num[6] + num[7] + num[8] +
	num[9] + num[10] + num[11] + num[12] + num[13] + num[14] + num[15]+ num[16] + num[17] + num[18] + 
	num[19] + num[20] + num[21] + num[22] + num[23];
endmodule

module S8 (clk, rst_n, r, B, A, q1, q2, R, number);
	input clk, rst_n;
	input [5:0] r;
	input [4:0] B;
	input [7:0] A, q1;
	output[4:0] R;
	output [7:0] q2;
	output[50:0] number;
	wire [50:0] num[18:0];

	wire [4:0] R1, s;
	wire Q_inv;
	substract2 sub0(r, B, s, Q_inv, num[0]);
	MUX21H mux1(R1[4], r[4], s[4], Q_inv, num[1]);
	MUX21H mux2(R1[3], r[3], s[3], Q_inv, num[2]);
	MUX21H mux3(R1[2], r[2], s[2], Q_inv, num[3]);
	MUX21H mux4(R1[1], r[1], s[1], Q_inv, num[4]);
	MUX21H mux5(R1[0], r[0], s[0], Q_inv, num[5]);

	FD2 ff1(R[4], R1[4], clk, rst_n, num[6]);
	FD2 ff2(R[3], R1[3], clk, rst_n, num[7]);
	FD2 ff3(R[2], R1[2], clk, rst_n, num[8]);
	FD2 ff4(R[1], R1[1], clk, rst_n, num[9]);
	FD2 ff5(R[0], R1[0], clk, rst_n, num[10]);

	FD2 qf1(q2[0], Q_inv, clk, rst_n, num[11]);
	FD2 qf2(q2[1], q1[1], clk, rst_n, num[12]);
	FD2 qf3(q2[2], q1[2], clk, rst_n, num[13]);
	FD2 qf4(q2[3], q1[3], clk, rst_n, num[14]);
	FD2 qf5(q2[4], q1[4], clk, rst_n, num[15]);
	FD2 qf6(q2[5], q1[5], clk, rst_n, num[16]);
	FD2 qf7(q2[6], q1[6], clk, rst_n, num[17]);
	FD2 qf8(q2[7], q1[7], clk, rst_n, num[18]);

	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + num[6] + num[7] + num[8] +
	num[9] + num[10] + num[11] + num[12] + num[13] + num[14] + num[15]+ num[16] + num[17] + num[18];
endmodule

module substract1(A, B, S, co, number);
	input  [4:0] A, B;
	output [4:0] S;
	output co;
	output [50:0] number;
	wire [3:0] c;
	wire [50:0] num[5:0];
	wire S_inv;
	OR2 or1(c[0], A[0], B[0], num[0]);
	EN  eo1(S[0], A[0], B[0], num[1]);
	FA1 ff1(c[1], S[1], A[1], B[1], c[0], num[2]); 
	FA1 ff2(c[2], S[2], A[2], B[2], c[1], num[3]); 
	FA1 ff3(c[3], S[3], A[3], B[3], c[2], num[4]); 
	FA1 ff4(co, S[4], A[4], B[4], c[3], num[5]);  
	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5];
endmodule

module substract2(A, B, S, co, number);
	input  [5:0] A;
	input  [4:0] B;
	output [4:0] S;
	output co;
	output [50:0] number;
	wire [4:0] c;
	wire [50:0] num[6:0];
	OR2 or1(c[0], A[0], B[0], num[0]);
	EN  eo1(S[0], A[0], B[0], num[1]);
	FA1 ff1(c[1], S[1], A[1], B[1], c[0], num[2]); 
	FA1 ff2(c[2], S[2], A[2], B[2], c[1], num[3]); 
	FA1 ff3(c[3], S[3], A[3], B[3], c[2], num[4]); 
	FA1 ff4(c[4], S[4], A[4], B[4], c[3], num[5]);
	OR2 or2(co, A[5], c[4], num[6]);    
	assign number = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + num[6];
endmodule

module REGP#(
	parameter BW = 2
)(
	input clk,
	input rst_n,
	output [BW-1:0] Q,
	input [BW-1:0] D,
	output [50:0] number
);

wire [50:0] numbers [0:BW-1];

genvar i;
generate
	for (i=0; i<BW; i=i+1) begin
		FD2 f0(Q[i], D[i], clk, rst_n, numbers[i]);
	end
endgenerate

//sum number of transistors
reg [50:0] sum;
integer j;
always @(*) begin
	sum = 0;
	for (j=0; j<BW; j=j+1) begin 
		sum = sum + numbers[j];
	end
end

assign number = sum;

endmodule