module norgate_module (
	input a, b, 	
	output out );
	assign out = ~(a | b);
endmodule 