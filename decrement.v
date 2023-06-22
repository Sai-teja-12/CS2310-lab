`timescale 1ns/1ns

module decrem(
  input wire[7:0] i,
  output wire[7:0] o
  );
  wire [7:0] w1;
  wire [7:0] w2;
  wire cin;
  buf(w2[0],1);
  buf b[7:1](w2[7:1],7'b0);
  buf(cin,0);
  //A-1 = A+2scomplement of 1 = A+8b'11111111
  two_comp td(w2,w1);
  RCA8 R2(i,w1,cin,o);

endmodule