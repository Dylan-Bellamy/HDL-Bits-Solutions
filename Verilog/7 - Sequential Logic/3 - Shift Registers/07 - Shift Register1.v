module shiftregister1_circuit(
   input clk,
   input resetn,   // synchronous reset
   input in,
   output reg out
);
   reg [2:0] Q;
	always @(posedge clk) begin
		if (~resetn) begin
			{out, Q} <= 4'b0;
		end else begin
			Q[0] <= in;
			{out, Q[2:1]} <= Q[2:0];
		end
	end
endmodule 