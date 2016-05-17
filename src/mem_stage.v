module mem_stage (
	input wire clk,
	input wire reset,
	input wire we,
	// Control signals
	// - Forward 
	output wire [4:0] reg_probe,
	output wire [31:0] data_probe,
	output wire write_probe,
	// Inputs
	input wire is_branch,
	input wire [31:0] pc_branch,
	input wire alu_zero,
	input wire mem_read,
	input wire mem_write,
	input wire mem_type,
	input wire mem_to_reg,
	input wire [31:0] alu_out,
	input wire [31:0] data_t,
	input wire [4:0] reg_addr,
	input wire reg_write,
	// Outputs
	output reg [31:0] reg_data,
	output reg [4:0] reg_addr_out,
	output reg reg_write_out,
	// Feedback
	output reg is_branch_out,
	output reg [31:0] pc_branch_out
);
endmodule
