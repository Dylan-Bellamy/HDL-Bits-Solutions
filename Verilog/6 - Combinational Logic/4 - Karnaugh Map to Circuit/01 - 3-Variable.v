module kmap1_circuit(
   input a,
   input b,
	input c,
   output out  
); 
   // SOP form: Three prime implicants (1 term each), summed.
	// out = (b) | (c) | (a)
	// POS form: One prime implicant (of 3 terms)
	// out = (a|b|c)
	// In this particular case, the result is the same for both SOP and POS.
	assign out = a|b|c ? 1'b1 : 1'b0;
endmodule 