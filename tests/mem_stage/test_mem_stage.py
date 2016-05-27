import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure

@cocotb.test()
def test_alu(dut):
	"""Tests correct execution of a ALU operation"""

	# Start clock
	cocotb.fork(Clock(dut.clk, 5000).start())

	# Reset mem_stage
	dut.reset = 1
	dut.flush = 0
	dut.we = 1
	dut.mem_read_data = 0
	dut.mem_read_ack  = 0
	dut.mem_write_ack = 0
	dut.is_branch     = 0
	dut.pc_branch     = 0
	dut.alu_zero      = 0
	dut.mem_read      = 0
	dut.mem_write     = 0
	dut.mem_type      = 0
	dut.mem_to_reg    = 0
	dut.alu_out       = 0
	dut.data_t        = 0
	dut.reg_addr      = 0
	dut.reg_write     = 0

	yield FallingEdge(dut.clk)

	if int(dut.reg_data) != 0:
		raise TestFailure("data_out is %08x, expected 0" % int(dut.data_out))

	dut.reset = 0
	dut.alu_out   = 0x1234
	dut.reg_addr  = 1
	dut.reg_write = 1

	yield FallingEdge(dut.clk)

	if int(dut.reg_data) != 0x1234:
		raise TestFailure("reg_data is 0x%08x, expected 0x1234" % int(dut.reg_data))

	dut.alu_out = 0x5678
	dut.we = 0

	yield FallingEdge(dut.clk)

	if int(dut.reg_data) != 0x1234:
		raise TestFailure("no write enable, reg_data is 0x%08x, expected 0x1234" % int(dut.reg_data))

@cocotb.test()
def test_branch(dut):
	# Start clock
	cocotb.fork(Clock(dut.clk, 5000).start())

	# Reset mem_stage
	dut.reset = 1
	dut.flush = 0
	dut.we = 1
	dut.mem_read_data = 0
	dut.mem_read_ack  = 0
	dut.mem_write_ack = 0
	dut.is_branch     = 0
	dut.pc_branch     = 0
	dut.alu_zero      = 0
	dut.mem_read      = 0
	dut.mem_write     = 0
	dut.mem_type      = 0
	dut.mem_to_reg    = 0
	dut.alu_out       = 0
	dut.data_t        = 0
	dut.reg_addr      = 0
	dut.reg_write     = 0

	yield FallingEdge(dut.clk)

	dut.reset = 0

	dut.pc_branch = 0x1234
	dut.is_branch = 1

	yield FallingEdge(dut.clk)

	if int(dut.is_branch_out) != 0:
		raise TestFailure("We expect not to branch (alu_zero == 0)")

	dut.is_branch = 0
	dut.alu_zero = 1

	yield FallingEdge(dut.clk)

	if int(dut.is_branch_out) != 0:
		raise TestFailure("We expect not to branch (is_branch == 0)")

	dut.is_branch = 1

	yield FallingEdge(dut.clk)

	if int(dut.is_branch_out) != 1:
		raise TestFailure("We expect to branch")

	if int(dut.pc_branch_out) != 0x1234:
		raise TestFailure("Wrong branch pc: %08x" % int(dut.pc_branch_out))

@cocotb.test()
def test_read(dut):
	# Start clock
	cocotb.fork(Clock(dut.clk, 5000).start())

	# Reset mem_stage
	dut.reset = 1
	dut.flush = 0
	dut.we = 1
	dut.mem_read_data = 0
	dut.mem_read_ack  = 0
	dut.mem_write_ack = 0
	dut.is_branch     = 0
	dut.pc_branch     = 0
	dut.alu_zero      = 0
	dut.mem_read      = 0
	dut.mem_write     = 0
	dut.mem_type      = 0
	dut.mem_to_reg    = 0
	dut.alu_out       = 0
	dut.data_t        = 0
	dut.reg_addr      = 0
	dut.reg_write     = 0

	yield FallingEdge(dut.clk)

	dut.reset = 0

	dut.alu_out = 0x00000100
	dut.mem_read = 1
	dut.mem_to_reg = 1
	dut.reg_addr = 1

	yield FallingEdge(dut.clk)

	# Now the request will be issued
	if int(dut.mem_read_req) != 1:
		raise TestFailure("It should have issued a memory read request")
	if int(dut.mem_read_addr) != 0x00000100:
		raise TestFailure("Wrong read address: 0x%08x, expected: 0x00000100" % int(dut.mem_read_addr))
	if int(dut.stall) != 1:
		raise TestFailure("It should stall")

	# To simulate the memory we send the data
	dut.mem_read_data = 0x30201000
	dut.mem_read_ack = 1
	yield FallingEdge(dut.clk)
	dut.mem_read_ack = 0

	if int(dut.reg_data) != 0x30201000:
		raise TestFailure("Read wrong data: 0x%08x, expected: 0x30201000" % int(dut.reg_data))
	if int(dut.reg_addr_out) != 1:
		raise TestFailure("Wrong register: $%d, expedted: $1" % int(dut.reg_addr_out))
	if int(dut.stall) != 0:
		raise TestFailure("Should not stall")

@cocotb.test()
def test_write(dut):
	# Start clock
	cocotb.fork(Clock(dut.clk, 5000).start())

	# Reset mem_stage
	dut.reset = 1
	dut.flush = 0
	dut.we = 1
	dut.mem_read_data = 0
	dut.mem_read_ack  = 0
	dut.mem_write_ack = 0
	dut.is_branch     = 0
	dut.pc_branch     = 0
	dut.alu_zero      = 0
	dut.mem_read      = 0
	dut.mem_write     = 0
	dut.mem_type      = 0
	dut.mem_to_reg    = 0
	dut.alu_out       = 0
	dut.data_t        = 0
	dut.reg_addr      = 0
	dut.reg_write     = 0

	yield FallingEdge(dut.clk)

	dut.reset = 0

	dut.alu_out = 0x00000100
	dut.data_t = 0x30201000
	dut.mem_write = 1

	yield FallingEdge(dut.clk)

	# Now the request will be issued
	if int(dut.mem_write_req) != 1:
		raise TestFailure("It should have issued a memory write request")
	if int(dut.mem_write_addr) != 0x00000100:
		raise TestFailure("Wrong write address: 0x%08x, expected: 0x00000100" % int(dut.mem_write_addr))
	if int(dut.mem_write_data) != 0x30201000:
		raise TestFailure("Wrond write data: 0x%08x, expected: 0x30201000" % int(dut.mem_write_data))
	if int(dut.stall) != 1:
		raise TestFailure("It should stall")

	dut.mem_write_ack = 1
	yield FallingEdge(dut.clk)
	dut.mem_write_ack = 0

	if int(dut.stall) != 0:
		raise TestFailure("Should not stall")

