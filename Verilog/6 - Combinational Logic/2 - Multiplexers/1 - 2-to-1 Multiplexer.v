module mux2to1_circuit( 
   input a, b, sel,
   output out 
); 
	assign out = sel ? b : a;
endmodule 