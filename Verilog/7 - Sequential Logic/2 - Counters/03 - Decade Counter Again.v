module count1to10(
   input clk,
   input reset,
   output [3:0] q
);
	always @(posedge clk) begin     
		if (reset | (q == 4'b1010)) begin
			q <= 4'b1;
		end else begin
			q <= q + 4'b1;
		end
	end
endmodule 