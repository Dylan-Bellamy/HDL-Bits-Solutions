module dff8ar_circuit(
   input clk,
   input areset,   // active high asynchronous reset
   input [7:0] d,
   output reg [7:0] q
);   
   // Posedge on reset works because of the or and if statement 
   always @(posedge clk or posedge areset) begin 
      q <= areset ? 8'b0 : d;
   end
endmodule 