`timescale 1ns / 1ps
module tb();
  reg clk, i;
  wire y1;
  seq_det s1(.clk1(clk),.i(i),.y(y1));
  initial begin
  force s1.jk1.q = 1'b0;
  force s1.jk1.qbar = 1'b1;
  force s1.jk2.q = 1'b0;
  force s1.jk2.qbar = 1'b1;
  #20
  release s1.jk1.q;
  release s1.jk1.qbar;
  release s1.jk2.q;
  release s1.jk2.qbar;
  end
  
  initial clk=0;
  always #5 clk = ~clk;
  
  initial begin
        i = 0;
        
        
        // Apply sequence: 1011
        i = 1; #10;  // 1
        i = 0; #10;  // 0  
        i = 1; #10;  // 1
        i = 1; #10;  // 1 -> should detect here
        
        // Apply another sequence: 1011
        i = 0; #10;
        i = 1; #10;  // 1
        i = 0; #10;  // 0
        i = 1; #10;  // 1  
        i = 1; #10;  // 1 -> should detect here
        
        #20;
        $finish;
    end
endmodule
