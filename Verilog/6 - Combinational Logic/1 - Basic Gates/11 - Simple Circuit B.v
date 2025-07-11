module B_circuit ( input x, input y, output z );
	assign z = ~(x^y);
endmodule 