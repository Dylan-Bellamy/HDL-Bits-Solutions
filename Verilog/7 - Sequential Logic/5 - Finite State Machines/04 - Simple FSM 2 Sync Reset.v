module fsm2s_circuit(
   input clk,
   input reset,    // Synchronous reset to OFF
   input j,
   input k,
   output out); //  

   parameter OFF=0, ON=1; 
   reg state, next_state;
	
	always @(*) begin
		case (state) 
			OFF: next_state = j ? ON : OFF;
			ON: next_state = k ? OFF : ON;
		endcase
	end

	always @(posedge clk) begin
		if (reset) begin
			state <= OFF;
		end else begin 
			state <= next_state;
		end
   end
   assign out = (state == ON);
endmodule 