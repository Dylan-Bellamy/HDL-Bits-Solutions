module fsmseq_circuit(
   input clk,
   input reset,      // Synchronous reset
   input data,
   output start_shifting
);
	parameter A=0,B=1,C=2,D=3,Shift=4;
   reg [2:0] state, next;
    
   always @(*) begin
		case(state)
			A: next = data ? B : A;
			B: next = data ? C : A;
			C: next = data ? C : D;
			D: next = data ? Shift : A;
			Shift: next = Shift;
		endcase
	end
            
   always @(posedge clk) begin
		if (reset) begin
			state <= 0;
		end else begin
			state <= next;
		end 
   end
    
   assign start_shifting = state == Shift;
endmodule 