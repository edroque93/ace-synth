import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure

@cocotb.test()
def simple_reads(dut):
	"""Test simple sequence of reads"""

	# Start clock
	cocotb.fork(Clock(dut.clk, 5000).start())

	# Reset cache
	dut.reset = 1
	dut.addr    = 0
	dut.data_in = 0
	dut.mem_read  = 0
	dut.mem_write = 0
	dut.mem_type  = 1 # Word
	dut.mem_write_ack = 0
	dut.mem_read_ack  = 0
	dut.mem_read_data = 0
	yield FallingEdge(dut.clk)

	# Unset reset
	dut.reset = 0

	# At this point the cache should have only invalid lines
	# Try this by reading from an address => expect hit = 0
	dut.mem_read = 1
	dut.addr = 0x00000104

	yield Timer(10)

	# Hit is immediate
	if int(dut.hit) != 0:
		raise TestFailure("Cache should be empty, but we have a hit")

	yield FallingEdge(dut.clk)

	# Now the request will be issued
	if int(dut.mem_read_req) != 1:
		raise TestFailure("The cache should have issued a memory read request")
	if int(dut.mem_read_addr) != 0x00000100:
		raise TestFailure("Wrong read address: 0x%08x, expected: 0x00000100" % int(dut.mem_read_addr))

	# To simulate the memory we send the data
	# The size of a cache line is 128 bits => 16 Bytes
	dut.mem_read_data = 0xf0e0d0c0b0a090807060504030201000
	dut.mem_read_ack = 1
	yield FallingEdge(dut.clk)
	dut.mem_read_ack = 0

	# Now we should be able to read successfully
	# We select the second word => 0x70605040
	if int(dut.hit) != 1:
		raise TestFailure("We expect a hit")
	if int(dut.data_out) != 0x70605040:
		raise TestFailure("Wrong data out: 0x%08x, expected: 0x70605040" % int(dut.data_out))

	yield FallingEdge(dut.clk)

	# Change address offset
	dut.addr = 0x00000100
	yield Timer(10)
	if int(dut.hit) != 1:
		raise TestFailure("We expect a hit")
	if int(dut.data_out) != 0x30201000:
		raise TestFailure("Wrong data out: 0x%08x, expected: 0x30201000" % int(dut.data_out))

	# Change address tag
	dut.addr = 0x00000200
	yield Timer(10)
	if int(dut.hit) != 0:
		raise TestFailure("We expect a miss (different tags)")

@cocotb.test()
def reads_and_writes(dut):
	"""Read/Write sequence with evictions"""

	# Start clock
	cocotb.fork(Clock(dut.clk, 5000).start())

	# Reset cache
	dut.reset = 1
	dut.addr    = 0
	dut.data_in = 0
	dut.mem_read  = 0
	dut.mem_write = 0
	dut.mem_type  = 1 # Word
	dut.mem_write_ack = 0
	dut.mem_read_ack  = 0
	dut.mem_read_data = 0
	yield FallingEdge(dut.clk)

	# Unset reset
	dut.reset = 0

	dut.mem_read = 1
	dut.addr = 0x00000100
	yield FallingEdge(dut.clk) # Wait for request
	dut.mem_read_data = 0xf0e0d0c0b0a090807060504030201000
	dut.mem_read_ack = 1
	yield FallingEdge(dut.clk)
	dut.mem_read_ack = 0
	dut.addr = 0x00000110 # Change address index
	yield FallingEdge(dut.clk)
	# Now the request will be issued
	if int(dut.mem_read_req) != 1:
		raise TestFailure("The cache should have issued a memory read request")
	if int(dut.mem_read_addr) != 0x00000110:
		raise TestFailure("Wrong read address: 0x%08x, expected: 0x00000110" % int(dut.mem_read_addr))
	dut.mem_read_data = 0xf1e1d1c1b1a191817161514131211101
	dut.mem_read_ack = 1
	yield FallingEdge(dut.clk)
	if int(dut.hit) != 1:
		raise TestFailure("We expect a hit")
	if int(dut.data_out) != 0x31211101:
		raise TestFailure("Wrong data out: 0x%08x, expected: 0x31211101" % int(dut.data_out))
	dut.mem_read_ack = 0

	# Write to original address
	dut.addr = 0x00000104
	dut.data_in = 0xcafecafe
	dut.mem_read = 0
	dut.mem_write = 1
	yield Timer(10)
	if int(dut.hit) != 1:
		raise TestFailure("We expect a hit")

	yield FallingEdge(dut.clk)

	# Now read from other address with same index
	dut.addr = 0x00000200
	dut.mem_write = 0
	dut.mem_read = 1
	yield FallingEdge(dut.clk)
	if int(dut.mem_write_req) != 1:
		raise TestFailure("The cache should have issued a memory write request (evict)")
	if int(dut.mem_write_addr) != 0x00000100:
		raise TestFailure("Wrong read address: 0x%08x, expected: 0x00000100" % int(dut.mem_read_addr))
	if int(dut.mem_write_data) != 0xf0e0d0c0b0a09080cafecafe30201000:
		raise TestFailure("Wrong write data: 0x%032x,\n  expected: 0xf0e0d0c0b0a090cafecafe30201000" % int(dut.mem_write_data))

	dut.mem_write_ack = 1
	yield FallingEdge(dut.clk)
	dut.mem_write_ack = 0

	if int(dut.mem_read_req) != 1:
		raise TestFailure("The cache should have issued a memory read request")
	if int(dut.mem_read_addr) != 0x00000200:
		raise TestFailure("Wrong read address: 0x%08x, expected: 0x00000200" % int(dut.mem_read_addr))


