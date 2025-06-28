`timescale 1ns / 1ps
module jk(clk,j,k,q,qbar);
 input j,k,clk;
 output reg q, qbar;
 always@(negedge clk)
 begin
 if(j==0 && k==0)
   begin
   qbar<=qbar;
   q <= q;
   end
 else if(j==1 && k==1)
  begin
   q <= ~q;
   qbar <= ~qbar;
  end
 else if(j==0 && k==1)
  begin
   q <= 1'b0;
   qbar <= 1'b1;
  end
  else if(j==1 && k==0)
  begin
   q <= 1'b1;
   qbar <= 1'b0;
  end
  else
  begin 
  qbar<=qbar;
   q <= q;
  end
 end 
endmodule

module seq_det(
//clk1,q1,q2,qbar1,qbar2
);
 //input clk1;
 //output q1,q2,qbar1,qbar2;
  jk jk1(.clk(clk1),.j(j1),.k(k1),.q(q1),.qbar(qbar1));
  jk jk2(.clk(clk1),.j(j2),.k(k2),.q(q2),.qbar(qbar2));
  
endmodule
