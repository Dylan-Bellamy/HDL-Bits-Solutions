module completefsm_circuit(
   input clk,
   input reset,      // Synchronous reset
   input data,
   output shift_ena,
   output counting,
   input done_counting,
   output done,
   input ack 
);
	parameter A=0,B=1,C=2,D=3,S1=4,S2=5,S3=6,S4=7,Count=8,Wait=9;
   reg [3:0] state, next;
    
   always @(*) begin
		case(state)
			A: next = data ? B : A;
			B: next = data ? C : A;
			C: next = data ? C : D;
			D: next = data ? S1 : A;
			S1: next = S2;
			S2: next = S3;
         S3: next = S4;
			S4: next = Count;
			Count: next = done_counting ? Wait : Count;
			Wait: next = ack ? A : Wait;
		endcase
	end
            
   always @(posedge clk) begin
		if (reset) begin
			state <= A;
		end else begin
			state <= next;
		end 
   end
    
   assign shift_ena = (state == S1)|(state == S2)|(state == S3)|(state == S4);
   assign counting = (state == Count);
   assign done = (state == Wait);
endmodule 