module if_stage (
	input wire clk,
	input wire reset,
	input wire we,
	// Control signals
	// - Flow
	input wire pc_reset,
	input wire pc_we,
	// - Branch predictor (TODO)
	// - Kernel control (TODO)
	// - Branch control
	input is_jump,
	input is_branch,
	input wire [31:0] jump_addr,
	input wire [31:0] branch_addr,
	// - Arbiter Control
	output reg read_req,
	input wire read_ack,
	output reg [31:0] read_addr,
	input wire [31:0] read_data,	
	// Outputs
	output reg [31:0] instruction,
	output reg [31:0] pc_next,
	output reg hit
);

endmodule
