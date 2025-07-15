module dff8_circuit(
   input clk,
   input [7:0] d,
   output reg [7:0] q
);
   // Creates multiple d flip-flops because vectors
   // q <= d; also works
   always @(posedge clk) begin
      q[7:0] <= d[7:0];
   end
endmodule 