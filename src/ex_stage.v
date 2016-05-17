module ex_stage (
	input wire clk,
	input wire reset,
	input wire we,
	// Control signals
	// - Forward 
	output wire [4:0] reg_probe,
	output wire [31:0] data_probe,
	output wire write_probe,
	// Inputs
	input wire alu_s,
	input wire alu_t,
	input wire alu_op,
	input wire dst_reg,
	input wire is_link,
	input wire is_jumps,
	input wire dst_jump,
	input wire [31:0] pc_jump,
	input wire [31:0] pc_next,
	input wire [31:0] data_s,
	input wire [31:0] data_t,
	input wire [31:0] data_c0,
	input wire [5:0] opcode,
	input wire [4:0] reg_s,
	input wire [4:0] reg_t,
	input wire [4:0] reg_d,
	input wire is_branch,
	input wire mem_read,
	input wire mem_write,
	input wire mem_type,
	input wire mem_to_reg,
	input wire reg_write,
	// Outputs
	// - Mem
	output reg is_branch_out,
	output reg [31:0] pc_branch,
	output reg alu_zero,
	output reg mem_read_out,
	output reg mem_write_out,
	output reg mem_type_out,
	output reg mem_to_reg_out,
	output reg [31:0] alu_out,
	output reg [31:0] data_t_out,
	output reg [4:0] reg_addr,
	// - Wb
	output reg reg_write_out,
	// Feedback
	output reg is_jump_out,
	output reg [31:0] pc_jump_out
);

endmodule
