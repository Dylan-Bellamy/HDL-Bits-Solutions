module fsmserial_circuit(
   input clk,
   input in,
   input reset,    // Synchronous reset
   output done
); 
	parameter Wait = 0, Bit1 = 1, Bit2 = 2, Bit3 = 3, Bit4 = 4, 
   Bit5 = 5, Bit6 = 6, Bit7 = 7, Bit8 = 8, Stop = 9, Stop2 = 10, Done = 11;
   reg [3:0] state, next_state;
    
	always @(*) begin
		case (state) 
			Wait : next_state = ~in ? Bit1 : Wait;
			Bit1 : next_state = Bit2;
			Bit2 : next_state = Bit3;
			Bit3 : next_state = Bit4;
			Bit4 : next_state = Bit5;
			Bit5 : next_state = Bit6;
			Bit6 : next_state = Bit7;
			Bit7 : next_state = Bit8;
			Bit8 : next_state = Stop;
			Stop : next_state = in ? Done : Stop2;
			Stop2: next_state = in ? Wait : Stop2;
			Done : next_state = ~in ? Bit1 : Wait;
		endcase
	end
    
	always @(posedge clk) begin
		if (reset) begin
			state <= Wait;
		end else begin
			state <= next_state;
		end
	end 
	assign done = (state == Done);
endmodule
