module hadd_circuit( 
   input a, b,
   output cout, sum 
);
   assign sum = a^b;
   assign cout = a&b;
endmodule 