module mux256to1v_circuit( 
   input [1023:0] in,
   input [7:0] sel,
   output [3:0] out 
);
   assign out = {in[4*sel+3], in[4*sel+2], in[4*sel+1], in[4*sel]};
endmodule 