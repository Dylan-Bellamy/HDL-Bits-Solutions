module kmap6_circuit(
   input [4:1] x, 
   output f 
);
   // POS form: (x[3]+x[4])(~x[1]+x[2])(~x[1]+~x[3])(x[1]+x[3])
   assign f = (x[3]|x[4]) & (~x[1]|x[2]) & (~x[1]|~x[3]) & (x[1]|x[3]);
endmodule 