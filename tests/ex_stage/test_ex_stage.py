import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure

# module ex_stage (
# 	input wire clk,
# 	input wire reset,
# 	input wire we,
# 	// Control signals
# 	// - Forward 
# 	output wire [4:0] reg_probe,
# 	output wire [31:0] data_probe,
# 	output wire write_probe,
# 	// Inputs
# 	input wire alu_s,
# 	input wire alu_t,
# 	input wire alu_op,
# 	input wire dst_reg,
# 	input wire is_link,
# 	input wire is_jump,
# 	input wire dst_jump,
# 	input wire [31:0] pc_jump,
# 	input wire [31:0] pc_next,
# 	input wire [31:0] data_s,
# 	input wire [31:0] data_t,
# 	input wire [31:0] data_c0,
# 	input wire [5:0] opcode,
# 	input wire [5:0] funct,
# 	input wire [4:0] reg_s,
# 	input wire [4:0] reg_t,
# 	input wire [4:0] reg_d,
# 	input wire is_branch,
# 	input wire mem_read,
# 	input wire mem_write,
# 	input wire mem_type,
# 	input wire mem_to_reg,
# 	input wire reg_write,
# 	input wire [31:0] immediate,
# 	// Outputs
# 	// - Mem
# 	output reg is_branch_out,
# 	output reg [31:0] pc_branch,
# 	output reg alu_zero,
# 	output reg mem_read_out,
# 	output reg mem_write_out,
# 	output reg mem_type_out,
# 	output reg mem_to_reg_out,
# 	output reg [31:0] alu_out,
# 	output reg [31:0] data_t_out,
# 	output reg [4:0] reg_addr,
# 	// - Wb
# 	output reg reg_write_out,
# 	// Feedback
# 	output reg is_jump_out,
# 	output reg [31:0] pc_jump_out
# );

#`define FN_ADD 6'h20
#`define FN_SUB 6'h22
#`define FN_AND 6'h24
#`define FN_NOR 6'h27
#`define FN_OR  6'h25
#`define FN_XOR 6'h26
#`define FN_SLL 6'h0
#`define FN_SRL 6'h2
#`define FN_SRA 6'h3
#`define FN_SLT 6'h2a
#`define FN_MUL 6'h18
#`define FN_DIV 6'h1a
#`define FN_JR  6'h8
#`define FN_SYS 6'hc

basic_aluop = [
	{'ALUCTRL': 0x20, 'PY': '+'},
	{'ALUCTRL': 0x22, 'PY': '-'},
	{'ALUCTRL': 0x24, 'PY': '&'},
	{'ALUCTRL': 0x25, 'PY': '|'},
	{'ALUCTRL': 0x26, 'PY': '^'}
]

iterations = 1000

@cocotb.test()
def ex_stage_coreop(dut):
	"""EX_STAGE RANDOM ALU OPERATION"""
	cocotb.fork(Clock(dut.clk, 10).start())
	for i in range(0, iterations):
		immediate = random.randint(0, 0x7FFFFFFF)
		data_s    = random.randint(0, 0x7FFFFFFF)
		data_t    = random.randint(0, 0x7FFFFFFF)
		data_c0   = random.randint(0, 0x7FFFFFFF)
		reg_s     = random.randint(0, 31)
		reg_t     = random.randint(0, 31)
		reg_d     = random.randint(0, 31)
		op        = random.randint(0, len(basic_aluop) - 1)
		op_dst    = random.randint(0, 1)
		isc0      = random.randint(0, 1)
		isimm     = random.randint(0, 1)
		dut.we         = 1
		dut.reset      = 0
		dut.alu_s      = isc0
		dut.alu_t      = isimm
		dut.alu_op     = 0
		dut.dst_reg    = op_dst
		dut.is_link    = 0
		dut.is_jump    = 0
		dut.dst_jump   = 0
		dut.pc_jump    = 0
		dut.pc_next    = 0
		dut.data_s     = data_s
		dut.data_t     = data_t
		dut.data_c0    = data_c0
		dut.opcode     = 0
		dut.funct      = basic_aluop[op]['ALUCTRL']
		dut.reg_s      = reg_s
		dut.reg_t      = reg_t
		dut.reg_d      = reg_d
		dut.is_branch  = 0
		dut.mem_read   = 0
		dut.mem_write  = 0
		dut.mem_type   = 0
		dut.mem_to_reg = 0
		dut.reg_write  = 0
		dut.immediate  = immediate
		yield Timer(6)
		yield FallingEdge(dut.clk)
		s = data_c0 if isc0 else data_s
		t = immediate if isimm else data_t
		fsimul = eval(str(s) + basic_aluop[op]['PY'] + str(t))
		if fsimul & 0xFFFFFFFF != int(dut.alu_out):
			raise TestFailure("ALU output: %d, FSimulation: %d (%s)" % (int(dut.alu_out),fsimul,str(s) + basic_aluop[op]['PY'] + str(t)))

# shifting tests
# jump
# link
# branch
