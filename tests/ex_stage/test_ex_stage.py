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
		reg_s     = random.randint(1, 30)
		reg_t     = random.randint(1, 30)
		reg_d     = random.randint(1, 30)
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
		r = reg_d if op_dst else reg_t
		fsimul = eval(str(s) + basic_aluop[op]['PY'] + str(t))
		if fsimul & 0xFFFFFFFF != int(dut.alu_out):
			raise TestFailure("ALU output: %d, FSimulation: %d (%s)" % (int(dut.alu_out),fsimul,str(s) + basic_aluop[op]['PY'] + str(t)))
		if r != int(dut.reg_addr):
			raise TestFailure("Reg dst: %d, Wrong reg dst: %d" % (r, int(dut.reg_addr)))
		if fsimul & 0xFFFFFFFF != dut.data_probe:
			raise TestFailure("Wrong data probe")
		if r != dut.reg_probe:
			raise TestFailure("Wrong reg probe")
		if not dut.write_probe:
			raise TestFailure("Wrong write probe")

@cocotb.test()
def ex_stage_jumplink(dut):
	"""EX_STAGE JUMPLINK OPERATION"""
	cocotb.fork(Clock(dut.clk, 10).start())
	for i in range(0, iterations):
		pc_next = random.randint(0, 0xFFFFFFFF)
		dut.we         = 1
		dut.reset      = 0
		dut.alu_s      = 0
		dut.alu_t      = 0
		dut.alu_op     = 0
		dut.dst_reg    = 0
		dut.is_link    = 1
		dut.is_jump    = 1
		dut.dst_jump   = 0
		dut.pc_jump    = 0
		dut.pc_next    = pc_next
		dut.data_s     = 0
		dut.data_t     = 0
		dut.data_c0    = 0
		dut.opcode     = 0
		dut.funct      = 0
		dut.reg_s      = 0
		dut.reg_t      = 0
		dut.reg_d      = 0
		dut.is_branch  = 0
		dut.mem_read   = 0
		dut.mem_write  = 0
		dut.mem_type   = 0
		dut.mem_to_reg = 0
		dut.reg_write  = 0
		dut.immediate  = 0
		yield Timer(6)
		yield FallingEdge(dut.clk)
		if pc_next != dut.alu_out:
			raise TestFailure("pc_next: %d, Wrong pc_next: %d" % (pc_next, int(dut.alu_out)))
		if 31 != int(dut.reg_addr):
			raise TestFailure("Reg dst: 31, Wrong reg dst: %d" % (int(dut.reg_addr)))

@cocotb.test()
def ex_stage_branch(dut):
	"""EX_STAGE BRANCH OPERATION"""
	cocotb.fork(Clock(dut.clk, 10).start())
	for i in range(0, iterations):
		immediate  = random.randint(-10000, +10000)
		pc_next    = random.randint(0, 0x0FFFFFFF)
		branchtype = random.randint(4, 5) # BEQ, BNE
		data_s     = random.randint(0, 0x7FFFFFFF)
		data_t     = random.randint(0, 0x7FFFFFFF)
		dut.we         = 1
		dut.reset      = 0
		dut.alu_s      = 0
		dut.alu_t      = 0
		dut.alu_op     = 1
		dut.dst_reg    = 0
		dut.is_link    = 0
		dut.is_jump    = 0
		dut.dst_jump   = 0
		dut.pc_jump    = 0
		dut.pc_next    = pc_next
		dut.data_s     = data_s
		dut.data_t     = data_t
		dut.data_c0    = 0
		dut.opcode     = branchtype
		dut.funct      = 0
		dut.reg_s      = 0
		dut.reg_t      = 0
		dut.reg_d      = 0
		dut.is_branch  = 1
		dut.mem_read   = 0
		dut.mem_write  = 0
		dut.mem_type   = 0
		dut.mem_to_reg = 0
		dut.reg_write  = 0
		dut.immediate  = immediate
		yield Timer(6)
		yield FallingEdge(dut.clk)
		branch = pc_next + (immediate << 2)
		if branch & 0xFFFFFFFF != int(dut.pc_branch):
			raise TestFailure("pc_branch: %d, Wrong pc_branch: %d" % (branch, int(dut.pc_branch)))
		simulz = (data_s - data_t) == 0
		simulz = not simulz if branchtype == 5 else simulz
		if simulz != int(dut.alu_zero):
			raise TestFailure("Wrong branch alu_zero")

@cocotb.test()
def ex_stage_jump(dut):
	"""EX_STAGE JUMP OPERATION"""
	cocotb.fork(Clock(dut.clk, 10).start())
	for i in range(0, iterations):
		pc_jump = random.randint(0, 0xFFFFFFFF)
		data_s  = random.randint(0, 0xFFFFFFFF)
		jmp_d_r = random.randint(0, 1)
		dut.we         = 1
		dut.reset      = 0
		dut.alu_s      = 0
		dut.alu_t      = 0
		dut.alu_op     = 0
		dut.dst_reg    = 0
		dut.is_link    = 0
		dut.is_jump    = 1
		dut.dst_jump   = jmp_d_r
		dut.pc_jump    = pc_jump
		dut.pc_next    = 0
		dut.data_s     = data_s
		dut.data_t     = 0
		dut.data_c0    = 0
		dut.opcode     = 0
		dut.funct      = 0
		dut.reg_s      = 0
		dut.reg_t      = 0
		dut.reg_d      = 0
		dut.is_branch  = 0
		dut.mem_read   = 0
		dut.mem_write  = 0
		dut.mem_type   = 0
		dut.mem_to_reg = 0
		dut.reg_write  = 0
		dut.immediate  = 0
		yield Timer(6)
		yield FallingEdge(dut.clk)
		jump = data_s if jmp_d_r else pc_jump
		if jump != int(dut.pc_jump_out):
			print jump, data_s, pc_jump
			raise TestFailure("pc_jump: %d, Wrong pc_jump: %d" % (jump, int(dut.pc_jump_out)))
