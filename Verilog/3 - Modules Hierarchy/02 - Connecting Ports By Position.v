module module_pos_module ( 
   input a, 
   input b, 
   input c,
   input d,
   output out1,
   output out2
);
	// We are given module mod_a
	// module mod_a ( output out1, output out2, input in1, input in2, input in3, input in4);
	mod_a instance1 ( out1, out2, a, b, c, d );
endmodule
