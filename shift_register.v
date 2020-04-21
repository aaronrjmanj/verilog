module shiftreg(clock,clear,a,e);
	output reg e; 
	reg b,c,d;
	input clock,clear,a; 
  always@(posedge clock or negedge clear)
	 begin
	  if(!clear)
	   begin
	   b<=0;c<=0;d<=0;e<=0; // non blocking statement"runs in prallel"
	   end
	  else
	   begin
	   e<=d;
	   d<=c;
	   c<=b;
	   b<=a;
	   end
	 end   
endmodule	 