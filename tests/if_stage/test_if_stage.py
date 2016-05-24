import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure
from if_stage_model import if_stage_model
import random

class if_stage():
    state = 0
    state_next = 0
    pc_next = 0
    pc_next_next = 0
    read_req = 0
    read_req_next = 0
    read_addr = 0
    read_addr_next = 0
    hit = 0
    hit_next = 0
    instruction = 0
    instruction_next = 0
    pc_interm = 0

    def newcycle(self, reset, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data):
       self.state = self.state_next
       self.read_req = self.read_req_next
       self.hit = self.hit_next
       self.pc_next = self.pc_next_next
       self.read_addr = self.read_addr_next
       self.instruction = self.instruction_next

       if(reset == 1):
           self.state = 0
           self.read_req = 0
           self.read_addr = 0
           self.instruction = 0
           self.pc_next = 0
           self.hit = 0

       if(self.state == 0):
          self.state_next = 1
          if(pc_reset):
              self.pc_next_next = 0
          elif(pc_we):
              pc_interm = jump_addr if is_jump == 1 else self.pc_next
              self.pc_next_next = branch_addr if is_branch == 1 else pc_interm

          self.read_addr_next = self.pc_next_next
          self.read_req_next = 1
          self.pc_next_next = self.pc_next_next + 4
       else:
          self.state_next = 1
          if(read_ack):
              self.instruction_next = read_data
              self.read_req_next = 0
              self.state_next = 0
              self.hit_next = 0

iterations = 1000

@cocotb.test()
def if_stage_test(dut):
    """ Simple test for if_stage """

    fetch = if_stage()
    cocotb.fork(Clock(dut.clk, 5000).start())

    # Initialize variables
    reset = 1
    we = 1
    pc_reset = 0
    pc_we = 1
    is_jump = random.randint(0, 1)
    is_branch = random.randint(0, 1)
    jump_addr = 5
    branch_addr = 7
    read_ack = 1
    read_data = 20
    # Assign variables
    dut.reset = reset
    dut.we = we
    dut.pc_reset = pc_reset
    dut.pc_we = pc_we
    dut.is_jump = is_jump
    dut.is_branch = is_branch
    dut.jump_addr = jump_addr
    dut.branch_addr = branch_addr
    dut.read_ack = read_ack
    dut.read_data = read_data

    fetch.newcycle(reset, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

    if int(dut.pc_next) != fetch.pc_next:
        raise TestFailure(
            "Fetch result is incorrect: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next)))

    for i in range(0, iterations):
        print("[Iteration %s]" % i)

        reset = random.randint(0, 1)
        we = random.randint(0, 1)
        pc_reset = random.randint(0, 1)
        pc_we = random.randint(0, 1)
        is_jump = random.randint(0, 1)
        is_branch = random.randint(0, 1)
        jump_addr = random.randint(0, 63)
        branch_addr = random.randint(0, 63)
        read_ack = random.randint(0, 1)
        read_data = random.randint(0, 63)

        yield FallingEdge(dut.clk)
        #yield FallingEdge(dut.clk)

        #if int(dut.instruction) != fetch.instruction:
        if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
            raise TestFailure(
                "Fetch result is incorrect: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next)))
        else:  # these last two lines are not strictly necessary
            dut.log.info("Ok!")
