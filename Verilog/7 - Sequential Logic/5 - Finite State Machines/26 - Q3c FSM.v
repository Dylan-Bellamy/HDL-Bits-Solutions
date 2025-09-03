module q3cfsm_circuit(
   input clk,
   input [2:0] y,
   input x,
   output Y0,
   output z
);
	parameter A = 0, B = 1, C = 2, D = 3, E = 4;
   reg [2:0] state, next;
    
   always @(*) begin
		case(y) 
			A: next = x ? B : A;
			B: next = x ? E : B;
			C: next = x ? B : C;
			D: next = x ? C : B;
			E: next = x ? E : D;
			default: next = next;
		endcase
	end
    
   always @(posedge clk) begin
		state <= next;
	end
 
   assign Y0 = (next[0] == 1); 
   assign z = (y == D || y == E); 
endmodule
