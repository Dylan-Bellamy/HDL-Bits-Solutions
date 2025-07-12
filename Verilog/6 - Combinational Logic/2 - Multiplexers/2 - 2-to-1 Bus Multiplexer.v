module mux2to1v_circuit( 
   input [99:0] a, b,
   input sel,
   output [99:0] out 
);
	assign out = sel ? b : a;	
endmodule 