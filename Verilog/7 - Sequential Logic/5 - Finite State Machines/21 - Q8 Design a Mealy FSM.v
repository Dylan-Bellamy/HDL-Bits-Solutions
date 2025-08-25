module fsmQ8_circuit(
   input clk,
   input aresetn,    // Asynchronous active-low reset
   input x,
   output z 
); 
	parameter A = 0, B = 1, C = 2;
   reg [2:0] state, next;
    
   always @(*) begin
		case (state)
			A : next = x ? B : A;
			B : next = x ? B : C;
			C : next = x ? B : A;
		endcase
   end
    
   always @(posedge clk or negedge aresetn) begin
		if (~aresetn) begin
			state <= A;
		end else begin
			state <= next;
		end
	end
    
   assign z = (state == C)&(x) ? 1'b1 : 1'b0;
endmodule
