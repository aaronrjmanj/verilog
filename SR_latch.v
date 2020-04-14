module srlatch(q,qbar,s,r);
 output q,qbar;
 input s,r;
 assign q=~(qbar&r);
 assign qbar=~(s&q);
endmodule