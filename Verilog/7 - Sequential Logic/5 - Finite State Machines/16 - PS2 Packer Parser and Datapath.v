module fsmps2data_circuit(
   input clk,
   input [7:0] in,
   input reset,    // Synchronous reset
   output reg [23:0] out_bytes,
   output done
); 
   // FSM from fsm_ps2
   parameter Byte1 = 0, Byte2 = 1, Byte3 = 2, Done = 3;
   reg [2:0] state, next_state;
   // State transition logic (combinational)
   always @(*) begin
		case (state) 
			Byte1 : begin
				next_state = in[3] ? Byte2 : Byte1;
			end Byte2 : begin 
				next_state = Byte3;
			end Byte3 : begin 
				next_state = Done;
         end Done : begin 
				next_state = in[3] ? Byte2 : Byte1;
			end
		endcase
	end
	// State flip-flops (sequential)
	always @(posedge clk) begin
		if (reset) begin
			state <= Byte1;
		end else begin
			state <= next_state;
         // Datapath to store incoming bytes.
         out_bytes <= {out_bytes[15:0], in};
		end
	end
   // Output logic
   assign done = (state == Done);
endmodule 