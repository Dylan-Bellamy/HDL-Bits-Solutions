module q2afsm_circuit(
   input clk,
   input reset,     // synchronous reset
   input w,
   output z
);
	parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5;
   reg [3:0] state, next;
    
   always @(*) begin
		case (state)
			A: next = w ? B : A;
			B: next = w ? C : D;
			C: next = w ? E : D;
			D: next = w ? F : A;
			E: next = w ? E : D;
			F: next = w ? C : D;
		endcase
   end
    
   always @(posedge clk) begin
       if (reset) begin
			state <= A;
		end else begin
			state <= next;
		end
	end
    
   assign z = (state == E)||(state == F);
endmodule 