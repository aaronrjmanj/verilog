/* Design a 1Kb memory using front door access method */

//1Kb = 1024 bits 
//SIZE=1024
//WIDTH=16
//DEPTH=1024/16 = 64
//addr= 6 (2**6=64) 

module memory
             (clk_i,
	      rst_i,
	      addr_i,
	      wdata_i,
	      w_r_data_i,
	      rdata_o,
	      valid_i,
	      ready_o); 
// _i denotes input, _o denotes output, w denotes write operation, r denotes read operation
input clk_i,rst_i;
parameter WIDTH=16;
parameter DEPTH=64;
parameter ADDR_WIDTH=6; //6'b000_000

input [ADDR_WIDTH-1:0]addr_i;
input[WIDTH-1:0]wdata_i;
output reg [WIDTH-1:0] rdata_o;
input w_r_data_i;
input valid_i;
output reg ready_o;

// declare memory - Array of Vectors

reg[WIDTH-1:0]mem[DEPTH-1:0];
integer i;

always@(posedge clk_i)
 begin
	 if(rst_i==1)begin
	  ready_o=0;
	  rdata_o=0;
	  for(i=0;i<DEPTH;i=i+1)begin
	   mem[i]=0; // clearing all the memory 
	  end
	 end
	 else begin
	  if(valid_i==1)begin
	   ready_o=1;
	   //write tranx
	    if(w_r_data_i==1)begin
	     mem[addr_i]=wdata_i; // write the data
	    end
	    // read trax
	    else begin
	     rdata_o=mem[addr_i]; // read the data 
	    end
	  end
	  else begin
	  ready_o=0;
	  end

	 end
 end


endmodule
