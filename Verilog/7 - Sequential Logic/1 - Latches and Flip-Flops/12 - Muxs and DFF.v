module muxdff2_circuit(
   input clk,
   input w, R, E, L,
   output reg Q
);
   wire mux1;
   assign mux1 = E ? w : Q;
    
	always @(posedge clk) begin
		Q <= L ? R : mux1;
	end
endmodule 