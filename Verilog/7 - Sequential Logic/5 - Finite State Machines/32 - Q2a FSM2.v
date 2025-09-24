module q2afsm2_circuit(
	input clk,
  	input resetn,    // active-low synchronous reset
  	input [3:1] r,   // request
	output [3:1] g   // grant
); 
  	parameter A = 0, d1 = 1, d2 = 2, d3 = 3;
  	reg [2:0] state, next;
   
  	always @(*) begin
		case (state)
			A: begin
				if (r[1]) begin
					next = d1;
				end else if (r[2]) begin
					next = d2;
				end else if (r[3]) begin
					next = d3;
				end else next = A;
			end
			d1: next = (r[1]) ? d1 : A;
			d2: next = (r[2]) ? d2 : A;
			d3: next = (r[3]) ? d3 : A;
			default: next = A;
		endcase
	end

	always @(posedge clk) begin
		if (~resetn) begin
			state <= A;
		end else begin
			state <= next;
		end
	end
    
   assign g[1] = state == d1;
   assign g[2] = state == d2;
   assign g[3] = state == d3;
endmodule 