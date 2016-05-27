import cocotb
from cocotb.triggers import Timer
from cocotb.result import TestFailure
from hzdcontrol_model import hzdcontrol_model
import random


@cocotb.test()
def hzdcontrol_test(dut):
    """ Simple test for hzdcontrol """
    yield Timer(2)


    #OPCODE_BIT_MASK = 64512
    OPCODE_BIT_MASK =  0b1111110000000000
    RS_BIT_MASK = 0b1111100000
    RT_BIT_MASK = 0b11111

    # Initialize variables
    #memtoreg = random.randint(0, 1)
    #rt = random.randint(0, 1)
    instruction =  2382364672
    memtoreg = 1
    rt = 0
    opcode = (instruction & OPCODE_BIT_MASK) >> 10
    ex_rs = (instruction & RS_BIT_MASK) >> 5
    ex_rt = instruction & RT_BIT_MASK

    # Assign variables
    dut.rt = rt
    dut.memtoreg = memtoreg
    dut.opcode = (instruction & OPCODE_BIT_MASK) >> 10
    dut.ex_rs = (instruction & RS_BIT_MASK) >> 5
    dut.ex_rt = instruction & RT_BIT_MASK

    yield Timer(2)

    if int(dut.stall) != hzdcontrol_model(memtoreg, rt, opcode, ex_rs, ex_rt):
        raise TestFailure(
            "Hzd result is incorrect: %s !" % str(dut.stall))
    else:  # these last two lines are not strictly necessary
        dut.log.info("Ok!")
