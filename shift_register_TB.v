module shift_reg_TB;
 reg clock, clear,in;
 wire out;
 integer i;
  shiftreg x(clock,clear,in,out);   
   initial begin clock=1'b0; #2 clear=0;#5 clear=1;
   end 
  always #5 clock=~clock;
  initial begin #2
   repeat(2)
    begin
     #10 in=0;
     #10 in=0;
     #10 in=1;
     #10 in=1;
   end   
 end   
 initial 
  begin 
    $dumpfile("shif.vcd");
    $dumpvars(0,shift_reg_TB);//dumps all the variables in this module
   #200 $finish; //finish the smiluation or clock
  end   
endmodule