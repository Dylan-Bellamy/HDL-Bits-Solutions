module conwaylife_circuit(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q 
); 
    integer col, row;
    integer downrow, uprow, leftcol, rightcol;
    integer index, neighbour;
    reg [255:0] q_next;
    
    always @(*) begin
        for (col=0; col<16; col=col+1) begin
            for (row=0; row<256; row=row+16) begin
                downrow = (row == 0) ? 240 : row - 16;
                uprow = (row/16 == 15) ? 0 : row + 16;
                leftcol = (col == 0) ? 15 : col - 1;
                rightcol = (col == 15) ? 0 : col + 1;
                
                index = row+col;
                // Finds number of neighbors
                neighbour = (q[row+leftcol] + q[row+rightcol] +
                             q[downrow+col] + q[uprow+col] +
                             q[downrow+leftcol] + q[uprow+leftcol] +
                             q[downrow+rightcol] + q[uprow+rightcol]
                            );
                case (neighbour)
                    4'b10 : q_next[index] = q[index];
                    4'b11 : q_next[index] = 1'b1;
                    default : q_next[index] = 1'b0;
                endcase
            end
        end
    end
    
    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end else begin
            q <= q_next;
        end
    end         
endmodule