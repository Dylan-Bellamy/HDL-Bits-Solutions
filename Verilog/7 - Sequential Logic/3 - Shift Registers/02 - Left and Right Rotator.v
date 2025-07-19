module rotate100_circuit(
   input clk,
   input areset,  // async active-high reset to zero
   input load,
   input ena,
   input [3:0] data,
   output reg [3:0] q
); 
	always @(posedge clk or posedge areset) begin
		if (areset) begin
			q <= 0;
		end else begin
			if (load) begin
				q <= data;
			end else if (ena) begin
				q <= {1'b0, q[3], q[2], q[1]}; // q >> 1; also works
			end
		end
	end
endmodule
