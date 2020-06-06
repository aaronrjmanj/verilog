`include"beh_upcounter.v"
module tb_upcounter;
reg clk,rst;
wire [2:0] count;
upcounter dut(.clk(clk),.rst(rst),.count(count));
initial begin
 clk=0;
 forever #5 clk=~clk;
end

//apply reset

initial begin
 rst=1;
 #20;
 rst=0;
 //wait for some time
 #1000;
 $finish;
end

endmodule
