module q2bfsm_circuit(
   input [5:0] y,
   input w,
   output Y1,
   output Y3
);
   assign Y1 = (y[0] == 1)&&(w);
   assign Y3 = ((y[0] != 1)&&(y[3] != 1))&&(~w);
endmodule
