module rule90_circuit(
   input clk,
   input load,
   input [511:0] data,
   output reg [511:0] q 
); 
   always @(posedge clk) begin
		if (load) begin
			q <= data;
		end else begin
			// Rule 90
			// Left Neighbour XOR'd with Right Neighbour
			q <= {1'b0, q[511:1]} ^ {q[510:0], 1'b0};
		end
	end
endmodule 