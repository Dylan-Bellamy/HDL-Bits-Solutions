module Hz1000to1_circuit(
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    wire [3:0] second, minute, hour;
    bcdcount counter0 (clk, reset, c_enable[0], second);
    bcdcount counter1 (clk, reset, c_enable[1], minute);
    bcdcount counter2 (clk, reset, c_enable[2], hour);
    
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = c_enable[0] & second == 4'b1001;
    assign c_enable[2] = c_enable[1] & minute == 4'b1001;
    
    assign OneHertz = (second == 4'b1001) & (minute == 4'b1001) & (hour == 4'b1001);
endmodule 