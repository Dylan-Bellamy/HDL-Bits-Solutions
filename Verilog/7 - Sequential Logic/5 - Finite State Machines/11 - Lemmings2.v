module lemmings2_circuit(
   input clk,
   input areset,    // Freshly brainwashed Lemmings walk left.
   input bump_left,
   input bump_right,
   input ground,
   output walk_left,
   output walk_right,
   output aaah 
); 
   parameter LEFT = 2'b0, RIGHT = 2'b1, FALL = 2'b10;
   reg [1:0] state, next_state, fall_state;
    
	always @(*) begin
		case (state) 
			LEFT: next_state = ground ? (bump_left ? RIGHT : LEFT) : FALL;
			RIGHT: next_state = ground ? (bump_right ? LEFT : RIGHT) : FALL;
			FALL: next_state = ground ? fall_state : FALL;
		endcase
	end

	always @(posedge clk or posedge areset) begin
		if (areset) begin
			state <= LEFT;
			fall_state <= state;
		end else begin
			if ((next_state == FALL)&(state != FALL)) begin 
				fall_state <= state;
         end
			state <= next_state;
		end
   end
    
   assign walk_left = (state == LEFT);
   assign walk_right = (state == RIGHT);
   assign aaah = (state == FALL);
endmodule 