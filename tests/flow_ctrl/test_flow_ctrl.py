import cocotb
from cocotb.triggers import Timer
from cocotb.result import TestFailure
from flow_ctrl_model import flow_ctrl_model
import random

@cocotb.test()
def flow_ctrl_test(dut):
    """ Simple test for flow_ctrl """
    yield Timer(2)

    # Initialize variables
    reset = random.randint(0, 1)
    dc_stall = random.randint(0, 1)
    is_branch = random.randint(0, 1)
    is_jump = random.randint(0, 1)
    hzd_stall = random.randint(0, 1)
    ic_stall = random.randint(0, 1)

    # Assign variables
    dut.reset = reset
    dut.dc_stall = dc_stall
    dut.is_branch = is_branch
    dut.is_jump = is_jump
    dut.hzd_stall = hzd_stall
    dut.ic_stall = ic_stall

    yield Timer(2)

    (pc_reset, pc_we, if_reset, if_we, id_reset, id_we, ex_reset, id_we, ex_reset, ex_we, mem_reset, mem_we, wb_reset, we_we) = flow_ctrl_model(reset, dc_stall, is_branch, is_jump, hzd_stall, ic_stall
)
    if int(dut.reset) != reset or int(dut.dc_stall) != dc_stall or int(dut.is_branch) != is_branch or int(dut.is_jump) != is_jump or int(dut.hzd_stall) != hzd_stall or int(dut.ic_stall) != ic_stall:
        raise TestFailure(
            "Flow result is incorrect!")
    else:  # these last two lines are not strictly necessary
        dut.log.info("Ok!")
