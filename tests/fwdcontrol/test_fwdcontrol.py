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
    ex_dst = random.randint(0, 31)
    mem_dst = random.randint(0, 31)
    wb_dst = random.randint(0, 31)
    ex_rw = random.randint(0, 1)
    mem_rw = random.randint(0, 1)
    wb_rw = random.randint(0, 1)

    # Assign variables
    dut.rs = rs
    dut.rt = rt
    dut.ex_dst = ex_dst
    dut.mem_dst = mem_dst
    dut.wb_dst = wb_dst
    dut.ex_rw = ex_rw
    dut.mem_rw = mem_rw
    dut.wb_rw = wb_rw


    yield Timer(2)

    if int(dut.ctrl_rs) != fwdcontrol_model(rs, ex_dst, mem_dst, wb_dst, ex_rw, mem_rw, wb_rw):
        raise TestFailure(
            "Fwd result is incorrect: %s !" % str(dut.ctrl_rs))
    elif int(dut.ctrl_rt) != fwdcontrol_model(rt, ex_dst, mem_dst, wb_dst, ex_rw, mem_rw, wb_rw):
        raise TestFailure(
            "Fwd result is incorrect: %s !" % str(dut.ctrl_rt))
    else:  # these last two lines are not strictly necessary
        dut.log.info("Ok!")
