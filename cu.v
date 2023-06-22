`timescale 1ns/1ns
`include "alu.v"
module cu(
  input wire[18:0] inp,
  output wire[7:0] result     
);
  //creating sel lines and operands
  wire [2:0] sel;
  wire [7:0] op1,op2;
  buf b[2:0](sel[2:0],inp[18:16]);
  buf b1[7:0](op1[7:0],inp[15:8]);
  buf b2[7:0](op2[7:0],inp[7:0]);
  //sending opcode and operands to the ALU
  alu ALU1(op1,op2,sel,result);

endmodule