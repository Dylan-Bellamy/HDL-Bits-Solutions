module count1to12(
	input clk,
	input enable,
	input reset,
	output reg [3:0] Q,
	output c_enable,
	output c_load,
	output [3:0] c_d
);
	count4 the_counter (clk, c_enable, c_load, c_d, Q);
   
   assign c_enable = enable;
   assign c_load = (c_enable & Q == 4'b1100 | reset);
   assign c_d = c_load ? 4'b1 : 4'b0; 
endmodule
			
		
		
		