`include"mux_and.v"
module tb_mux_and;
reg in0,in1,s;
wire y;
mux_and dut(0,in1,in0,y);//mapping the inputs according to the desired gates(AND)
initial 
begin
	 in0=0; in1=1; // in0 is the s
        #5; in0=1; in1=0;//y=1*0=0 
	#5; in0=1;in1=1;//y=1*1=1
	#5; in0=0;in1=$random;
	#5; in0=1;in1=1; #5;
	
end
endmodule
	
