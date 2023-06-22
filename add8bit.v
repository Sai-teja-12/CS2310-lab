`timescale 1ns/1ns
`include "fulladder.v"
module RCA8(
  input wire[7:0] a,b,
  input ci,
  output wire[7:0] s
);
  wire [7:0] c;
  // we use the carry c[i] as input for F[i+1] and get output c[i+1]
  fa fa1(a[0],b[0],ci,s[0],c[0]);
  fa F[7:1](a[7:1],b[7:1],c[6:0],s[7:1],c[7:1]);
  // the required sum is stored in s
endmodule