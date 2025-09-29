module shiftreg_circuit(
   input clk,
   input reset,      // Synchronous reset
   output shift_ena
);
	parameter Wait=0,A=1,B=2,C=3,D=4;
   reg [2:0] state, next;
    
   always @(*) begin
		case(state)
			Wait: next = Wait;
			A: next = B;
			B: next = C;
			C: next = D;
			D: next = Wait;
			default: next = Wait;
		endcase
	end
            
   always @(posedge clk) begin
		if (reset) begin
			state <= A;
		end else begin
			state <= next;
		end 
	end
    
   assign shift_ena = state != Wait;
endmodule 