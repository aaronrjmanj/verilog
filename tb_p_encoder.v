`include"encoder2.v"
module tb_p_encoder();
 reg [3:0] din;
 wire [1:0] yout;
encoder dut(.din(din),.yout(yout));
initial 
begin
	#10;
	din=4'b0100; // yout = 2
	#10; din=4'b0001;// yout = 0
	#10; din=4'b0010;
	#10; din=4'b0100;
    #10; din=4'b1000;
end
endmodule
