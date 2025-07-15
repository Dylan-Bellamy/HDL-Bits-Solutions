module dff8r_circuit(
   input clk,
   input reset,      // Synchronous reset
   input [7:0] d,
   output reg [7:0] q
);
   always @(posedge clk) begin
      q <= reset ? 8'b0 : d;
   end
endmodule 