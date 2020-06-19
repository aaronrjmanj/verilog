/* Write a testbench for the memory using front door access*/
`include"memory_fr.v"
module tb_mem_fr;

reg clk_i,rst_i;
parameter WIDTH=16;
parameter DEPTH=64;
parameter ADDR_WIDTH=6; //6'b000_000

reg [ADDR_WIDTH-1:0]addr_i;
reg[WIDTH-1:0]wdata_i;
wire [WIDTH-1:0] rdata_o;
reg w_r_data_i;
reg valid_i;
wire ready_o;
integer i;

memory #(.DEPTH(DEPTH),.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH))dut(clk_i, rst_i, addr_i, wdata_i, w_r_data_i,rdata_o, valid_i, ready_o); // Parameter Overriding

initial begin
 clk_i=0;
 forever #5 clk_i=~clk_i;
end
initial begin
 rst_i=1;
 repeat(2)@(posedge clk_i);
 rst_i=0;
 fd_wr_mem();//task
 fd_rd_mem();
 
 #100; 
 $finish;
end

task fd_wr_mem();
	begin
	 for(i=0;i<DEPTH;i=i+1) begin
	  @(posedge clk_i);
	  addr_i=i;
	  wdata_i=$random;
	  w_r_data_i=1;
	  valid_i=1;
	  wait (ready_o == 1);
	 end
	 @(posedge clk_i)
	 addr_i = 0;
	 wdata_i = 0;
	 w_r_data_i = 0;
	 valid_i = 0;
        
 end
 endtask

task fd_rd_mem();
	begin
	 for(i=0;i<DEPTH;i=i+1) begin
	  @(posedge clk_i);
	  addr_i=i;
	  w_r_data_i=0;//to denote read operation
	  valid_i=1;
	  wait (ready_o == 1);
	 end
	 @(posedge clk_i)
	 addr_i = 0;
	 wdata_i = 0;
	 w_r_data_i = 0;
	 valid_i = 0;
 end
       

endtask


endmodule
