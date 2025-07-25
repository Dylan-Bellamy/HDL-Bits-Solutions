module LUT3input_circuit(
   input clk,
   input enable,
   input S,
   input A, B, C,
   output reg Z 
); 
	reg [0:7] Q;
	always @(posedge clk) begin
		if (enable) begin
			Q[0:7] <= {S, Q[0:6]};
		end
   end
    
   always @(*) begin
		case ({A, B, C}) 
			3'b000 : Z = Q[0];
			3'b001 : Z = Q[1];
			3'b010 : Z = Q[2];
			3'b011 : Z = Q[3];
			3'b100 : Z = Q[4];
			3'b101 : Z = Q[5];
			3'b110 : Z = Q[6];
			3'b111 : Z = Q[7];
		endcase
	end
endmodule 