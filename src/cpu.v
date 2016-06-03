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

// Wires for flow_ctrl
wire flow_ctrl_pc_we;
wire flow_ctrl_pc_flush;
wire flow_ctrl_if_we;
wire flow_ctrl_if_flush;
wire flow_ctrl_id_we;
wire flow_ctrl_id_flush;
wire flow_ctrl_ex_we;
wire flow_ctrl_ex_flush;
wire flow_ctrl_mem_we;
wire flow_ctrl_mem_flush;
wire flow_ctrl_wb_we;
wire flow_ctrl_wb_flush;

// Module flow_ctrl
flow_ctrl flow_ctrl (
	.reset(reset),
	.dc_stall(mem_stage_stall),
	.is_branch(mem_stage_is_branch_out),
	.is_jump(ex_stage_is_jump_out),
	.hzd_stall(hazard_control_stall),
	.ic_stall(~if_stage_hit),
	.pc_we(flow_ctrl_pc_we),
	.pc_flush(flow_ctrl_pc_flush),
	.if_we(flow_ctrl_if_we),
	.if_flush(flow_ctrl_if_flush),
	.id_we(flow_ctrl_id_we),
	.id_flush(flow_ctrl_id_flush),
	.ex_we(flow_ctrl_ex_we),
	.ex_flush(flow_ctrl_ex_flush),
	.mem_we(flow_ctrl_mem_we),
	.mem_flush(flow_ctrl_mem_flush),
	.wb_we(flow_ctrl_wb_we),
	.wb_flush(flow_ctrl_wb_flush)
);

// Wires for forward_ctrl
wire [1:0] forward_ctrl_ctrl_rs;
wire [1:0] forward_ctrl_ctrl_rt;

// Module forward_ctrl
forward_ctrl forward_ctrl (
	.rs(id_stage_rs_probe),
	.rt(id_stage_rt_probe),
	.ex_reg(ex_stage_reg_probe),
	.mem_reg(mem_stage_reg_probe),
	.wb_reg(wb_stage_reg_probe),
	.ex_write(ex_stage_write_probe),
	.mem_write(mem_stage_write_probe),
	.wb_write(wb_stage_write_probe),
	.ctrl_rs(forward_ctrl_ctrl_rs),
	.ctrl_rt(forward_ctrl_ctrl_rt)
);

// Wires for hazard_ctrl
wire hazard_ctrl_stall;

// Module hazard_ctrl
hazard_ctrl hazard_ctrl (
	.memtoreg(mem_stage_mem_to_reg),
	.instr_top(id_stage_instr_top),
	.rt(id_stage_reg_t),
	.stall(hazard_ctrl_stall)
);

// Wires for arbiter
wire arbiter_ic_read_ack;
wire [31:0] arbiter_ic_read_data;
wire arbiter_dc_read_ack;
wire [31:0] arbiter_dc_read_data;
wire arbiter_dc_write_ack;
wire arbiter_mem_read;
wire arbiter_mem_write;
wire [31:0] arbiter_mem_addr;
wire [31:0] arbiter_mem_data_write;

// Module arbiter
arbiter arbiter
	.clk(clk),
	.reset(reset),
	.ic_read_req(if_stage_read_req),
	.ic_read_ack(arbiter_ic_read_ack),
	.ic_read_addr(if_stage_read_addr),
	.ic_read_data(arbiter_ic_read_data),
	.dc_read_req(mem_stage_read_req),
	.dc_read_ack(arbiter_dc_read_ack),
	.dc_read_addr(mem_stage_read_addr),
	.dc_read_data(arbiter_dc_read_data),
	.dc_write_req(mem_stage_write_req),
	.dc_write_ack(arbiter_dc_write_ack),
	.dc_write_addr(mem_stage_write_addr),
	.dc_write_data(mem_stage_write_data),
	.mem_read(arbiter_mem_read),
	.mem_write(arbiter_mem_write),
	.mem_ack(mem_ack),
	.mem_addr(arbiter_mem_addr),
	.mem_data_write(arbiter_mem_data_write),
	.mem_data_read(arbiter_mem_data_read)
);


// Wires for if_stage
wire if_stage_read_req;
wire [31:0] if_stage_read_addr;
wire [31:0] if_stage_instruction;
wire [31:0] if_stage_pc_next;
wire if_stage_hit;

// Module if_stage
if_stage if_stage (
	.clk(clk),
	.reset(reset),
	.flush(flow_ctrl_if_flush),
	.we(flow_ctrl_if_we),
	.pc_reset(flow_ctrl_pc_flush),
	.pc_we(flow_ctrl_pc_we),
	.is_jump(id_stage_is_jump),
	.is_branch(ex_stage_is_branch),
	.jump_addr(id_stage_jump_addr),
	.branch_addr(ex_stage_branch_addr),
	.read_req(if_stage_read_req),
	.read_ack(arbiter_ic_read_ack),
	.read_addr(if_stage_read_addr),
	.read_data(arbiter_ic_read_data),
	.instruction(if_stage_instruction),
	.pc_next(if_stage_pc_next),
	.hit(if_stage_hit)
);

// Wires for id_stage
wire [4:0] id_stage_rs_probe;
wire [4:0] id_stage_rt_probe;
wire [16:0] id_stage_instr_top;
wire id_stage_alu_s;
wire id_stage_alu_t;
wire id_stage_alu_op;
wire id_stage_dst_reg;
wire id_stage_is_link;
wire id_stage_is_jump;
wire id_stage_dst_jump;
wire [31:0] id_stage_pc_jump;
wire [31:0] id_stage_pc_next_out;
wire [31:0] id_stage_data_s;
wire [31:0] id_stage_data_t;
wire [31:0] id_stage_data_c0;
wire [5:0] id_stage_opcode;
wire [4:0] id_stage_reg_s;
wire [4:0] id_stage_reg_t;
wire [4:0] id_stage_reg_d;
wire [31:0] id_stage_immediate;
wire id_stage_is_branch;
wire id_stage_mem_read;
wire id_stage_mem_write;
wire id_stage_mem_type;
wire id_stage_mem_to_reg;
wire id_stage_reg_write;

// Module id_stage
id_stage id_stage (
	.clk(clk),
	.reset(reset),
	.flush(flow_ctrl_id_flush),
	.we(flow_ctrl_we),
	.rs_probe(id_stage_rs_probe),
	.rt_probe(id_stage_rt_probe),
	.ctrl_rs(forward_ctrl_ctrl_rs),
	.ctrl_rt(forward_ctrl_ctrl_rt),
	.ex_data(ex_stage_data_probe),
	.mem_data(mem_stage_data_probe),
	.wb_data(wb_stage_data_probe),
	.instr_top(id_stage_instr_top),
	.instruction(if_stage_instruction),
	.pc_next(if_stage_pc_next),
	.alu_s(id_stage_alu_s),
	.alu_t(id_stage_alu_t),
	.alu_op(id_stage_alu_op),
	.dst_reg(id_stage_dst_reg),
	.is_link(id_stage_is_link),
	.is_jump(id_stage_is_jump),
	.dst_jump(id_stage_dst_jump),
	.pc_jump(id_stage_pc_jump),
	.pc_next_out(id_stage_pc_next_out),
	.data_s(id_stage_data_s),
	.data_t(id_stage_data_t),
	.data_c0(id_stage_data_c0),
	.opcode(id_stage_opcode),
	.reg_s(id_stage_reg_s),
	.reg_t(id_stage_reg_t),
	.reg_d(id_stage_reg_d),
	.immediate(id_stage_immediate),
	.is_branch(id_stage_is_branch),
	.mem_read(id_stage_mem_read),
	.mem_write(id_stage_mem_write),
	.mem_type(id_stage_mem_type),
	.mem_to_reg(id_stage_mem_to_reg),
	.reg_addr(wb_stage_reg_addr),
	.reg_data(wb_stage_reg_data),
	.reg_write(wb_stage_reg_write)
);

// Wires for ex_stage
wire [4:0] ex_stage_reg_probe;
wire [31:0] ex_stage_data_probe;
wire ex_stage_write_probe;
wire ex_stage_is_branch_out;
wire [31:0] ex_stage_pc_branch;
wire ex_stage_alu_zero;
wire ex_stage_mem_read_out;
wire ex_stage_mem_write_out;
wire ex_stage_mem_type_out;
wire ex_stage_mem_to_reg_out;
wire [31:0] ex_stage_alu_out;
wire [31:0] ex_stage_data_t_out;
wire [4:0] ex_stage_reg_addr;
wire ex_stage_reg_write_out;
wire ex_stage_is_jump_out;
wire [31:0] ex_stage_pc_jump_out;

// Module ex_stage
ex_stage ex_stage (
	.clk(clk),
	.reset(reset | flow_ctrl_ex_flush),
	.we(flow_ctrl_ex_we),
	.reg_probe(ex_stage_reg_probe),
	.data_probe(ex_stage_data_probe),
	.write_probe(ex_stage_write_probe),
	.alu_s(id_stage_alu_s),
	.alu_t(id_stage_alu_t),
	.alu_op(id_stage_alu_op),
	.dst_reg(id_stage_dst_reg),
	.is_link(id_stage_is_link),
	.is_jump(id_stage_is_jump),
	.dst_jump(id_stage_dst_jump),
	.pc_jump(id_stage_pc_jump),
	.pc_next(id_stage_pc_next),
	.data_s(id_stage_data_s),
	.data_t(id_stage_data_t),
	.opcode(id_stage_opcode),
	.funct(id_stage_funct),
	.reg_s(id_stage_reg_s),
	.reg_t(id_stage_reg_t),
	.reg_d(id_stage_reg_d),
	.is_branch(id_stage_is_branch),
	.mem_read(id_stage_mem_read),
	.mem_write(id_stage_mem_write),
	.mem_type(id_stage_mem_type),
	.mem_to_reg(id_stage_mem_to_reg),
	.reg_write(id_stage_reg_write),
	.immediate(id_stage_immediate),
	.is_branch_out(ex_stage_is_branch_out),
	.pc_branch(ex_stage_pc_branch),
	.alu_zero(ex_stage_alu_zero),
	.mem_read_out(ex_stage_mem_read_out),
	.mem_write_out(ex_stage_mem_write_out),
	.mem_type_out(ex_stage_mem_type_out),
	.mem_to_reg_out(ex_stage_mem_to_reg_out),
	.alu_out(ex_stage_alu_out),
	.data_t_out(ex_stage_data_t_out),
	.reg_addr(ex_stage_reg_addr),
	.reg_write_out(ex_stage_reg_write_out),
	.is_jump_out(ex_stage_is_jump_out),
	.pc_jump_out(ex_stage_pc_jump_out)
);

// Wires for mem_stage
wire [4:0] mem_stage_reg_probe;
wire [31:0] mem_stage_data_probe;
wire mem_stage_write_probe;
wire mem_stage_mem_read_req;
wire [31:0] mem_stage_mem_read_addr;
wire mem_stage_mem_write_req;
wire [31:0] mem_stage_mem_write_addr;
wire [31:0] mem_stage_mem_write_data;
wire mem_stage_stall;
wire [31:0] mem_stage_reg_data;
wire [4:0] mem_stage_reg_addr_out;
wire mem_stage_reg_write_out;
wire mem_stage_is_branch_out;
wire [31:0] mem_stage_pc_branch_out;

// Module mem_stage
mem_stage mem_stage (
	.clk(clk),
	.reset(reset),
	.we(flow_ctrl_mem_we),
	.reg_probe(mem_stage_reg_probe),
	.data_probe(mem_stage_data_probe),
	.write_probe(mem_stage_write_probe),
	.mem_read_req(mem_stage_mem_read_req),
	.mem_read_addr(mem_stage_mem_read_addr),
	.mem_read_data(arbiter_dc_read_data),
	.mem_read_ack(arbiter_dc_read_ack),
	.mem_write_req(mem_stage_mem_write_req),
	.mem_write_addr(mem_stage_mem_write_addr),
	.mem_write_data(mem_stage_mem_write_data),
	.mem_write_ack(arbiter_dc_write_ack),
	.stall(mem_stage_stall),
	.is_branch(ex_stage_is_branch_out),
	.pc_branch(ex_stage_pc_branch),
	.alu_zero(ex_stage_alu_zero),
	.mem_read(ex_stage_mem_read),
	.mem_write(ex_stage_mem_write),
	.mem_type(ex_stage_mem_type),
	.mem_to_reg(ex_stage_mem_to_reg),
	.alu_out(ex_stage_alu_out),
	.data_t(ex_stage_data_t),
	.reg_addr(ex_stage_reg_addr),
	.reg_write(ex_stage_reg_write),
	.reg_data(mem_stage_reg_data),
	.reg_addr_out(mem_stage_reg_addr_out),
	.reg_write_out(mem_stage_reg_write_out),
	.is_branch_out(mem_stage_is_branch_out),
	.pc_branch_out(mem_stage_pc_branch_out)
);

// Wires for wb_stage
wire [31:0] wb_stage_reg_data_out;
wire [4:0] wb_stage_reg_addr_out;
wire wb_stage_reg_write_out;

// Module wb_stage
wb_stage wb_stage (
	.clk(clk),
	.reset(reset),
	.we(flow_ctrl_wb_we),
	.reg_data(mem_stage_reg_data),
	.reg_addr(mem_stage_reg_addr_out),
	.reg_write(mem_stage_reg_write_out),
	.reg_data_out(wb_stage_reg_data_out),
	.reg_addr_out(wb_stage_reg_addr_out),
	.reg_write_out(wb_stage_reg_write_out)
);

endmodule
