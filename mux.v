module mux(out,in,sel);
 output out;
 input[15:0] in;
 input[5:0] sel;
 assign out=in[sel];
endmodule 
