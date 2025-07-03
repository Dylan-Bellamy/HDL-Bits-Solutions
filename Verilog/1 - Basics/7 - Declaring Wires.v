module wires_module (    
	input a,
   input b,
   input c,
   input d,
   output out,
   output out_n ); 
	 
	wire a_and_b;
	wire c_and_d;
	wire ab_or_cd;
	 
	assign out = ab_or_cd;
	assign out_n = ~ab_or_cd;
	assign ab_or_cd = a_and_b | c_and_d;
	assign a_and_b = a & b;
	assign c_and_d = c & d;
endmodule 