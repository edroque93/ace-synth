import random
import cocotb
from cocotb.triggers import Timer
from cocotb.result import TestFailure

# module alu(
#         input wire [4:0] aluop,
#         input wire [N-1:0] s,
#         input wire [N-1:0] t,
#         input wire [4:0] shamt,
#         output reg zero = 1'd0,
#         output reg overflow = 1'd0,
#         output reg [N-1:0] out = {N{1'b0}}
# );

op = {
	'AND': 0x0,
	'OR':  0x1,
	'ADD': 0x2,
	'NOR': 0x3,
	'SLL': 0x4,
	'SUB': 0x6,
	'SLT': 0x7,
	'SRL': 0x8,
	'SRA': 0x9,
	'XOR': 0xa,
	'BEQ': 0xb,
	'BNE': 0xc,
	'LUI': 0xd,
	'MUL': 0xe,
	'DIV': 0xf,
	'MOV': 0x10
}

iterations = 100

@cocotb.test()
def alu_and(dut):
	"""ALU AND"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['AND']
		yield Timer(1)
		if (s & t) != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))

@cocotb.test()
def alu_or(dut):
	"""ALU OR"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['OR']
		yield Timer(1)
		if (s | t) != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))

@cocotb.test()
def alu_add(dut):
	"""ALU ADD"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['ADD']
		yield Timer(1)
		if (s+t) & 0xFFFFFFFF != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))
		if ((s+t) > 0xFFFFFFFF) != int(dut.overflow):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))

@cocotb.test()
def alu_nor(dut):
	"""ALU NOR"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['NOR']
		yield Timer(1)
		if ~(s | t) & 0xFFFFFFFF != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))

@cocotb.test()
def alu_sll(dut):
	"""ALU SLL"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		shamt = random.randint(0,0x1F)
		dut.s = s
		dut.shamt = shamt
		dut.aluop = op['SLL']
		yield Timer(1)
		if (s << shamt) & 0xFFFFFFFF != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,shamt,str(dut.out)))

@cocotb.test()
def alu_sub(dut):
	"""ALU SUB"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['SUB']
		yield Timer(1)
		if (s - t) & 0xFFFFFFFF != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))

@cocotb.test()
def alu_slt(dut):
	"""ALU SLT"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['SLT']
		yield Timer(1)
		if (s & 0x80000000 != t & 0x80000000):
			if int(s & 0x80000000 > t & 0x80000000) != int(dut.out):
				raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))
		else:
			if int(s < t) != int(dut.out):
				raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))

@cocotb.test()
def alu_srl(dut):
	"""ALU SRL"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		shamt = random.randint(0,0x1F)
		dut.s = s
		dut.shamt = shamt
		dut.aluop = op['SRL']
		yield Timer(1)
		if (s >> shamt) != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,shamt,str(dut.out)))

@cocotb.test()
def alu_sra(dut):
	"""ALU SRA"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		shamt = random.randint(0,0x1F)
		dut.s = s
		dut.shamt = shamt
		dut.aluop = op['SRA']
		yield Timer(1)
		if (s % 0x100000000 >> shamt) != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,shamt,str(dut.out)))

@cocotb.test()
def alu_xor(dut):
	"""ALU XOR"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['XOR']
		yield Timer(1)
		if (s ^ t) != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,shamt,str(dut.out)))

@cocotb.test()
def alu_beq(dut):
	"""ALU BEQ"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['BEQ']
		yield Timer(1)
		if ((s - t) == 0) != int(dut.zero):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,shamt,str(dut.out)))

@cocotb.test()
def alu_bne(dut):
	"""ALU BNE"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['BNE']
		yield Timer(1)
		if ((s - t) == 0) == int(dut.zero):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,shamt,str(dut.out)))

@cocotb.test()
def alu_lui(dut):
	"""ALU LUI"""
	for i in range(0, iterations):
		t = random.randint(0,0xFFFFFFFF)
		dut.t = t
		dut.aluop = op['LUI']
		yield Timer(1)
		if  (t << 16) == int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,shamt,str(dut.out)))

@cocotb.test()
def alu_mul(dut):
	"""ALU MUL"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['MUL']
		yield Timer(1)
		if (s * t) & 0xFFFFFFFF != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))

@cocotb.test()
def alu_div(dut):
	"""ALU DIV"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		t = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.t = t
		dut.aluop = op['DIV']
		yield Timer(1)
		if (t == 0) != int(dut.overflow):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))
		if t != 0 and (int(s / t) & 0xFFFFFFFF) != int(dut.out):
			raise TestFailure("Wrong result: %d, %d = %s" % (s,t,str(dut.out)))

@cocotb.test()
def alu_mov(dut):
	"""ALU MOV"""
	for i in range(0, iterations):
		s = random.randint(0,0xFFFFFFFF)
		dut.s = s
		dut.aluop = op['MOV']
		yield Timer(1)
		if s != int(dut.out):
			raise TestFailure("Wrong result: %d = %s" % (s,str(dut.out)))
