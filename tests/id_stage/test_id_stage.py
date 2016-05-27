import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure

# module id_stage (
# 	input wire clk,
# 	input wire reset,
# 	input wire stage_reset,
# 	input wire we,
# 	// Control signals
# 	// Forward
# 	output reg [4:0] rs_probe,
# 	output reg [4:0] rt_probe,
# 	input wire [1:0] ctrl_rs,
# 	input wire [1:0] ctrl_rt,
# 	input wire [31:0] ex_data,
# 	input wire [31:0] mem_data,
# 	input wire [31:0] wb_data,
# 	// Inputs
# 	input wire [31:0] instruction,
# 	input wire [31:0] pc_next,
# 	// Outputs
# 	// - Execute
# 	output reg alu_s,
# 	output reg alu_t,
# 	output reg alu_op,
# 	output reg dst_reg,
# 	output reg is_link,
# 	output reg is_jump,
# 	output reg dst_jump,
# 	output reg [31:0] pc_jump,
# 	output reg [31:0] pc_next_out,
# 	output reg [31:0] data_s,
# 	output reg [31:0] data_t,
# 	output reg [31:0] data_c0,
# 	output reg [5:0] opcode,
# 	output reg [4:0] reg_s,
# 	output reg [4:0] reg_t,
# 	output reg [4:0] reg_d,
# 	output reg [31:0] immediate,
# 	// - Mem
# 	output reg is_branch,
# 	output reg mem_read,
# 	output reg mem_write,
# 	output reg mem_type,
# 	output reg mem_to_reg,
# 	// - Wb
# 	input wire [4:0] reg_addr,
# 	input wire [31:0] reg_data,
# 	output reg reg_write
# );

iterations = 1
sim_rf = []

@cocotb.test()
def id_stage_test(dut):
	"""ID_STAGE TEST"""
	for i in range(0, 31):
		sim_rf.append(0)
	cocotb.fork(Clock(dut.clk, 10).start())
	pc = 0
	for i in range(0, iterations):
		random.seed(13)
		ex_data         = random.randint(0, 0x7FFFFFFF)
		mem_data        = random.randint(0, 0x7FFFFFFF)
		wb_data         = random.randint(0, 0x7FFFFFFF)
		bypass_s        = random.randint(0, 3)
		bypass_t        = random.randint(0, 3)
		fb_addr         = random.randint(1, 31)
		fb_data         = random.randint(0, 0x7FFFFFFF)
		sim_rf[fb_addr] = fb_data
		pc             += 4
		inst            = 0
		rs              = random.randint(0, 31) # RS
		rt              = random.randint(0, 31) # RT
		rd              = random.randint(0, 31) # RD
		inst            = rs
		inst            = (inst << 5) + rt
		inst            = (inst << 5) + rd
		inst          <<= 5 # funct
		inst          <<= 6 # funct
		dut.reset       = 0
		dut.stage_reset = 0
		dut.we          = 1
		dut.ctrl_rs     = bypass_s
		dut.ctrl_rt     = bypass_t
		dut.ex_data     = ex_data
		dut.mem_data    = mem_data
		dut.wb_data     = wb_data
		dut.instruction = 0
		dut.pc_next     = pc
		dut.reg_addr    = fb_addr
		dut.reg_data    = fb_data
		yield Timer(6)
		yield FallingEdge(dut.clk)
		real_s = {
			0: sim_rf[rs],
			1: ex_data,
			2: mem_data,
			3: wb_data
		}
		real_d = {
			0: sim_rf[rt],
			1: ex_data,
			2: mem_data,
			3: wb_data
		}
		if real_s[bypass_s] != dut.data_s:
			print bypass_s, real_s[bypass_s], dut.data_s #, dut.wb_data, dut.ctrl_rs
			raise TestFailure("Wrong s readport")
