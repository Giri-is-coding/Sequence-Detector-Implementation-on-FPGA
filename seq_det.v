`timescale 1ns / 1ps

module jk(clk,j,k,q,qbar);
 input j,k,clk;
 output reg q,qbar;
 initial begin 
 q<=1'b0;
 qbar<=1'b1;
 end
 always@(negedge clk)
 begin
 if(j==1'b0 & k==1'b0)
   begin
   qbar<=qbar;
   q <= q;
   end
 else if(j==1'b1 & k==1'b1)
  begin
   q <= ~q;
   qbar <= ~qbar;
  end
 else if(j==1'b0 & k==1'b1)
  begin
   q <= 1'b0;
   qbar <= 1'b1;
  end
  else if(j==1'b1 & k==1'b0)
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
clk1,i,y
);
 input clk1,i;
 output y;
 wire j1,j2,k1,k2;
 wire q1,q2,qbar1,qbar2;
  jk jk1(.clk(clk1),.j(j1),.k(k1),.q(q1),.qbar(qbar1));
  jk jk2(.clk(clk1),.j(j2),.k(k2),.q(q2),.qbar(qbar2));
  assign j1=(~i & qbar2 & qbar1)|(i & q2 & qbar1);
  assign k1=(~i & q1);
  assign j2=(i & qbar2 & q1);
  assign k2=q2 & ((~i & q1)|(i & q1));
  assign y=q2 & q1 & i;
endmodule
