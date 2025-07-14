module kmap3_circuit(
   input a,
   input b,
   input c,
   input d,
   output out  
); 
	// SOP form: out = a | ~b&c;
   assign out = a | ~b&c;
endmodule 