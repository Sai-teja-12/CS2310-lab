`timescale 1ns/1ns
module bitwisenot(
  input wire[7:0] a,
  output wire[7:0] a_comp
);
  not n[7:0](a_comp[7:0],a[7:0]);

endmodule