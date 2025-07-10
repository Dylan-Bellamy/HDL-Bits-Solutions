module popcount255_module( 
    input [254:0] in,
    output reg [7:0] out 
);
	integer i;
    always @(*) begin
        out = 0;
    	for(i=0; i<$bits(in); i=i+1) begin
            out = in[i] ? out+1'b1 : out;
        end
    end
endmodule 