import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure


@cocotb.test()
def my_first_test(dut):
	"""This is my first test"""

	cocotb.fork(Clock(dut.clk, 5000).start())

	dut.data_in = 0;
	yield FallingEdge(dut.clk)

	if int(dut.data_out) != 1:
		raise TestFailure("Wrong result in cycle %d: %s" % (cycle, str(dut.data_out)))

