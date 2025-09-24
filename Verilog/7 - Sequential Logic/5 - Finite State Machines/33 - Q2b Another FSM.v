module q2bfsm2_circuit(
   input clk,
   input resetn,    // active-low synchronous reset
   input x,
   input y,
   output f,
	output g
); 
	parameter A=0, f1=1, x1=2, x2=3, x3=4, y1=5, y2=6,g1=7,g0=8;
   reg[4:0] state, next;
    
	always @(*) begin
		case(state)
			A: next = f1;
			f1: next = x1;
			x1: next = x ? x2 : x1;
			x2: next = x ? x2 : x3;
			x3: next = x ? y1 : x1;
			y1: next = y ? g1 : y2;
			y2: next = y ? g1 : g0;
			g1: next = g1;
			g0: next = g0;
		endcase
	end
    
	always @(posedge clk) begin
		if (~resetn) begin
			state <= A;
		end else begin
			state <= next;
		end
   end
    
   assign f = state == f1;
   assign g = (state == y1)|(state == y2)|(state == g1); 
endmodule 