module popcount3( 
   input [2:0] in,
   output [1:0] out 
);
   integer i;
	always @(*) begin
		out = 0;
		for(i=0; i<$bits(in); i=i+1) begin
			out = out + in[i];
		end
	end
endmodule 