module gatesv100( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different
);
    integer i;
    always @(*) begin
        for(i=1;i<$bits(in); i=i+1) begin
            out_both[i-1] = in[i]&in[i-1];
            out_any[i] = in[i]|in[i-1];
            out_different[i-1] = in[i-1]^in[i]; 
        end
    end
    assign out_different[99] = in[99]^in[0];
endmodule 