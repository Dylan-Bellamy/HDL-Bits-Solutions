module lemmings1_circuit(
	input clk,
	input areset,    // Freshly brainwashed Lemmings walk left.
   input bump_left,
   input bump_right,
   output walk_left,
   output walk_right
); 

   parameter LEFT=0, RIGHT=1;
   reg state, next_state;

   always @(*) begin
		case (state) 
			LEFT: next_state = bump_left ? RIGHT : LEFT;
			RIGHT: next_state = bump_right ? LEFT : RIGHT;
		endcase
	end

	always @(posedge clk, posedge areset) begin
		if (areset) begin
			state <= LEFT;
		end else begin
			state <= next_state;
		end
	end

   assign walk_left = (state == LEFT);
   assign walk_right = (state == RIGHT);
endmodule 