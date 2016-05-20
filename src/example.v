module my_example (
	input wire clk,
	input wire data_in,
	output reg data_out
);

always @(posedge clk)
	data_out = ~data_in;

endmodule
