module q5amoore_circuit(
   input clk,
   input areset,
	input x,
   output z
); 
	parameter A = 0, B = 1;
   reg state, next, out;
    
	always @(*) begin
		case (state) 
			A : next = x ? B : A;
			B : next = B;
		endcase
	end
    
	always @(posedge clk or posedge areset) begin
		if (areset) begin
			state <= A;
			out <= 0;
		end else begin
			out <= state ? ~x : x;
			state <= next;
		end
	end
    
	assign z = out;  
endmodule 