module id_stage (
	input wire clk,
	input wire reset,
	input wire we,
	// Control signals
	// Forward
	output wire [4:0] rs_probe,
	output wire [4:0] rt_probe,
	input wire [1:0] ctrl_rs,
	input wire [1:0] ctrl_rt,
	input wire [31:0] ex_data,
	input wire [31:0] mem_data,
	input wire [31:0] wb_data,
	// Inputs
	input wire [31:0] instruction,
	input wire [31:0] pc_next,
	// Outputs
	// - Execute
	output reg alu_s,
	output reg alu_t,
	output reg alu_op,
	output reg dst_reg,
	output reg is_link,
	output reg is_jump,
	output reg dst_jump,
	output reg [31:0] pc_jump,
	output reg [31:0] pc_next_out,
	output reg [31:0] data_s,
	output reg [31:0] data_t,
	output reg [31:0] data_c0,
	output reg [5:0] opcode,
	output reg [4:0] reg_s,
	output reg [4:0] reg_t,
	output reg [4:0] reg_d,
	// - Mem
	output reg is_branch,
	output reg mem_read,
	output reg mem_write,
	output reg mem_type,
	output reg mem_to_reg,
	// - Wb
	output reg reg_write,
	output reg c0_write
);
endmodule

//assign // split input instruction
