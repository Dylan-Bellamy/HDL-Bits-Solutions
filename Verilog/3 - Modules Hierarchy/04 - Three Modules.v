module module_shift_module ( input clk, input d, output q );
    wire qd1, qd2;
	 
	 // We are given module my_dff
	 // module my_dff ( input clk, input d, output q );
    my_dff instance1 ( .clk(clk), .d(d), .q(qd1) );
    my_dff instance2 ( .clk(clk), .d(qd1), .q(qd2) );
    my_dff instance3 ( .clk(clk), .d(qd2), .q(q) );
endmodule 