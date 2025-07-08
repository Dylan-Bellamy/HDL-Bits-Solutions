module modules_module ( input a, input b, output out );
	// We are given module mod_a
	// module mod_a ( input in1, input in2, output out );
   mod_a instance1 ( .out(out), .in1(a), .in2(b) );
endmodule 