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
	input wire is_jump,
	input wire dst_jump,
	input wire [31:0] pc_jump,
	input wire [31:0] pc_next,
	input wire [31:0] data_s,
	input wire [31:0] data_t,
	input wire [31:0] data_c0,
	input wire [5:0] opcode,
	input wire [5:0] funct,
	input wire [4:0] reg_s,
	input wire [4:0] reg_t,
	input wire [4:0] reg_d,
	input wire is_branch,
	input wire mem_read,
	input wire mem_write,
	input wire mem_type,
	input wire mem_to_reg,
	input wire reg_write,
	input wire [31:0] immediate,
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

wire aluz;
wire [4:0] aluop_out;
wire [31:0] alu_result;
reg [4:0] dst_regid;
reg [4:0] wreg;
reg [31:0] exout;
reg [31:0] data_s_alu;
reg [31:0] data_t_alu;
reg [31:0] expc_branch;
reg [31:0] exdst_jump;

assign reg_probe   = wreg;
assign data_probe  = exout;
assign write_probe = reg_write & ~mem_to_reg;

alucontrol alucontrol(
	.funct(funct),
	.opcode(opcode),
	.aluop_in(alu_op),
	.aluop_out(aluop_out)
);

alu alu(
	.aluop(aluop_out),
	.s(data_s_alu),
	.t(data_t_alu),
	.shamt(immediate[10:6]),
	.zero(aluz),
	.out(alu_result)
);

always @(*) begin
	data_s_alu  = alu_s    ? data_c0   : data_s;
	data_t_alu  = alu_t    ? immediate : data_t;
	exout       = is_link  ? pc_next   : alu_result;
	dst_regid   = dst_reg  ? reg_d     : reg_t;
	wreg        = is_link  ? 5'd31     : dst_regid;
	exdst_jump  = dst_jump ? data_s   : pc_jump;
	expc_branch = pc_next + (immediate << 2);
end

always @(posedge clk) begin
	if (reset) begin
		is_branch_out  = 0;
		pc_branch      = 0;
		alu_zero       = 0;
		mem_read_out   = 0;
		mem_write_out  = 0;
		mem_type_out   = 0;
		mem_to_reg_out = 0;
		alu_out        = 0;
		data_t_out     = 0;
		reg_addr       = 0;
		reg_write_out  = 0;
		is_jump_out    = 0;
		pc_jump_out    = 0;
	end else if (we) begin
		is_branch_out  = is_branch;
		pc_branch      = expc_branch;
		alu_zero       = aluz;
		mem_read_out   = mem_read;
		mem_write_out  = mem_write;
		mem_type_out   = mem_type;
		mem_to_reg_out = mem_to_reg;
		alu_out        = exout;
		data_t_out     = data_t;
		reg_addr       = wreg;
		reg_write_out  = reg_write;
		is_jump_out    = is_jump;
		pc_jump_out    = exdst_jump;
	end
end

endmodule
