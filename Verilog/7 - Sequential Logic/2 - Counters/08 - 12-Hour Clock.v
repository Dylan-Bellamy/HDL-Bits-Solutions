module countclock_circuit(
   input clk,
   input reset,
   input ena,
   output reg pm,
   output reg [7:0] hh,
   output reg [7:0] mm,
   output reg [7:0] ss
); 
	always @(posedge clk) begin
		if (reset) begin
			{hh, mm, ss} <= 24'h120000;
			pm <= 0;
		end else begin
			if (ena) begin
				if (ss < 8'h59) begin
					ss[3:0] <= ss[3:0] == 4'h9 ? 4'h0 : ss[3:0] + 1;
					ss[7:4] <= ss[3:0] == 4'h9 ? ss[7:4] + 1 : ss[7:4];
				end else begin
					ss <= 8'h00;
					if (mm < 8'h59) begin
						mm[3:0] <= mm[3:0] == 4'h9 ? 4'h0 : mm[3:0] + 1;
						mm[7:4] <= mm[3:0] == 4'h9 ? mm[7:4] + 1 : mm[7:4];
					end else begin
						mm <= 8'h00;
						if (hh < 8'h12) begin
							hh[3:0] <= hh[3:0] == 4'h9 ? 4'h0 : hh[3:0] + 1;
							if (hh == 8'h11) begin
								pm <= ~pm;
							end
							hh[7:4] <= hh[3:0] == 4'h9 ? hh[7:4] + 1 : hh[7:4];
						end else begin
							hh <= 8'h01;
						end
					end
				end
			end
		end
   end    
endmodule 