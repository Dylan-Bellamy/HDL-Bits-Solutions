module fadd_circuit( 
   input a, b, cin,
   output cout, sum 
);
   assign sum = a^b^cin;
	assign cout = (a&b)|(a&cin)|(b&cin);
endmodule 