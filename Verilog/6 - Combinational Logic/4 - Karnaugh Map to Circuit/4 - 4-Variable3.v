module kmap4_circuit(
   input a,
   input b,
   input c,
   input d,
   output out  
); 
	assign out = a^b^c^d;
endmodule 