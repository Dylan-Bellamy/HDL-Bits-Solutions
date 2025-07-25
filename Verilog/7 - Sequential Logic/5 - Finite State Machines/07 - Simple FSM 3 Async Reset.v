module fsm3_circuit(
   input clk,
   input in,
   input areset,
   output out
); 
	parameter A=2'b00,B=2'b01,C=2'b10,D=2'b11;
	reg [1:0] state, next;
    
	// State transition logic
	always @(*) begin
		case (state)
			A: next = in ? B : A;
			B: next = in ? B : C;
			C: next = in ? D : A;
			D: next = in ? B : C;
		endcase
	end

	// State flip-flops with asynchronous reset
	always @(posedge clk or posedge areset) begin
		if (areset) begin
			state <= A;
		end else begin
			state <= next;
		end
	end
    
	// Output logic
	assign out = (state == D);
endmodule
