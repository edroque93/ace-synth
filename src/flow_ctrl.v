module flow_ctrl(
	input wire reset,
	input wire dc_stall,
	input wire is_branch,
	input wire is_jump,
	input wire hzd_stall,
	input wire ic_stall,
	output reg pc_we,
	output reg pc_reset,
	output reg if_we,
	output reg if_reset,
	output reg id_we,
	output reg id_reset,
	output reg ex_we,
	output reg ex_reset,
	output reg mem_we,
	output reg mem_reset,
	output reg wb_we,
	output reg wb_reset
);

endmodule
