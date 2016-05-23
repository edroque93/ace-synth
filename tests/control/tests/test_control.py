import cocotb
from cocotb.triggers import Timer
from cocotb.result import TestFailure
from control_model import control_model
import random


@cocotb.test()
def control_test(dut):
    """ Simple test for control """
    yield Timer(2)

    # Initialize variables
    cpu_mode = random.randint(0, 1)
    funct = random.randint(0, 63)
    opcode = random.randint(0, 63)

    # Assign variables
    dut.cpu_mode = cpu_mode
    dut.funct = funct
    dut.opcode = opcode

    yield Timer(2)

    (regwrite, memtoreg, memread, memwrite, memtype, isbranch, isjump, jumpdst, islink, regdst, aluop, alu_s, alu_t, exc_ri, exc_sys, cowrite, exc_ret) = control_model(opcode, funct, cpu_mode)

    if int(dut.regwrite) != regwrite or int(dut.memtoreg) != memtoreg or int(dut.memread) != memread or int(dut.memwrite) != memwrite or int(dut.memtype) != memtype or int(dut.isbranch) != isbranch or int(dut.isjump) != isjump or int(dut.islink) != islink or int(dut.regdst) != regdst or int(dut.aluop) != aluop or int(dut.alu_s) != alu_s or int(dut.alu_t) != alu_t or int(dut.exc_ri) != exc_ri or int(dut.exc_sys) != exc_sys or int(dut.cowrite) != cowrite or int(dut.exc_ret) != exc_ret:
        raise TestFailure(
            "Fwd result is incorrect !")
    else:  # these last two lines are not strictly necessary
        dut.log.info("Ok!")
