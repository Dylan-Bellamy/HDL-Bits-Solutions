module q5bmealy_circuit(
   input clk,
   input areset,
   input x,
   output z
); 
	parameter A = 0, B = 1;
	reg state, next;
    
	always @(*) begin
		case (state) 
			A : next = x ? B : A;
			B : next = B;
		endcase
	end
    
	always @(posedge clk or posedge areset) begin
		if (areset) begin
			state <= A;
		end else begin
			state <= next;
		end
	end
    
	assign z = state ? (x ? 0 : 1) : (x ? 1 : 0);
endmodule 