module countslow_circuit(
	input clk,
	input slowena,
	input reset,
	output reg [3:0] q
);
	always @(posedge clk) begin
		if (reset | (q == 4'h9)&slowena) begin
			q <= 4'b0;
		end else if (slowena) begin
			q <= q + 4'b1;
		end else begin
			q <= q;
		end
	end
endmodule 