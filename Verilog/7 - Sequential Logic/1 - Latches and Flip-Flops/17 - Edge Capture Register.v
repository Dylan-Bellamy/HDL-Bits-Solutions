module edgecapture_circuit(
   input clk,
   input reset,
   input [31:0] in,
   output reg [31:0] out
);
   reg [31:0] d = 32'b0;
   always @(posedge clk) begin
		out <= reset ? 32'b0 : (d&~in)|(out);
		d <= in;
	end
endmodule 