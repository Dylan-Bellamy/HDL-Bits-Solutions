module lfsr3_circuit(
	input [2:0] SW,    		 // R
	input [1:0] KEY,   		 // L and clk
   output reg [2:0] LEDR	 // Q
);  
   wire mux1, mux2, mux3;
   assign mux1 = KEY[1] ? SW[0] : LEDR[2];
   assign mux2 = KEY[1] ? SW[1] : LEDR[0];
   assign mux3 = KEY[1] ? SW[2] : LEDR[1]^LEDR[2];
   always @(posedge KEY[0]) begin 
		LEDR[0] <= mux1;
		LEDR[1] <= mux2;
		LEDR[2] <= mux3;
	end
endmodule 