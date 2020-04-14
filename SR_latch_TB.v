module latchTB;
reg s,r;
wire q,qbar;
srlatch tb(q,qbar,s,r);        //instanciation
initial
begin    
 $dumpfile("srlatch.vcd");     //gtkwave 
 $dumpvars(0,latchTB);        //gtkwave 
 $monitor($time,"S=%b,R=%b,Q=%b,Qbar=%b",s,r,q,qbar);
 s=1'b0;
 r=1'b1;
 #5 s=1'b1; r=1'b1;
 #5 s=1'b0; r=1'b1;
 #5 s=1'b1; r=1'b1;
 #5 s=1'b1; r=1'b0;
 #10 s=1'b1;r=1'b1;
end 
endmodule