module fancytimer_circuit(
	input clk,
	input reset,      // Synchronous reset
	input data,
	output reg [3:0] count,
	output counting,
	output done,
	input ack 
);
	parameter A=0,B=1,C=2,D=3,S1=4,S2=5,S3=6,S4=7,Count=8,Wait=9;
   reg [3:0] state, next;
   integer timer = 999;
   wire shift_ena;
    
   always @(*) begin
		case(state)
			// Pattern 1101
			A: next = data ? B : A;
			B: next = data ? C : A;
			C: next = data ? C : D;
			D: next = data ? S1 : A;
			// Shift next 4 data bits into register count
			S1: next = S2;
			S2: next = S3;
			S3: next = S4;
			S4: next = Count;
			// Start counting from (count+1)*1000 down to 0
			Count: next = (count == 0)&&(timer == 0) ? Wait : Count;
			// Finished counting and now waits for signal to start again
			Wait: next = ack ? A : Wait;
			default: next = A;
		endcase
	end
            
   always @(posedge clk) begin
		if (reset) begin
			state <= A;
			count <= 0;
			timer <= 999;
		end else begin
			state <= next;
			if (shift_ena) begin 
				count <= {count[2:0], data};
			end if (counting) begin
				if (timer == 0) begin
					timer <= 999;
					if (count != 4'b0) begin
						count <= count - 1;
					end
				end else begin
					timer <= timer - 1;
				end
			end
		end 
	end
    
   assign shift_ena = (state == S1)|(state == S2)|(state == S3)|(state == S4);
   assign counting = (state == Count);
   assign done = (state == Wait);
endmodule 