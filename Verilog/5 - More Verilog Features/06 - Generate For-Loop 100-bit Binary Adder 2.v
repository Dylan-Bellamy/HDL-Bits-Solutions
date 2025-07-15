module adder100i_module( 
   input [99:0] a, b,
   input cin,
   output reg [99:0] cout,
   output reg [99:0] sum 
);
   genvar i;
   full_adder1bit fa1( a[0], b[0], cin, cout[0], sum[0] );
    
	generate
		for(i=1; i<$bits(a); i=i+1) begin : fa_block
			full_adder1bit fa( a[i], b[i], cout[i-1], cout[i], sum[i] );
		end
	endgenerate          
endmodule

module full_adder1bit( input a, input b, input cin, output reg cout, output reg sum );
    always @(*) begin
		case (cin)
			1'b0 : begin 
				sum = a ^ b;
            cout = a & b;
         end
         1'b1 : begin
            sum = a ~^ b;
            cout = a | b;
         end
		endcase
   end
endmodule 