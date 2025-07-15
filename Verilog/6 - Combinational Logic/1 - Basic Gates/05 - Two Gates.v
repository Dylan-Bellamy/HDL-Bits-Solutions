module twogates_circuit(
   input in1,
   input in2,
   input in3,
   output out
);
	wire xnor1;
   assign xnor1 = ~(in1^in2);
   assign out = xnor1^in3;
endmodule 