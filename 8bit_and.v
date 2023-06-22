`timescale 1ns/1ns
module bitwiseand(
  input wire[7:0] a,b,
  output wire[7:0] o
);
and A[7:0](o[7:0],a[7:0],b[7:0]);

endmodule