module adder_exam(
   input [3:0] x,
   input [3:0] y, 
   output [4:0] sum
);
   wire s1, s2, s3, c1, c2, c3;
	
   fadd_circuit in1 ( .a(x[0]), .b(y[0]), .cin(0), .cout(c1), .sum(sum[0]) );
   fadd_circuit in2 ( .a(x[1]), .b(y[1]), .cin(c1), .cout(c2), .sum(sum[1]) );
   fadd_circuit in3 ( .a(x[2]), .b(y[2]), .cin(c2), .cout(c3), .sum(sum[2]) );
   fadd_circuit in4 ( .a(x[3]), .b(y[3]), .cin(c3), .cout(sum[4]), .sum(sum[3]) );
endmodule 