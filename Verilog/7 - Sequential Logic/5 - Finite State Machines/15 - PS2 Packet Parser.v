module fsmps2_circuit(
   input clk,
   input [7:0] in,
   input reset,  // Synchronous reset
   output done
); 
   parameter Byte1 = 0, Byte2 = 1, Byte3 = 2, Done = 3;
   reg [2:0] state, next_state;
   // State transition logic (combinational)
   always @(*) begin
		case (state) 
			Byte1 : next_state = in[3] ? Byte2 : Byte1;
			Byte2 : next_state = Byte3;
			Byte3 : next_state = Done;
			Done : next_state = in[3] ? Byte2 : Byte1;
		endcase
	end
	// State flip-flops (sequential)
	always @(posedge clk) begin
		if (reset) begin
			state <= Byte1;
		end else begin
			state <= next_state;
		end
	end
   // Output logic
   assign done = (state == Done);
endmodule
