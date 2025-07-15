module shift8_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);
    wire [7:0] qd1, qd2, qd3;
	 
	 // We are given module my_dff8
	 // module my_dff8 ( input clk, input [7:0] d, output [7:0] q );
    my_dff8 instance1 ( .clk(clk), .d(d), .q(qd1) );
    my_dff8 instance2 ( .clk(clk), .d(qd1), .q(qd2) );
    my_dff8 instance3 ( .clk(clk), .d(qd2), .q(qd3) );
    
    always @(*) begin
        case (sel)
            2'b00 : q = d;
            2'b01 : q = qd1;
            2'b10 : q = qd2;
            2'b11 : q = qd3;
        endcase
    end
endmodule 