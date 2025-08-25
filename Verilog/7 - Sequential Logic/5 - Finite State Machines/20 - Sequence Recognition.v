module hdlc_circuit(
   input clk,
   input reset,    // Synchronous reset
   input in,
   output disc,
   output flag,
   output err
);
   parameter Wait = 0, A = 1, B = 2, C = 3, 
   D = 4, E = 5, F = 6, Disc = 7, Flag = 8, Err = 9;
    
   reg [3:0] state, next;
    
	always @(*) begin
		case (state) 
			Wait : next = in ? A : Wait;
			A : next = in ? B : Wait;
			B : next = in ? C : Wait;
			C : next = in ? D : Wait;
			D : next = in ? E : Wait;
			E : next = in ? F : Disc;
			F : next = in ? Err : Flag;
			Disc : next = in ? A : Wait;
			Flag : next = in ? A : Wait;
			Err : next = in ? Err : Wait;
		endcase
   end
    
   always @(posedge clk) begin
		if (reset) begin
			state <= Wait;
		end else begin
			state <= next;
		end
   end
    
   assign disc = (state == Disc);
	assign flag = (state == Flag);
	assign err = (state == Err);
endmodule 