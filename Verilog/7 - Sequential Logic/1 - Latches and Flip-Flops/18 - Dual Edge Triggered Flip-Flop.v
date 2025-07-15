module dualedge(
   input clk,
   input d,
   output q
);
	reg posq, negq;
   always @(posedge clk) begin
		posq <= negq^d;
   end
    
   always @(negedge clk) begin
		negq <= posq^d;
   end
   assign q = posq^negq;
endmodule 