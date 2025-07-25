module kmap5_circuit(
   input a,
   input b,
   input c,
   input d,
   output out_sop,
   output out_pos
); 
   assign out_sop = (c&d) | (c&~a&~b);
   assign out_pos = (c) & (~a|b) & (~b|~c|d);
endmodule 