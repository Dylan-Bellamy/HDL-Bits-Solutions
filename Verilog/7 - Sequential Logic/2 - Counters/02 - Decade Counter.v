module count10_circuit(
   input clk,
   input reset,        // Synchronous active-high reset
   output reg [3:0] q
);
	always @(posedge clk) begin
		q <= reset|(q==4'h9) ? 4'b0 : q+1'b1;
	end
endmodule 