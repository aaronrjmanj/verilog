module p_encoder(din,yout);
input[3:0] din;
output reg[1:0] yout;
always@(din)
 begin
  if(din[3])
  begin
   yout=2'd3;
  end
  else if(din[2])
  begin
   yout=2'd1;
  end
  else if(din[1])
  begin
   yout=2'd0;
  end
  else if(din[8])
  begin
   yout=2'd3;
  end
  $monitor("yout=%d",yout);
 end
endmodule
