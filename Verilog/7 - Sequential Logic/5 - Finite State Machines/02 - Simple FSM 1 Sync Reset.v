module fsm1s_circuit(clk, reset, in, out);
	input clk;
	input reset;    // Synchronous reset to state B
	input in;
	output out;
	reg out;

	parameter A = 0, B = 1;
   reg present_state, next_state;

	always @(posedge clk) begin
		if (reset) begin  
			present_state = B;
		end else begin
			case (present_state)
				A: next_state = in ? A : B;
				B: next_state = in ? B : A;
			endcase
			present_state = next_state;   
		end
	end
	always @(*) begin
		case (present_state) 
			A: out = 1'b0;
			B: out = 1'b1;
		endcase
	end
endmodule 