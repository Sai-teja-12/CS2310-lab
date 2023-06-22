`timescale 1ns/1ns
`include "8bit_not.v"  // we need this for 1s complement
`include "increment.v"  // for increment
module two_comp(
  input wire[7:0] i,
  output wire[7:0] o
);
  wire [7:0] i_comp;
  bitwisenot not1(i,i_comp);
  increm inc(i_comp,o);
  //2s complement=1scomplement+1

endmodule