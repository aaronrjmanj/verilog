//3 bit Upcounter using behaviour modelling
// Verilog HDL
module upcounter(clk,rst,count);
input clk,rst;
  output reg [2:0]count; //3-bit up counter - increase the counter value by incrementing the bit
  always@(posedge clk) begin
    if(rst==1) count=0; // for single line dont need begin end
    else count=count+1;
  end
endmodule
