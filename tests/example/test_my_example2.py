import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure


@cocotb.test()
def my_second_test(dut):
	"""This is my second test"""

	cocotb.fork(Clock(dut.clk, 5000).start())

	yield FallingEdge(dut.clk)
	dut.log.info("Starting test")

	for cycle in range(10):
		dut.data_in = cycle % 2
		yield FallingEdge(dut.clk)
		if int(dut.data_out) != (cycle+1) % 2:
			raise TestFailure("Wrong result in cycle %d: %s" % (cycle, str(dut.data_out)))

	dut.log.info("Finished test")

