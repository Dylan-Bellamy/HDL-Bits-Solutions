module lfsr32_circuit(
   input clk,
   input reset,    // Active-high synchronous reset to 32'h1
   output reg [31:0] q
); 
	always @(posedge clk) begin
		if (reset) begin 
			q <= 32'h1;
		end else begin
			q[31:0] <= {q[0], q[31:1]};
			q[31] <= q[0]^1'b0;
			q[21] <= q[22]^q[0];
			q[1] <= q[2]^q[0];
			q[0] <= q[1]^q[0];
		end
	end
endmodule 