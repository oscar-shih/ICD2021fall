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
reg [20:0]count=0;
wire o0,o1,o2,o3,o4,o5,o6,o7,o8,o9;
wire [50:0]num0,num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11,num12,num13,num14,num15;
FD2 rf1(o0,1'b1,clk,rst_n,num8);
FD2 rf2(o1,o0,clk,rst_n,num9);
FD2 rf3(o2,o1,clk,rst_n,num10);
FD2 rf4(o3,o2,clk,rst_n,num11);
FD2 rf5(o4,o3,clk,rst_n,num12);
FD2 rf6(o5,o4,clk,rst_n,num13);
FD2 rf8(o6,o5,clk,rst_n,num14);
FD2 rf7(o_out_valid,o6,clk,rst_n,num15);
wire [7:0]oq;
wire c0;
wire [7:0]q0,q1,q2,q3,q4,q5,q6;
wire [7:0]a1,a2,a3,a4,a5,a6,a7,a8;
wire [4:0]r0,r1,r2,r3,r4;
wire [5:0]r5,r6,r7;
assign r0={4'b0000,i_a[7]};
wire [4:0]b1,b2,b3,b4,b5,b6,b7;

stage1 s1(clk,rst_n,r0,i_b, i_a,     q0 ,r1,a1,b1,num0);
stage2 s2(clk,rst_n,r1, b1, a1,  q0, q1 ,r2,a2,b2,num1);
stage3 s3(clk,rst_n,r2, b2, a2,  q1, q2 ,r3,a3,b3,num2);
stage4 s5(clk,rst_n,r3, b3, a3,  q2, q3 ,r4,a4,b4,num3);
stage5 s6(clk,rst_n,r4, b4, a4,  q3, q4 ,r5,a5,b5,num4);
//------------------------------------------------------
stage6 s7(clk,rst_n,r5, b5, a5,  q4, q5 ,r6,a6,b6,num5);
stage7 s8(clk,rst_n,r6, b6, a6,  q5, q6 ,r7,a7,b7,num6);
stage8 s9(clk,rst_n,r7, b7, a7,  q6, o_q ,o_r,num7);
assign number=num0+num1+num2+num3+num4+num5+num6+num7
+num8+num9+num10+num11+num12+num13+num14+num15;
//module FD2(Q,D,CLK,RESET,number);
endmodule
//----------------------------------------------------------------
//stage1 s1(clk,rst_n, R0, i_b,i_a,q0,a1,b1,num0);
module stage1(clk,rst_n,R0,B,A,Q,R,A2,B2,num);
	input clk,rst_n;
	input [4:0]R0,B;//R0,B0
    input [7:0]A;//i_a
    output[4:0]R,B2;//R1,B1
	output[7:0]A2,Q;
    output[50:0]num;
//----------------------------------------------------------------
wire [50:0]num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
wire [50:0]num12,num13,num14,num15,num16,num17,num18,num19,num20,num21,num22;
wire [4:0]R1;
wire[4:0]B_in;
wire Q_,QQ;
wire [4:0]s0,s1,s2;
wire b,b_;
IV in0(B_in[0],B[0],num8);
IV in1(B_in[1],B[1],num1);
IV in2(B_in[2],B[2],num2);
IV in3(B_in[3],B[3],num3);
IV in4(B_in[4],B[4],num4);
IV in5(b_,b,num9);
AN2 an(Q_,b_,R0[0],num5);
ND4 nr(b,B_in[4],B_in[3],B_in[2],B_in[1],num6);
AN2 m1(R1[0],R0[0],b,num7);
assign R[4]=1'b0;
assign R[3]=1'b0;
assign R[2]=1'b0;
assign R[1]=R1[0];
assign R[0]=A[6];
assign A2=A;
assign B2=B_in;
assign Q[7]=Q_;
//module FD2(Q,D,CLK,RESET,number);
assign num=num1+num2+num3+num4+num5+num6+num7+num8+num9;
endmodule
//--------------------------------------------------------
module stage2(clk,rst_n,R0,B0,A,Q1,Q2,R,A2,B2,num);
input clk,rst_n;
input [4:0] R0,B0;//R0,B0
input [7:0]A,Q1;//i_a
output[4:0]R,B2;//R1,B1
output[7:0]A2,Q2;
output[50:0]num;
//--------------------------------------------------------------------
//module MUX21H(Z,A,B,CTRL,number);
wire [50:0]num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
wire [50:0]num12,num13,num14,num15,num16,num17,num18,num19,num20,num21,num22,num23;
wire [4:0]R1,R2;
wire Q_,b;
wire [4:0]s0,s1,s2;
AN3 nr3(b,B0[4],B0[3],B0[2],num1);
wire   [4:0] B_in;
wire c0,c1,c2,c3,c4,c5;

OR2 or1(c1, R0[0],B0[0],num3);
EN  eo2(s0[0],R0[0],B0[0],num4);

FA1 fa2(c2,s0[1], R0[1],B0[1],c1,  num5);
AN2 an(Q_,c2,b,num6);
MUX21H an45(R1[1],R0[1],s0[1],Q_,num7);
MUX21H an46(R1[0],R0[0],s0[0],Q_,num23);

assign R[4]=1'b0;
assign R[3]=1'b0;
FD2 rf5(R[2],R1[1],clk,rst_n,num8);
FD2 rf6(R[1],R1[0],clk,rst_n,num9);
FD2 rf7(R[0],A[5],clk,rst_n,num10);
//module FD2(Q,D,CLK,RESET,number);

FD2 f3(A2[4],A[4],clk,rst_n,num12);
FD2 f4(A2[3],A[3],clk,rst_n,num13);
FD2 f5(A2[2],A[2],clk,rst_n,num14);
FD2 f6(A2[1],A[1],clk,rst_n,num15);
FD2 f7(A2[0],A[0],clk,rst_n,num11);

FD2 f8 (B2[4],B0[4],clk,rst_n,num17);
FD2 f9 (B2[3],B0[3],clk,rst_n,num18);
FD2 f10(B2[2],B0[2],clk,rst_n,num19);
FD2 f11(B2[1],B0[1],clk,rst_n,num20);
FD2 f12(B2[0],B0[0],clk,rst_n,num21);

FD2 qf1(Q2[6],Q_,clk,rst_n,num16);
FD2 qf2(Q2[7],Q1[7],clk,rst_n,num22);

assign num=num1+num3+num4+num5+num6+num7+num8+num9+
num10+num11+num12+num13+num14+num15+num16+num17+num18+
num16+num17+num18+num19+num20+num21+num22+num23;
endmodule
//-----------------------------
module stage3(clk,rst_n,R0,B0,A,Q1,Q2,R,A2,B2,num);
input clk,rst_n;
input [4:0] R0,B0;//R0,B0
input [7:0]A,Q1;//i_a
output[4:0]R,B2;//R1,B1
output[7:0]A2,Q2;
output[50:0]num;
//-----------------------
//----------------------------------------------------------------
//module MUX21H(Z,A,B,CTRL,number);
wire [50:0]num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
wire [50:0]num12,num13,num14,num15,num16,num17,num18,num19,num20,num21,num22;
wire [50:0]num23,num24,num25,num26,num27;
wire [4:0]R1;
wire Q_,b;
wire [4:0]s0,s1,s2;
AN2 nr3(b,B0[4],B0[3],num1);
wire c0,c1,c2,c3,c4,c5;
OR2 or1(c1, R0[0],B0[0],num4);
EN  eo2(s0[0],R0[0],B0[0],num5);
FA1 fa2(c2,s0[1], R0[1],B0[1],c1,  num6);
FA1 fa3(c3,s0[2], R0[2],B0[2],c2,  num27);
AN2 an(Q_,c3,b,num24);
MUX21H an44(R1[2],R0[2],s0[2],Q_,num25);
MUX21H an45(R1[1],R0[1],s0[1],Q_,num26);
MUX21H an46(R1[0],R0[0],s0[0],Q_,num23);

assign R[4]=1'b0;
FD2 rf4(R[3],R1[2],clk,rst_n,num7);
FD2 rf5(R[2],R1[1],clk,rst_n,num8);
FD2 rf6(R[1],R1[0],clk,rst_n,num9);
FD2 rf7(R[0],A[4],clk,rst_n,num10);
//module FD2(Q,D,CLK,RESET,number);
FD2 f4(A2[3],A[3],clk,rst_n,num11);
FD2 f5(A2[2],A[2],clk,rst_n,num12);
FD2 f6(A2[1],A[1],clk,rst_n,num13);
FD2 f7(A2[0],A[0],clk,rst_n,num14);

FD2 f8 (B2[4],B0[4],clk,rst_n,num15);
FD2 f9 (B2[3],B0[3],clk,rst_n,num16);
FD2 f10(B2[2],B0[2],clk,rst_n,num17);
FD2 f11(B2[1],B0[1],clk,rst_n,num18);
FD2 f12(B2[0],B0[0],clk,rst_n,num19);

FD2 qf1(Q2[5],Q_,clk,rst_n,num20);
FD2 qf2(Q2[6],Q1[6],clk,rst_n,num21);
FD2 qf3(Q2[7],Q1[7],clk,rst_n,num22);
assign num=num1+num4+num5+num6+num7+num8+num9+num10+num11+num12+num13+num14+num15+num16+
num17+num18+num16+num17+num18+num19+num20+num21+num22+num23+num24+num5+num26+num27;
endmodule

//------------------------------------
module stage4(clk,rst_n,R0,B0,A,Q1,Q2,R,A2,B2,num);
input clk,rst_n;
input [4:0] R0,B0;//R0,B0
input [7:0]A,Q1;//i_a
output[4:0]R,B2;//R1,B1
output[7:0]A2,Q2;
output[50:0]num;
//-----------------------
//----------------------------------------------------------------
//module MUX21H(Z,A,B,CTRL,number);
wire [50:0]num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
wire [50:0]num12,num13,num14,num15,num16,num17,num18,num19,num20,num21,num22;
wire [50:0]num23,num24,num25,num26,num27,num28,num29,num30,num31;
wire [4:0]R1;
wire Q_,b;
wire [4:0]s0,s1,s2;
wire c0,c1,c2,c3,c4,c5;

OR2 or1(c1, R0[0],B0[0],num4);
EN  eo2(s0[0],R0[0],B0[0],num5);
FA1 fa2(c2,s0[1], R0[1],B0[1],c1,  num29);
FA1 fa3(c3,s0[2], R0[2],B0[2],c2,  num28);
FA1 fa4(c4,s0[3], R0[3],B0[3],c3,  num27);
AN2 an(Q_,c4,B0[4],num31);

MUX21H an43(R1[3],R0[3],s0[3],Q_,num26);
MUX21H an44(R1[2],R0[2],s0[2],Q_,num25);
MUX21H an45(R1[1],R0[1],s0[1],Q_,num24);
MUX21H an46(R1[0],R0[0],s0[0],Q_,num23);

FD2 rf3(R[4],R1[3],clk,rst_n,num6);
FD2 rf4(R[3],R1[2],clk,rst_n,num7);
FD2 rf5(R[2],R1[1],clk,rst_n,num8);
FD2 rf6(R[1],R1[0],clk,rst_n,num9);
FD2 rf7(R[0],A[3],clk,rst_n,num10);

FD2 f5(A2[2],A[2],clk,rst_n,num11);
FD2 f6(A2[1],A[1],clk,rst_n,num12);
FD2 f7(A2[0],A[0],clk,rst_n,num13);

FD2 f8 (B2[4],B0[4],clk,rst_n,num14);
FD2 f9 (B2[3],B0[3],clk,rst_n,num15);
FD2 f10(B2[2],B0[2],clk,rst_n,num16);
FD2 f11(B2[1],B0[1],clk,rst_n,num17);
FD2 f12(B2[0],B0[0],clk,rst_n,num18);

FD2 qf1(Q2[5],Q1[5],clk,rst_n,num19);
FD2 qf2(Q2[6],Q1[6],clk,rst_n,num20);
FD2 qf3(Q2[7],Q1[7],clk,rst_n,num21);
FD2 qf4(Q2[4],Q_,clk,rst_n,num22);
//module FD2(Q,D,CLK,RESET,number);
assign num=num4+num5+num6+num7+num8+num9+num10+num11+num12+num13+num14+num15+num16+
num17+num18+num16+num17+num18+num19+num20+num21+num22
+num23+num24+num25+num26+num27+num28+num29+num31;
endmodule

//------------------------------------------------------------
module stage5(clk,rst_n,R0,B0,A,Q1,Q2,R,A2,B2,num);
input clk,rst_n;
input [4:0] R0,B0;//R0,B0
input [7:0]A,Q1;//i_a
output[5:0]R;//R1,B1
output[4:0]B2;
output[7:0]Q2,A2;
output[50:0]num;
//-----------------------
//----------------------------------------------------------------
//module MUX21H(Z,A,B,CTRL,number);
wire [50:0]num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
wire [50:0]num12,num13,num14,num15,num16,num17,num18,num19,num20,num21,num22,num23,num24;
wire [4:0]R1;
wire Q_;
wire [4:0]s0,s1,s2;
subtract sub40(R0,B0,s0,Q_,num1);
MUX21H an42(R1[4],R0[4],s0[4],Q_,num2);
MUX21H an43(R1[3],R0[3],s0[3],Q_,num3);
MUX21H an44(R1[2],R0[2],s0[2],Q_,num4);
MUX21H an45(R1[1],R0[1],s0[1],Q_,num5);
MUX21H an46(R1[0],R0[0],s0[0],Q_,num6);

FD2 rf2(R[5],R1[4],clk,rst_n,num7);
FD2 rf3(R[4],R1[3],clk,rst_n,num8);
FD2 rf4(R[3],R1[2],clk,rst_n,num9);
FD2 rf5(R[2],R1[1],clk,rst_n,num10);
FD2 rf6(R[1],R1[0],clk,rst_n,num11);
FD2 rf7(R[0],A[2],clk,rst_n,num12);

FD2 f6(A2[1],A[1],clk,rst_n,num13);
FD2 f7(A2[0],A[0],clk,rst_n,num14);

FD2 f8 (B2[4],B0[4],clk,rst_n,num15);
FD2 f9 (B2[3],B0[3],clk,rst_n,num16);
FD2 f10(B2[2],B0[2],clk,rst_n,num17);
FD2 f11(B2[1],B0[1],clk,rst_n,num18);
FD2 f12(B2[0],B0[0],clk,rst_n,num19);

FD2 qf1(Q2[5],Q1[5],clk,rst_n,num20);
FD2 qf2(Q2[6],Q1[6],clk,rst_n,num21);
FD2 qf3(Q2[7],Q1[7],clk,rst_n,num22);
FD2 qf4(Q2[4],Q1[4],clk,rst_n,num23);

//module FD2(Q,D,CLK,RESET,number);
FD2 qf5(Q2[3],Q_,clk,rst_n,num24);
assign num=num1+num2+num3+num4+num5+num6+num7+num8+num9+num10+num11+num12+num13+num14+num15+num16+
num17+num18+num16+num17+num18+num19+num20+num21+num22+num23+num24;
endmodule
//---------------------------------------------------

module stage6(clk,rst_n,R0,B0,A,Q1,Q2,R,A2,B2,num);
input clk,rst_n;
input [5:0]R0;
input [4:0]B0;//R0,B0
input [7:0]A,Q1;//i_a
output[5:0]R;//R1,B1
output[4:0]B2;
output [7:0]Q2,A2;
output[50:0]num;
//----------------------------------------------------------------
//module MUX21H(Z,A,B,CTRL,number);
wire [50:0]num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
wire [50:0]num12,num13,num14,num15,num16,num17,num18,num19,num20,num21,num22,num23,num24;
wire [4:0]R1;
wire Q_,Q;
wire [4:0]s0,s1,s2;
subtract2 sub40(R0,B0,s0,Q_,num1);

MUX21H an42(R1[4],R0[4],s0[4],Q_,num2);
MUX21H an43(R1[3],R0[3],s0[3],Q_,num3);
MUX21H an44(R1[2],R0[2],s0[2],Q_,num4);
MUX21H an45(R1[1],R0[1],s0[1],Q_,num5);
MUX21H an46(R1[0],R0[0],s0[0],Q_,num6);
FD2 rf2(R[5],R1[4],clk,rst_n,num7);
FD2 rf3(R[4],R1[3],clk,rst_n,num8);
FD2 rf4(R[3],R1[2],clk,rst_n,num9);
FD2 rf5(R[2],R1[1],clk,rst_n,num10);
FD2 rf6(R[1],R1[0],clk,rst_n,num11);
FD2 rf7(R[0],A[1],clk,rst_n,num12);

FD2 f7(A2[0],A[0],clk,rst_n,num13);

FD2 f8 (B2[4],B0[4],clk,rst_n,num14);
FD2 f9 (B2[3],B0[3],clk,rst_n,num15);
FD2 f10(B2[2],B0[2],clk,rst_n,num16);
FD2 f11(B2[1],B0[1],clk,rst_n,num17);
FD2 f12(B2[0],B0[0],clk,rst_n,num18);

FD2 qf1(Q2[5],Q1[5],clk,rst_n,num19);
FD2 qf2(Q2[6],Q1[6],clk,rst_n,num20);
FD2 qf3(Q2[7],Q1[7],clk,rst_n,num21);
FD2 qf4(Q2[4],Q1[4],clk,rst_n,num22);
FD2 qf5(Q2[3],Q1[3],clk,rst_n,num23);
FD2 qf6(Q2[2],Q_,clk,rst_n,num24);
//module FD2(Q,D,CLK,RESET,number);
assign num=num1+num2+num3+num4+num5+num6+num7+num8+num9+num10+num11+num12+num13+num14+num15+num16+
num17+num18+num16+num17+num18+num19+num20+num21+num22+num23+num24;
endmodule
//----------------------------------------------------------
module stage7(clk,rst_n,R0,B0,A,Q1,Q2,R,A2,B2,num);
input clk,rst_n;
input [5:0]R0;
input [4:0]B0;//R0,B0
input [7:0]A,Q1;//i_a
output[5:0]R;//R1,B1
output[4:0]B2;
output [7:0]Q2,A2;
output[50:0]num;
//----------------------------------------------------------------
//module MUX21H(Z,A,B,CTRL,number);
wire [50:0]num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
wire [50:0]num12,num13,num14,num15,num16,num17,num18,num19,num20,num21,num22,num23,num24;
wire [4:0]R1;
wire Q_;
wire [4:0]s0,s1,s2;

subtract2 sub40(R0,B0,s0,Q_,num1);
MUX21H an42(R1[4],R0[4],s0[4],Q_,num2);
MUX21H an43(R1[3],R0[3],s0[3],Q_,num3);
MUX21H an44(R1[2],R0[2],s0[2],Q_,num4);
MUX21H an45(R1[1],R0[1],s0[1],Q_,num5);
MUX21H an46(R1[0],R0[0],s0[0],Q_,num6);

FD2 rf2(R[5],R1[4],clk,rst_n,num7);
FD2 rf3(R[4],R1[3],clk,rst_n,num8);
FD2 rf4(R[3],R1[2],clk,rst_n,num9);
FD2 rf5(R[2],R1[1],clk,rst_n,num10);
FD2 rf6(R[1],R1[0],clk,rst_n,num11);
FD2 rf7(R[0],A[0],clk,rst_n,num12);

FD2 f8 (B2[4],B0[4],clk,rst_n,num13);
FD2 f9 (B2[3],B0[3],clk,rst_n,num14);
FD2 f10(B2[2],B0[2],clk,rst_n,num15);
FD2 f11(B2[1],B0[1],clk,rst_n,num16);
FD2 f12(B2[0],B0[0],clk,rst_n,num17);

FD2 qf1(Q2[5],Q1[5],clk,rst_n,num18);
FD2 qf2(Q2[6],Q1[6],clk,rst_n,num19);
FD2 qf3(Q2[7],Q1[7],clk,rst_n,num20);
FD2 qf4(Q2[4],Q1[4],clk,rst_n,num21);
FD2 qf5(Q2[3],Q1[3],clk,rst_n,num22);
FD2 qf6(Q2[2],Q1[2],clk,rst_n,num23);
FD2 qf7(Q2[1],Q_,clk,rst_n,num24);
//module FD2(Q,D,CLK,RESET,number);
assign num=num1+num2+num3+num4+num5+num6+num7+num8+num9+num10+num11+num12+num13+num14+num15+num16+
num17+num18+num16+num17+num18+num19+num20+num21+num22+num23+num24;
endmodule
//--------------------------------------
module stage8(clk,rst_n,R0,B0,A,Q1,Q2,R,num);
input clk,rst_n;
input [5:0]R0;
input [4:0]B0;//R0,B0
input [7:0]A,Q1;//i_a
output[4:0]R;//R1,B1
output [7:0]Q2;
output[50:0]num;
//----------------------------------------------------------------
//module MUX21H(Z,A,B,CTRL,number);
wire [50:0]num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
wire [50:0]num12,num13,num14,num15,num16,num17,num18,num19,num20,num21,num22,num23,num24;
wire [4:0]R1;
wire Q_;
wire [4:0]s0,s1,s2;
subtract2 sub40(R0,B0,s0,Q_,num1);
MUX21H an42(R1[4],R0[4],s0[4],Q_,num2);
MUX21H an43(R1[3],R0[3],s0[3],Q_,num3);
MUX21H an44(R1[2],R0[2],s0[2],Q_,num4);
MUX21H an45(R1[1],R0[1],s0[1],Q_,num5);
MUX21H an46(R1[0],R0[0],s0[0],Q_,num6);
//assign R=R1[4:0];
FD2 rf7(R[0],R1[0],clk,rst_n,num7);
FD2 rf3(R[4],R1[4],clk,rst_n,num8);
FD2 rf4(R[3],R1[3],clk,rst_n,num9);
FD2 rf5(R[2],R1[2],clk,rst_n,num10);
FD2 rf6(R[1],R1[1],clk,rst_n,num11);

//module FD2(Q,D,CLK,RESET,number);
//assign Q2={Q1[7:1],Q_};
FD2 qf1(Q2[5],Q1[5],clk,rst_n,num12);
FD2 qf2(Q2[6],Q1[6],clk,rst_n,num13);
FD2 qf3(Q2[7],Q1[7],clk,rst_n,num14);
FD2 qf4(Q2[4],Q1[4],clk,rst_n,num15);
FD2 qf5(Q2[3],Q1[3],clk,rst_n,num16);
FD2 qf6(Q2[2],Q1[2],clk,rst_n,num17);
FD2 qf7(Q2[1],Q1[1],clk,rst_n,num18);
FD2 qf8(Q2[0],Q_,clk,rst_n,num19);
assign num=num1+num2+num3+num4+num5+num6+num7+num8+num9+num10+num11+num12+num13+num14+num15+num16+
num17+num18+num16+num17+num18+num19;
endmodule

//=================================================================
//module FA1(CO,S,A,B,CI,number);
module subtract(A,B,S,co,number);
	input  [4:0]A,B;
	output [4:0]S;
	output co;
	output [50:0] number;
	wire c0,c1,c2,c3,c4,c5;
	wire [50:0] num0,num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
	//FA1 fa1(c1,S[0],A[0],B[0],1'b1,num5);
	OR2 or1(c1,A[0],B[0],num4);
	EN  eo2(S[0],A[0],B[0],num5);
	FA1 fa2(c2,S[1],A[1],B[1],c1,  num6); 
	FA1 fa3(c3,S[2],A[2],B[2],c2,  num7); 
	FA1 fa4(c4,S[3],A[3],B[3],c3,  num8); 
	FA1 fa5(co,S[4],A[4],B[4],c4,  num9);  
	assign number=num4+num5+num6+num7+num8+num9;
endmodule

module subtract2(A,B,S,co,number);
	input  [5:0]A;
	input  [4:0]B;
	output [4:0]S;
	output co;
	output [50:0] number;
	wire c0,c1,c2,c3,c4,c5;
	wire [50:0] num0,num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
	wire s1;
	//FA1 fa1(c1,S[0],A[0],B[0],1'b1,num5);
	OR2 or1(c1,A[0],B[0],num4);
	EN  eo2(S[0],A[0],B[0],num5);
	FA1 fa2(c2,S[1],A[1],B[1],c1,  num6); 
	FA1 fa3(c3,S[2],A[2],B[2],c2,  num7); 
	FA1 fa4(c4,S[3],A[3],B[3],c3,  num8); 
	FA1 fa5(c5,S[4],A[4],B[4],c4,  num9);
	OR2 fa6(co,A[5],c5,num10);    
	assign number=num4+num5+num6+num7+num8+num9+num10;
endmodule
//-----------------------------------------------------------------------------

//BW-bit FD2
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