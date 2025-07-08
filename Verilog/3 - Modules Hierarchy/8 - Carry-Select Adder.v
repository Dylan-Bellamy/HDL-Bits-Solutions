module cseadder_module(
   input [31:0] a,
   input [31:0] b,
   output [31:0] sum
);
   reg [15:0] sum1, sum2a, sum2b, sum2;
   wire carry1, carry2, carry3;
    
	// We are given module add16
	// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
   add16 adder1 ( .a(a[15:0]), .b(b[15:0]), .cin("0"), .sum(sum1), .cout(carry1) );
   add16 adder2 ( .a(a[31:16]), .b(b[31:16]), .cin("0"), .sum(sum2a), .cout(carry2) );
   add16 adder3 ( .a(a[31:16]), .b(b[31:16]), .cin("1"), .sum(sum2b), .cout(carry3) );
    
   always @(*) begin
      case (carry1) 
			1'b0 : sum2 = sum2a;
         1'b1 : sum2 = sum2b;
      endcase
   end 
   assign sum = {sum2, sum1};
endmodule 