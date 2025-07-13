module adder3_circuit( 
   input [2:0] a, b,
   input cin,
   output [2:0] cout,
   output [2:0] sum 
);
	wire s1, s2, s3, c1, c2, c3;
	
   fadd_circuit in1 ( .a(a[0]), .b(b[0]), .cin(cin), .cout(c1), .sum(s1) );
   fadd_circuit in2 ( .a(a[1]), .b(b[1]), .cin(c1), .cout(c2), .sum(s2) );
   fadd_circuit in3 ( .a(a[2]), .b(b[2]), .cin(c2), .cout(c3), .sum(s3) );
	
   assign sum = {s3, s2, s1};
   assign cout = {c3, c2, c1};
endmodule 