import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure
from wb_stage_model import wb_stage_model
import random

class wb_stage():
    reg_data_out = 0
    reg_addr_out = 0
    reg_write_out = 0
    reg_data_out_next = 0
    reg_addr_out_next = 0
    reg_write_out_next = 0

    def newcycle(self, reset, we, reg_data, reg_addr, reg_write):
        self.reg_data_out = self.reg_data_out_next
        self.reg_addr_out = self.reg_addr_out_next
        self.reg_write_out = self.reg_write_out_next
        if reset:
            self.reg_data_out_next = 0
            self.reg_addr_out_next = 0
            self.reg_write_out_next = 0
        else:
            if we:
                self.reg_data_out_next = reg_data
                self.reg_addr_out_next = reg_addr
                self.reg_write_out_next = reg_write


iterations = 1000

@cocotb.test()
def wb_stage_test(dut):
    """ Simple test for wb_stage """

    wback = wb_stage()
    cocotb.fork(Clock(dut.clk, 5000).start())

    # Initialize variables
    reset = 1
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

    wback.newcycle(reset, we, reg_data, reg_addr, reg_write)
    yield FallingEdge(dut.clk)

    for i in range(0, iterations):
        print("[Iteration %s]" % i)
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
        wback.newcycle(reset, we, reg_data, reg_addr, reg_write)

        if int(dut.reg_data_out) != wback.reg_data_out_next or int(dut.reg_addr_out) != wback.reg_addr_out_next or int(dut.reg_write_out) != wback.reg_write_out_next:
            raise TestFailure(
                "Fwd result is incorrect!")
        else:  # these last two lines are not strictly necessary
            dut.log.info("Ok!")
