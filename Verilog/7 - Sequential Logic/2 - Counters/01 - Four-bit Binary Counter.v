module count15_circuit(
   input clk,
   input reset,      // Synchronous active-high reset
   output reg [3:0] q
);
	always @(posedge clk) begin 
		q <= reset ? 4'b0 : q + 4'b1;
	end
endmodule 