module mux_and(in0,in1,s,y);
input in0,in1,s;
output reg y;
always@(in0 or in1 or s)//x is the select line
 begin
  if(s)
	  y=in1;
        // $display("%0d",y);
  else 
	  y=in0;
 end
endmodule
