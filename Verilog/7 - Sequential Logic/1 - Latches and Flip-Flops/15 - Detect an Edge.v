module edgedetect1_circuit(
   input clk,
   input [7:0] in,
   output reg [7:0] pedge
);
   reg [7:0] d = 8'b0;
	always @(posedge clk) begin
		pedge <= in&~d;
		d <= in;
	end
endmodule 