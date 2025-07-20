module rule110_circuit(
   input clk,
   input load,
   input [511:0] data,
   output reg [511:0] q
); 
	// left (l): {1'b0, q[511:1]}    right (r): {q[510:0], 1'b0}    center (c): q[511:0]
   // POS form: ~(l + c + r)(l + ~c + ~r)(l + c + r)
   // Simplified => (c + r)(~l + ~c + ~r)
   always @(posedge clk) begin 
		if (load) begin
			q <= data;
		end else begin
			q <= (q[511:0]|{q[510:0], 1'b0})&(~{1'b0, q[511:1]}|~q[511:0]|~{q[510:0], 1'b0});
		end
   end
endmodule 