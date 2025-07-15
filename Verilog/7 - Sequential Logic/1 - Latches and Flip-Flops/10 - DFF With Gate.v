module dffg_circuit(
   input clk,
   input in, 
   output reg out
);
   always @(posedge clk) begin
      out <= in^out;
   end
endmodule 