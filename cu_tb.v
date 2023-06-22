`timescale 1ns/1ns
module cu_v2_tb;

  reg [18:0] instruction;
  wire [7:0] result;

  cu uut (instruction, result);

  initial begin

    //$monitor("")
    $dumpfile ("cu_v2_tb.vcd");
    $dumpvars(0,cu_v2_tb);
  
     instruction = 19'b0010010001100010100; #20; //addition
     instruction = 19'b0100010001100010100; #20;  //subtraction
     instruction = 19'b0110010001100010100; #20;  //increment
     instruction = 19'b1000010001100010100; #20;  //decrement
     instruction = 19'b1010010001100010100; #20;   //bitwise and
     instruction = 19'b1100010001100010100; #20;   //bitwise or
     instruction = 19'b1110010001100010100; #20;   //bitwise not

    
    
    $display("Test completed");
    


    
  end
  
endmodule