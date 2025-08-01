module moorefsm_circuit(
   input clk,
   input reset,
   input [3:1] s,
   output fr3,
   output fr2,
   output fr1,
   output dfr
); 
   parameter A=0, B1=1, B2=2, C1=3, C2=4, D=5;
   reg [3:1] state, next;
    
   always @(posedge clk) begin
		if (reset) begin
			state <= A;
		end else begin
			state <= next;
		end
	end

	always @(*) begin
		case (state)
			A: next = s[1] ? B1 : A;
			B1: next = s[2] ? C1 : (s[1] ? B1 : A);
			B2: next = s[2] ? C1 : (s[1] ? B2 : A);
			C1: next = s[3] ? D : (s[2] ? C1 : B2);
			C2: next = s[3] ? D : (s[2] ? C2 : B2);
			D: next = s[3] ? D : C2;
		endcase
	end
	
	always @(*) begin
		case (state)
			A: {fr3, fr2, fr1, dfr} = 4'b1111;
			B1: {fr3, fr2, fr1, dfr} = 4'b0110;
			B2: {fr3, fr2, fr1, dfr} = 4'b0111;
			C1: {fr3, fr2, fr1, dfr} = 4'b0010;
			C2: {fr3, fr2, fr1, dfr} = 4'b0011;
			D: {fr3, fr2, fr1, dfr} = 4'b0000;
		endcase
	end
endmodule
