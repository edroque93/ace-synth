import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure

# module regfile(
# 	input wire clk,
# 	input wire reset,
# 	input wire [ADDR-1:0] rreg1, rreg2,
# 	output reg [WIDTH-1:0] rdata1 = {WIDTH{1'b0}},
# 	output reg [WIDTH-1:0] rdata2 = {WIDTH{1'b0}},
# 	input wire enable,
# 	input wire [ADDR-1:0] wreg,
# 	input wire [WIDTH-1:0] wdata
# );

iterations = 1000;

@cocotb.test()
def regfile_write_enable(dut):
	"""REGFILE WRITE AND READ"""
	cocotb.fork(Clock(dut.clk, 5000).start())
	for i in range(0, iterations):
		reg = random.randint(0, 31)
		data = random.randint(0, 0xFFFFFFFF)
		dut.enable = 1
		dut.wreg   = reg
		dut.wdata  = data
		yield FallingEdge(dut.clk)
		dut.enable = 0
		dut.rreg1  = reg
		dut.rreg2  = reg
		yield FallingEdge(dut.clk)
		if reg == 0:
			if (int(dut.rdata1) != 0 or int(dut.rdata2) != 0):
					raise TestFailure("Wrong w/r operation: %d, %d" % (reg,data))
		else:
			if (int(dut.rdata1) != data or int(dut.rdata2) != data):
					raise TestFailure("Wrong w/r operation: %d, %d" % (reg,data))

@cocotb.test()
def regfile_write_disabled(dut):
	"""REGFILE WRITE DISABLED AND READ"""
	cocotb.fork(Clock(dut.clk, 5000).start())
	for i in range(0, iterations):
		reg = random.randint(0, 31)
		data = random.randint(0, 0xFFFFFFFF)
		dut.enable = 0
		dut.wreg   = reg
		dut.wdata  = data
		yield FallingEdge(dut.clk)
		dut.rreg1  = reg
		dut.rreg2  = reg
		yield FallingEdge(dut.clk)
		if (int(dut.rdata1) != 0 or int(dut.rdata2) != 0):
				raise TestFailure("Wrong w/r operation: %d, %d" % (reg,data))
