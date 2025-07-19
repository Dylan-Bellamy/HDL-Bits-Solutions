module shiftregister2_circuit(
   input [3:0] SW,
   input [3:0] KEY,
   output [3:0] LEDR
); 
   wire [3:0] mux;
   reg [3:0] q;
   assign LEDR = q;
    
   assign mux[0] = KEY[1] ? q[1] : q[0];
   assign mux[1] = KEY[1] ? q[2] : q[1];
   assign mux[2] = KEY[1] ? q[3] : q[2];
   assign mux[3] = KEY[1] ? KEY[3] : q[3];
    
	genvar i;
	generate
		for (i = 3; i >= 0; i = i-1) begin : mux_dff_block
			// Use's past solution (Mux and DFF) to solve question
		   // Copy and paster Mux and DFF into HDLBits with this module to run it 
			muxdff_circuit muxdff1 (.clk(KEY[0]), .L(KEY[2]), .r_in(SW[i]), .q_in(mux[i]), .Q(q[i]) );
		end
	endgenerate        
endmodule 