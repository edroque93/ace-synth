module cpu (
	input wire clk,
	input wire reset,

	output wire mem_read,
	output wire mem_write,
	input wire mem_ack,
	output wire [31:0] mem_addr,
	input wire [31:0] mem_read_data,
	output wire [31:0] mem_write_data,
	 // debug xdddd
	output wire [6:0] hex0,
	output wire [6:0] hex1,
	output wire [6:0] hex2,
	output wire [6:0] hex3,
	output wire [6:0] hex4,
	output wire [6:0] hex5,
	output wire [6:0] hex6,
	output wire [6:0] hex7
);

wire [31:0] debug_hex;
wire enable_hex = 1'b1;

flow_ctrl flow_ctrl(
	.reset(reset),
	//.dc_stall,
	//.is_branch,
	//.is_jump,
	//.hzd_stall,
	//.ic_stall,
	//.pc_we,
	//.pc_reset,
	//.if_we,
	.if_reset(if_stage.reset)
	//.id_we,
	//.id_reset,
	//.ex_we,
	//.ex_reset,
	//.mem_we,
	//.mem_reset,
	//.wb_we,
	//.wb_reset
);

if_stage if_stage (
	.clk(clk),
	.reset(flow_ctrl.if_reset)
//	input wire we,
//	// Control signals
//	// - Flow
//	input wire pc_reset,
//	input wire pc_we,
//	// - Branch predictor (TODO)
//	// - Kernel control (TODO)
//	// - Branch control
//	input is_jump,
//	input is_branch,
//	input wire [31:0] jump_addr,
//	input wire [31:0] branch_addr,
//	// - Arbiter Control
//	output reg read_req,
//	input wire read_ack,
//	output reg [31:0] read_addr,
//	input wire [31:0] read_data,	
//	// Outputs
//	output reg [31:0] instruction,
//	output reg [31:0] pc_next,
//	output reg hit
);
//
//module id_stage (
//	input wire clk,
//	input wire reset,
//	input wire we,
//	// Control signals
//	// Forward
//	output wire [4:0] rs_probe,
//	output wire [4:0] rt_probe,
//	input wire [1:0] ctrl_rs,
//	input wire [1:0] ctrl_rt,
//	input wire [31:0] ex_data,
//	input wire [31:0] mem_data,
//	input wire [31:0] wb_data,
//	// Inputs
//	input wire [31:0] instruction,
//	input wire [31:0] pc_next,
//	// Outputs
//	// - Execute
//	output reg alu_s,
//	output reg alu_t,
//	output reg alu_op,
//	output reg dst_reg,
//	output reg is_link,
//	output reg is_jump,
//	output reg dst_jump,
//	output reg [31:0] pc_jump,
//	output reg [31:0] pc_next_out,
//	output reg [31:0] data_s,
//	output reg [31:0] data_t,
//	output reg [31:0] data_c0,
//	output reg [5:0] opcode,
//	output reg [4:0] reg_s,
//	output reg [4:0] reg_t,
//	output reg [4:0] reg_d,
//	// - Mem
//	output reg is_branch,
//	output reg mem_read,
//	output reg mem_write,
//	output reg mem_type,
//	output reg mem_to_reg,
//	// - Wb
//	output reg reg_write,
//	output reg c0_write
//);



// DEBUG every time you use this to debug a kitten dies

segments_converter data_conv0 (
	.enable(enable_hex),
	.value(debug_hex[3:0]),
	.value_converted(hex0)
);

segments_converter data_conv1 (
	.enable(enable_hex),
	.value(debug_hex[7:4]),
	.value_converted(hex1)
);

segments_converter data_conv2 (
	.enable(enable_hex),
	.value(debug_hex[11:8]),
	.value_converted(hex2)
);

segments_converter data_conv3 (
	.enable(enable_hex),
	.value(debug_hex[15:12]),
	.value_converted(hex3)
);

segments_converter data_conv4 (
	.enable(enable_hex),
	.value(debug_hex[19:16]),
	.value_converted(hex4)
);

segments_converter data_conv5 (
	.enable(enable_hex),
	.value(debug_hex[23:20]),
	.value_converted(hex5)
);

segments_converter addr_conv6 (
	.enable(enable_hex),
	.value(debug_hex[27:24]),
	.value_converted(hex6)
);

segments_converter addr_conv7 (
	.enable(enable_hex),
	.value(debug_hex[31:28]),
	.value_converted(hex7)
);

endmodule
