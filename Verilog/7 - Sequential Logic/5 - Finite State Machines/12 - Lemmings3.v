module lemmings3_circuit(
   input clk,
   input areset,    // Freshly brainwashed Lemmings walk left.
   input bump_left,
   input bump_right,
   input ground,
   input dig,
   output walk_left,
   output walk_right,
   output aaah,
   output digging 
); 
	parameter LEFT = 2'b0, RIGHT = 2'b1, FALL_L = 2'b10, DIG_L = 2'b11, FALL_R = 3'b100, DIG_R = 3'b101;
	reg [2:0] state, next_state, walk_state;
    
	always @(*) begin
		case (state) 
			LEFT: next_state = ground ? (dig ? DIG_L : (bump_left ? RIGHT : LEFT)) : FALL_L;
			RIGHT: next_state = ground ? (dig ? DIG_R : (bump_right ? LEFT : RIGHT)) : FALL_R;
			FALL_L: next_state = ground ? LEFT : FALL_L;
			DIG_L: next_state = ground ? DIG_L : FALL_L;
			FALL_R: next_state = ground ? RIGHT : FALL_R;
			DIG_R: next_state = ground ? DIG_R : FALL_R;
		endcase
	end

	always @(posedge clk or posedge areset) begin
		if (areset) begin
			state <= LEFT;
			walk_state <= state;
		end else begin
			state <= next_state;
		end
   end
    
   assign walk_left = (state == LEFT);
   assign walk_right = (state == RIGHT);
   assign aaah = ((state == FALL_L)|(state == FALL_R));
   assign digging = ((state == DIG_L)|(state == DIG_R));
endmodule 