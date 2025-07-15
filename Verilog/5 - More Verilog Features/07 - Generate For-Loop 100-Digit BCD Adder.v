module bcdadder100_module( 
   input [399:0] a, b,
   input cin,
   output cout,
   output [399:0] sum 
);
	genvar i;
   reg [99:0] cout1;
   bcd_fadd instance1( a[3:0], b[3:0], cin, cout1[0], sum[3:0] );
   
	// We are given module bcd_fadd
	// module bcd_fadd ( input [3:0] a, input [3:0] b, input cin, output cout, output [3:0] sum );
   generate
      for(i=4; i<$bits(a); i=i+4) begin : bcd_fadd_block
         bcd_fadd BCDFA( a[i+3:i], b[i+3:i], cout1[i/4-1], cout1[i/4], sum[i+3:i] );
      end
   endgenerate
   assign cout = cout1[99];
endmodule 