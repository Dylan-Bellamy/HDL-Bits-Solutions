module kmap7_circuit(
   input [4:1] x,
   output f
); 
   // SOP form: (~x[2]~x[4]) + (~x[1]x[3]) + (x[2]x[3]x[4])
   assign f = (~x[2]&~x[4]) | (~x[1]&x[3]) | (x[2]&x[3]&x[4]);
endmodule 