module truthtables_circuit( 
   input x3,
   input x2,
   input x1,  // three inputs
   output f   // one output
);
   wire row2, row3, row5, row7;
   assign row2 = ~x3&x2&~x1;
   assign row3 = ~x3&x2&x1;
   assign row5 = x3&~x2&x1;
	assign row7 = x3&x2&x1;
   assign f = row2|row3|row5|row7;
	// It can be simplified, by boolean algebra or Karnaugh maps.
	// assign f = (~x3 & x2) | (x3 & x1);
endmodule 