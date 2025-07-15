module kmap2_circuit(
   input a,
   input b,
   input c,
   input d,
   output out  
); 
   // POS form: out = ((~a|~b|c) & (~b|c|~d) & (a|b|~c|~d) & (~a|~c|d))
   assign out = (~a|~b|c) & (~b|c|~d) & (a|b|~c|~d) & (~a|~c|d);
endmodule 