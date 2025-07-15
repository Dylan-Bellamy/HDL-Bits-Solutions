module edgedetect2_circuit(
   input clk,
   input [7:0] in,
   output reg [7:0] anyedge
);
   reg [7:0] d;
   always @(posedge clk) begin
		anyedge <= in&~d|(d&~in);
		d <= in;
   end
endmodule 