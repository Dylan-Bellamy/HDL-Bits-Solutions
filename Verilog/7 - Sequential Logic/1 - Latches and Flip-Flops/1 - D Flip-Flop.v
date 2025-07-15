module dff_circuit(
   input clk,    
   input d,
   output reg q 
);
	// Clocks are used in sequential circuits
   always @(posedge clk) begin
      q <= d;
   end
endmodule 