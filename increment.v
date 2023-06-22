`timescale 1ns/1ns
`include "add8bit.v"
module increm(
  input wire[7:0] i,
  output wire[7:0] o    
);
  wire [7:0] i2;
  buf b[7:0](i2[7:0],8'b0);
  wire ci;
  buf(ci,1);
  //for 8bit adder inputs are i,8'b0 and cin=1;
  RCA8 Rinc(i,i2,ci,o);


endmodule