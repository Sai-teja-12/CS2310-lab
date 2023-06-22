`timescale 1ns/1ns
module bitwiseor(
  input wire[7:0] a,b,
  output wire[7:0] o
);
  or O[7:0](o[7:0],a[7:0],b[7:0]);
  
endmodule