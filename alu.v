`timescale 1ns/1ns
`include "8bit_and.v"
`include "8bit_or.v"
`include "decrement.v"
`include "sub8bit.v"
module alu(
  input wire[7:0] op1,op2,
  input wire[2:0] sel,
  output wire[7:0] result
);
  wire c0,c1;
  buf(c0,0);
  buf(c1,1);
  // sel1, sel2,... to compute add result, sub result, increment result,... 
  wire [7:0] sel1;
  wire [7:0] sel2;
  wire [7:0] sel3;
  wire [7:0] sel4;
  wire [7:0] sel5;
  wire [7:0] sel6;
  wire [7:0] sel7;
  
  RCA8 RRR(op1,op2,c0,sel1);
  sub SS(op1,op2,sel2);
  increm II(op1,sel3);
  decrem DD(op1,sel4);
  bitwiseand BA(op1,op2,sel5);
  bitwiseor BO(op1,op2,sel6);
  bitwisenot BN(op1,sel7);

  wire s0bar,s1bar,s2bar;
  not n0(s0bar,sel[0]);
  not n1(s1bar,sel[1]);
  not n2(s2bar,sel[2]);
  
 
  wire [7:0] ww1,ww2,ww3,ww4,ww5,ww6,ww7;//computing possible combinations of sel[2](~sel[2]),sel[1],... and store in ww1[0], ww2[0],... 
  and aa1(ww1[0],s2bar,s1bar,sel[0]);
  and aa2(ww2[0],s2bar,sel[1],s0bar);
  and aa3(ww3[0],s2bar,sel[1],sel[0]);
  and aa4(ww4[0],sel[2],s1bar,s0bar);
  and aa5(ww5[0],sel[2],s1bar,sel[0]);
  and aa6(ww6[0],sel[2],sel[1],s0bar);
  and aa7(ww7[0],sel[2],sel[1],sel[0]);
  
  //converting 1b'1 into 8'b00000001 and converting 1b'0 into 8'b00000000
  buf b1[7:1](ww1[7:1],7'b0);
  buf b2[7:1](ww2[7:1],7'b0);
  buf b3[7:1](ww3[7:1],7'b0);
  buf b4[7:1](ww4[7:1],7'b0);
  buf b5[7:1](ww5[7:1],7'b0);
  buf b6[7:1](ww6[7:1],7'b0);
  buf b7[7:1](ww7[7:1],7'b0);
  
  wire [7:0] www1,www2,www3,www4,www5,www6,www7;
  // converting 8'b0 into 8'b00000000(itself) and 8'b1 into 8'b11111111
  two_comp t1(ww1,www1);
  two_comp t2(ww2,www2);
  two_comp t3(ww3,www3);
  two_comp t4(ww4,www4);
  two_comp t5(ww5,www5);
  two_comp t6(ww6,www6);
  two_comp t7(ww7,www7);

   // and of either all 0s and add,sub,.. or and of all 1s and add,subresult,...
  wire [7:0] a1,a2,a3,a4,a5,a6,a7;
  bitwiseand ba1(www1,sel1,a1);
  bitwiseand ba2(www2,sel2,a2);
  bitwiseand ba3(www3,sel3,a3);
  bitwiseand ba4(www4,sel4,a4);
  bitwiseand ba5(www5,sel5,a5);
  bitwiseand ba6(www6,sel6,a6);
  bitwiseand ba7(www7,sel7,a7);
// or of all those add ,sub,...results gives required answer
  or OO[7:0](result[7:0],a1[7:0],a2[7:0],a3[7:0],a4[7:0],a5[7:0],a6[7:0],a7[7:0]);

endmodule