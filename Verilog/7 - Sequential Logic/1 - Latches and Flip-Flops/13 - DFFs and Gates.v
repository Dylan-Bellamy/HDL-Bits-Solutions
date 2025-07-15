module dffg2_circuit(
   input clk,
   input x,
   output z
); 
   reg dff1, dff2, dff3 = 1'b0;
	
   always @(posedge clk) begin
		dff1 <= x^dff1;
		dff2 <= x&~dff2;
		dff3 <= x|~dff3;
   end
	
	assign z = ~(dff1|dff2|dff3);
endmodule 