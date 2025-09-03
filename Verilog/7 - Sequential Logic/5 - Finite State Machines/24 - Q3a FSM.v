module q3afsm_circuit(
   input clk,
   input reset,   // Synchronous reset
   input s,
   input w,
	output reg z
);
	parameter A = 0, B = 1;
	reg state, next;
	reg [1:0] out;
	integer cnt;
    
	always @(*) begin
		case (state) 
			A : next = s ? B : A;
			B : next = B;
		endcase
	end
    
	always @(posedge clk) begin
		if (reset) begin
			state <= A;
		end else begin
			state <= next;
		end
	end
    
	always @(posedge clk) begin
		if (reset || (state == A)) begin
			cnt = 0;
			out = 0;
		end else begin
			if (state == B) begin
				if (cnt < 3) begin
					cnt = cnt + 1;
				end else begin
					cnt = 1;
					out = 0;
				end
			end 
			if (next == B) begin
				out = out + w;
			end
		end
   end
   assign z = (out == 2'b10)&&(cnt == 3);
endmodule 