`timescale 1ns/1ns
`include "2s_comp.v"

module sub(
  input wire[7:0] a,b,
  output wire[7:0] o
);
  wire [7:0] twos_b;
  wire ci;
  buf(ci,0);
  //A-B = A + ~B + 1;
  two_comp t1(b,twos_b);
  RCA8 RR(a,twos_b,ci,o);

endmodule