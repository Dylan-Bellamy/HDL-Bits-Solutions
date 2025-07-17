module countbcd_circuit(
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output reg [15:0] q
);
    always @(posedge clk) begin
        ena[1] <= (q[3:0] == 8);
        ena[2] <= (q[7:0] == 8'h98);
        ena[3] <= (q[11:0] == 12'h998);
        if (reset|(q == 16'h9999)) begin
            q <= 16'b0;
            ena <= 3'b0;
        end
        else begin
            q[3:0] <= (q[3:0] == 9) ? 4'b0 : q[3:0] + 1;
            
            if(ena[1]) begin
                q[7:4] <= (q[7:4] == 9) ? 4'b0 : q[7:4] + 1;
            end
            if(ena[2]) begin
                q[11:8] <= (q[11:8] == 9) ? 4'b0 : q[11:8] + 1;
            end
            if(ena[3]) begin
                q[15:12] <= (q[15:12] == 9) ? 4'b0 : q[15:12] + 1;
            end
        end
    end
endmodule 