module AwithB_circuit ( input x, input y, output z );
	wire orgate, andgate, wire1, wire2, wire3, wire4;
	
	A_circuit instance1 ( .x(x), .y(y), .z(wire1) );
	A_circuit instance2 ( .x(x), .y(y), .z(wire2) );
	B_circuit instance3 ( .x(x), .y(y), .z(wire3) );
	B_circuit instance4 ( .x(x), .y(y), .z(wire4) );
	
	assign orgate = wire1|wire3;
	assign andgate = wire2&wire4;
	assign z = orgate^andgate;
endmodule 