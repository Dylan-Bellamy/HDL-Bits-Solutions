module dff8p_circuit(
   input clk,
   input reset,
   input [7:0] d,
   output reg [7:0] q
);
   // Resets the value to 0x34 (00110100) when reset is high
   always @(negedge clk) begin
      q <= reset ? 8'h34 : d;
   end
endmodule 