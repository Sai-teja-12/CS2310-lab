`timescale 1ns/1ns
module fa(a,b,cin, sum,cout);
  input a,b,cin;
  output sum,cout;
  wire w1,w2,w3;
  //sum=a^b^cin ,  cout=a.b+b.cin+a.cin;
  xor(sum,a,b,cin);
  and(w1,a,b);
  and(w2,a,cin);
  and(w3,b,cin);
  or(cout,w1,w2,w3);


endmodule