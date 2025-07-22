module fsm1_circuit(
   input clk,
   input areset,    // Asynchronous reset to state B
   input in,
   output out
); 

   parameter A=0, B=1; 
   reg state, next_state;

	always @(*) begin    // This is a combinational always block
		// State transition logic
		next_state <= in ? state : ~state;
        
		/* Or use a case statement
			A: next_state = in ? A : B;
			B: next_state = in ? B : A; 
		*/
	end
    
	always @(posedge clk, posedge areset) begin    // This is a sequential always block
		// State flip-flops with asynchronous reset
		if (areset) begin
			state <= 1;
		end else begin
			state = next_state;
		end
	end
   // Output logic
   assign out = (state == 1);
endmodule 