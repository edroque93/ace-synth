import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure
from wb_stage_model import wb_stage_model
import random


@cocotb.test()
def wb_stage_test(dut):
    """ Simple test for wb_stage """

    cocotb.fork(Clock(dut.clk, 5000).start())

    # Initialize variables
    reset = random.randint(0,1)
    we = random.randint(0,1)
    reg_data = random.randint(0, 31)
    reg_addr = random.randint(0, 31)
    reg_write = random.randint(0,1)

    # Assign variables
    dut.reset = reset
    dut.we = we
    dut.reg_data = reg_data
    dut.reg_addr = reg_addr
    dut.reg_write = reg_write

    yield FallingEdge(dut.clk)

    (reg_probe, data_probe, write_probe, reg_data_out, reg_addr_out, reg_write_out) = wb_stage_model(reset, we, reg_data, reg_addr, reg_write)

    #if int(dut.reg_probe) != reg_probe or int(dut.data_probe) != data_probe or int(dut.write_probe) != write_probe or int(dut.reg_data_out) != reg_data_out or int(dut.reg_addr_out) != reg_addr_out or int(dut.reg_write_out) != reg_write_out:
       # raise TestFailure(
           # "Fwd result is incorrect!")
    if int(dut.reg_probe) != reg_probe or int(dut.data_probe) != data_probe:
        raise TestFailure(
           "Fwd result is incorrect %s %s %s %s" %
                (int(dut.reg_probe), reg_probe, int(dut.data_probe), data_probe))
    else:  # these last two lines are not strictly necessary
        dut.log.info("Ok!")
