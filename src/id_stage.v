`ifdef TEST_COCOTB
	`include "control.v"
	`include "regfile.v"
`endif

module id_stage (
	input wire clk,
	input wire reset,
	input wire flush,
	input wire we,
	// Control signals
	// - Forward
	output reg [4:0] rs_probe,
	output reg [4:0] rt_probe,
	input wire [1:0] ctrl_rs,
	input wire [1:0] ctrl_rt,
	input wire [31:0] ex_data,
	input wire [31:0] mem_data,
	input wire [31:0] wb_data,
	// - Hazard
	output reg [15:0] instr_top,
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
	output reg [5:0] opcode,
	output reg [5:0] funct,
	output reg [4:0] reg_s,
	output reg [4:0] reg_t,
	output reg [4:0] reg_d,
	output reg [31:0] immediate,
	// - Mem
	output reg is_branch,
	output reg mem_read,
	output reg mem_write,
	output reg mem_type,
	output reg mem_to_reg,
	// - Wb
	input wire [4:0] reg_addr,
	input wire [31:0] reg_data,
	input wire reg_write,
	output reg reg_write_out
);

wire [31:0] reg_rs;
wire [31:0] reg_rt;
reg [31:0] id_data_rs;
reg [31:0] id_data_rt;
wire id_alu_s;
wire id_alu_t;
wire id_aluop;
wire id_regdst;
wire id_isjump;
wire id_jumpdst;
wire id_islink;
wire id_exc_ret;
wire id_isbranch;
wire id_memread;
wire id_memtoreg;
wire id_memwrite;
wire id_membyte;
wire id_regwrite;
wire id_cowrite;
wire id_exc_sys;
wire id_exc_ri;
reg [31:0] id_imm;
reg [31:0] id_pc_jump;

control control ( // ok
	.opcode(instruction[31:26]),
	.funct(instruction[5:0]),
	.user_mode(1),
	.alu_s(id_alu_s),
	.alu_t(id_alu_t),
	.aluop(id_aluop),
	.regdst(id_regdst),
	.isjump(id_isjump),
	.jumpdst(id_jumpdst),
	.islink(id_islink),
	.exc_ret(id_exc_ret),
	.isbranch(id_isbranch),
	.memread(id_memread),
	.memtoreg(id_memtoreg),
	.memwrite(id_memwrite),
	.membyte(id_membyte),
	.regwrite(id_regwrite),
	.cowrite(id_cowrite),
	.exc_sys(id_exc_sys),
	.exc_ri(id_exc_ri)
);

regfile regfile( // OK
	.clk(clk),
	.reset(reset),
	.enable(reg_write),
	.rreg1(instruction[25:21]),
	.rreg2(instruction[20:16]),
 	.rdata1(reg_rs),
	.rdata2(reg_rt),
	.wreg(reg_addr),
	.wdata(reg_data)
);

always @* begin
	case (ctrl_rs)
	0: id_data_rs = reg_rs;
	1: id_data_rs = ex_data;
	2: id_data_rs = mem_data;
	3: id_data_rs = wb_data;
	endcase
end

always @* begin
	case (ctrl_rs)
	0: id_data_rt = reg_rt;
	1: id_data_rt = ex_data;
	2: id_data_rt = mem_data;
	3: id_data_rt = wb_data;
	endcase
end

always @(*) begin
	id_pc_jump = {pc_next[31:28], instruction[25:0], 2'b00};
	id_imm     = {{16{instruction[15]}}, instruction[15:0]};
	instr_top  = instruction[31:16];
end

always @(posedge clk) begin
	if (reset | flush) begin
		rs_probe    = 0;
		rt_probe    = 0;
		alu_s       = 0;
		alu_t       = 0;
		alu_op      = 0;
		dst_reg     = 0;
		is_link     = 0;
		is_jump     = 0;
		dst_jump    = 0;
		pc_jump     = 0;
		pc_next_out = 0;
		data_s      = 0;
		data_t      = 0;
		opcode      = 0;
		funct       = 0;
		reg_s       = 0;
		reg_t       = 0;
		reg_d       = 0;
		is_branch   = 0;
		mem_read    = 0;
		mem_write   = 0;
		mem_type    = 0;
		mem_to_reg  = 0;
		reg_write_out   = 0;
		immediate   = 0;
	end else if (we) begin
		rs_probe    = instruction[25:21];
		rt_probe    = instruction[20:16];
		alu_s       = id_alu_s;
		alu_t       = id_alu_t;
		alu_op      = id_aluop;
		dst_reg     = id_regdst;
		is_link     = id_islink;
		is_jump     = id_isjump;
		dst_jump    = id_jumpdst;
		pc_jump     = id_pc_jump;
		pc_next_out = pc_next;
		data_s      = id_data_rs;
		data_t      = id_data_rt;
		opcode      = instruction[31:26];
		funct       = instruction[5:0];
		reg_s       = instruction[25:21];
		reg_t       = instruction[20:16];
		reg_d       = instruction[15:11];
		is_branch   = id_isbranch;
		mem_read    = id_memread;
		mem_write   = id_memwrite;
		mem_type    = id_membyte;
		mem_to_reg  = id_memtoreg;
		reg_write_out   = id_regwrite;
		immediate   = id_imm;
	end
end

endmodule
