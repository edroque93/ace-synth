import cocotb
from cocotb.triggers import Timer
from cocotb.result import TestFailure
from fwdcontrol_model import fwdcontrol_model
import random


@cocotb.test()
def fwdcontrol_test(dut):
    """ Simple test for fwdcontrol """
    yield Timer(2)

    # Initialize variables
    rs = random.randint(0, 31)
    rt = random.randint(0, 31)
    ex_reg = random.randint(0, 31)
    mem_reg = random.randint(0, 31)
    wb_reg = random.randint(0, 31)
    ex_write = random.randint(0, 1)
    mem_write = random.randint(0, 1)
    wb_write = random.randint(0, 1)

    # Assign variables
    dut.rs = rs
    dut.rt = rt
    dut.ex_reg = ex_reg
    dut.mem_reg = mem_reg
    dut.wb_reg = wb_reg
    dut.ex_write = ex_write
    dut.mem_write = mem_write
    dut.wb_write = wb_write


    yield Timer(2)

    if int(dut.ctrl_rs) != fwdcontrol_model(rs, ex_reg, mem_reg, wb_reg, ex_write, mem_write, wb_write):
        raise TestFailure(
            "Fwd result is incorrect: %s !" % str(dut.ctrl_rs))
    elif int(dut.ctrl_rt) != fwdcontrol_model(rt, ex_reg, mem_reg, wb_reg, ex_write, mem_write, wb_write):
        raise TestFailure(
            "Fwd result is incorrect: %s !" % str(dut.ctrl_rt))
    else:  # these last two lines are not strictly necessary
        dut.log.info("Ok!")
