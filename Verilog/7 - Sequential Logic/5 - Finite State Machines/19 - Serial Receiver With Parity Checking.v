module fsmserialdp_circuit(
   input clk,
   input in,
   input reset,    // Synchronous reset
   output reg [7:0] out_byte,
   output done
); 
	parameter Wait = 0, Bit1 = 1, Bit2 = 2, Bit3 = 3, 
				 Bit4 = 4, Bit5 = 5, Bit6 = 6, Bit7 = 7, Bit8 = 8, 
				 Parity = 9, Stop = 4'ha, Error = 4'hb, Done = 4'hc;
	reg [3:0] state, next_state;
   reg [7:0] shift_reg;

	wire odd, res;

	assign res = reset | (next_state == Wait);
	parity in1 (clk, res, in, odd);  // External parity calculator

	always @(*) begin
		case (state) 
			Wait   : next_state = ~in ? Bit1 : Wait;
			Bit1   : next_state = Bit2;
			Bit2   : next_state = Bit3;
			Bit3   : next_state = Bit4;
			Bit4   : next_state = Bit5;
			Bit5   : next_state = Bit6;
			Bit6   : next_state = Bit7;
			Bit7   : next_state = Bit8;
			Bit8   : next_state = Parity;
			Parity : next_state = (in == ~odd) ? Stop : Error;
			Stop   : next_state = in ? Done : Error;
			Error  : next_state = in ? Wait : Error;
			Done   : next_state = ~in ? Bit1 : Wait;
			default: next_state = Wait;
		endcase
	end

	always @(posedge clk) begin
		if (reset) begin
			state <= Wait;
			shift_reg <= 8'b0;
			out_byte <= 8'b0;
		end else begin
			state <= next_state;
			if (state >= Bit1 && state <= Bit8) begin
				shift_reg <= {in, shift_reg[7:1]};
			end if (next_state == Stop) begin
				out_byte <= shift_reg;
			end
		end
	end
	assign done = (state == Done);
endmodule 