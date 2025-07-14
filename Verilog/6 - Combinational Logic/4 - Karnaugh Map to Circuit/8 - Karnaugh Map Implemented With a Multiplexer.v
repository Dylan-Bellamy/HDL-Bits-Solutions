module kmap8_circuit(
   input c,
   input d,
   output [3:0] mux_in
); 
   // Splitted kmap into 4 vertiacal truth maps for each ab value in cd
   assign mux_in[0] = c|d;
   assign mux_in[1] = 1'b0;
   assign mux_in[2] = ~d;
   assign mux_in[3] = c&d;       
endmodule 