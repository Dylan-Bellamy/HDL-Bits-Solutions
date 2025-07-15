module dlatch_circuit(
   input d, 
   input ena,
   output q
);
	// Note that this is a latch, so a Quartus warning about having inferred a latch is expected.
   assign q = ena ? d : q;
endmodule 