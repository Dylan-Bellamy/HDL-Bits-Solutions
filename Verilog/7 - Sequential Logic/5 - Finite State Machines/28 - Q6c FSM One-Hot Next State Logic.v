module q6cfsm_circuit(
   input [6:1] y,
   input w,
   output Y2,
   output Y4
);
	assign Y2 = (y[1] == 1)&&(~w);
   assign Y4 = ((y[1] != 1)&&(y[4] != 1))&&(w);
endmodule 