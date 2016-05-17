module wb_stage (
	input wire clk,
	input wire reset,
	input wire we,
	// Control signals
	// - Forward 
	output wire [4:0] reg_probe,
	output wire [31:0] data_probe,
	output wire write_probe,
	// Inputs
	input wire [31:0] reg_data,
	input wire [4:0] reg_addr,
	input wire reg_write,
	// Feedback
	output reg [31:0] reg_data_out,
	output reg [4:0] reg_addr_out,
	output reg reg_write_out,
);
endmodule
