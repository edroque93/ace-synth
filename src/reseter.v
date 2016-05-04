module reseter(
	input wire clk,
	output wire reset
);

reg flag = 1'b1;

always @(posedge clk) begin
	if (flag) begin
		flag  <= 1'b0;
	end
end

assign reset = flag;

endmodule
