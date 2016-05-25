import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge
from cocotb.result import TestFailure
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

    def newcycle(self, reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data):
       if(self.state == 0):
           self.state_next = 1
           if(pc_reset):
               self.pc_next_next = 0
           elif(pc_we):
               pc_interm = jump_addr if is_jump == 1 else self.pc_next
               self.pc_next_next = branch_addr if is_branch == 1 else pc_interm
           self.read_req_next = 1
       else:
           self.state_next = 1
           if(read_ack):
               self.instruction_next = read_data
               self.read_req_next = 0
               self.state_next = 0
               self.hit_next = 0

       if(reset):
           self.state = 0
           self.read_req = 0
           self.read_addr = 0
           self.instruction = 0
           self.pc_next = 0
           self.hit = 0
           self.state_next = 0
           self.read_req_next = 0
           self.read_addr_next = 0
           self.hit_next = 0
           self.instruction_next = 0
           self.pc_next_next = 0
       elif(flush):
           self.read_addr = 0
           self.instruction = 0
           self.pc_next = 0
           self.hit = 0
       else:
           if(we):
               self.state = self.state_next
               self.read_req = self.read_req_next
               self.read_addr = self.pc_next_next
               self.pc_next = self.pc_next_next +4
               self.instruction = self.instruction_next
               self.hit = self.hit_next

@cocotb.test()
def get_address_anyinput_get_instruction(dut):
    """ if_stage: Get address (could be jump, branch or whatever, ask for instruction and get it """

    fetch = if_stage()
    cocotb.fork(Clock(dut.clk, 5000).start())

    reset = 1
    we = 0
    flush = 0
    pc_reset = 0
    pc_we = 1
    is_jump = random.randint(0, 1)
    is_branch = random.randint(0, 1)
    jump_addr = random.randint(0, 63)
    branch_addr = random.randint(0, 63)
    read_ack = random.randint(0, 1)
    read_data = random.randint(0, 63)

    dut.reset = reset
    dut.we = we
    dut.flush = flush
    dut.pc_reset = pc_reset
    dut.pc_we = pc_we
    dut.is_jump = is_jump
    dut.is_branch = is_branch
    dut.jump_addr = jump_addr
    dut.branch_addr = branch_addr
    dut.read_ack = read_ack
    dut.read_data = read_data

    fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

    yield Timer(10000)
    yield FallingEdge(dut.clk)

    if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
        raise TestFailure(
            "Fetch result is incorrect: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))

        reset = 0
        we = 1
        flush = 0
        pc_reset = random.randint(0, 1)
        pc_we = random.randint(0, 1)
        is_jump = random.randint(0, 1)
        is_branch = random.randint(0, 1)
        jump_addr = random.randint(0, 63)
        branch_addr = random.randint(0, 63)
        read_ack = 0
        read_data = random.randint(0, 63)

        dut.reset = reset
        dut.we = we
        dut.flush = flush
        dut.pc_reset = pc_reset
        dut.pc_we = pc_we
        dut.is_jump = is_jump
        dut.is_branch = is_branch
        dut.jump_addr = jump_addr
        dut.branch_addr = branch_addr
        dut.read_ack = read_ack
        dut.read_data = read_data

        print("reset %s we %s pc_reset %s pc_we %s read_data %s read_ack %s" % (str(reset), str(we), str(pc_reset), str(pc_we), str(read_data), str(read_ack)))
        fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

        yield Timer(10000)
        yield FallingEdge(dut.clk)
        if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
            raise TestFailure(
                "Fetch result is incorrect: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))
        else:  # these last two lines are not strictly necessary
            dut.log.info("Ok!")

        reset = 0
        we = 1
        flush = 0
        pc_reset = random.randint(0, 1)
        pc_we = random.randint(0, 1)
        is_jump = random.randint(0, 1)
        is_branch = random.randint(0, 1)
        jump_addr = random.randint(0, 63)
        branch_addr = random.randint(0, 63)
        read_ack = 1
        read_data = random.randint(0, 63)

        dut.reset = reset
        dut.we = we
        dut.flush = flush
        dut.pc_reset = pc_reset
        dut.pc_we = pc_we
        dut.is_jump = is_jump
        dut.is_branch = is_branch
        dut.jump_addr = jump_addr
        dut.branch_addr = branch_addr
        dut.read_ack = read_ack
        dut.read_data = read_data

        print("reset %s we %s pc_reset %s pc_we %s read_data %s read_ack %s" % (str(reset), str(we), str(pc_reset), str(pc_we), str(read_data), str(read_ack)))
        fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

        yield Timer(10000)
        yield FallingEdge(dut.clk)
        if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
            raise TestFailure(
                "Fetch result is incorrect: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))
        else:  # these last two lines are not strictly necessary
            dut.log.info("Ok!")

@cocotb.test()
def get_address_jump_get_instruction(dut):
    """ if_stage: Get address (jump), ask for instruction and get it """

    fetch = if_stage()
    cocotb.fork(Clock(dut.clk, 5000).start())

    reset = 1
    we = 0
    flush = 0
    pc_reset = 0
    pc_we = 1
    is_jump = 1
    is_branch = 0
    jump_addr = random.randint(0, 63)
    branch_addr = random.randint(0, 63)
    read_ack = random.randint(0, 1)
    read_data = random.randint(0, 63)

    dut.reset = reset
    dut.we = we
    dut.flush = flush
    dut.pc_reset = pc_reset
    dut.pc_we = pc_we
    dut.is_jump = is_jump
    dut.is_branch = is_branch
    dut.jump_addr = jump_addr
    dut.branch_addr = branch_addr
    dut.read_ack = read_ack
    dut.read_data = read_data

    fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

    yield Timer(10000)
    yield FallingEdge(dut.clk)

    if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
        raise TestFailure(
            "Fetch result is incorrect: PC: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))

        reset = 0
        we = 1
        flush = 0
        pc_reset = random.randint(0, 1)
        pc_we = random.randint(0, 1)
        is_jump = 1
        is_branch = 0
        jump_addr = random.randint(0, 63)
        branch_addr = random.randint(0, 63)
        read_ack = 0
        read_data = random.randint(0, 63)

        dut.reset = reset
        dut.we = we
        dut.flush = flush
        dut.pc_reset = pc_reset
        dut.pc_we = pc_we
        dut.is_jump = is_jump
        dut.is_branch = is_branch
        dut.jump_addr = jump_addr
        dut.branch_addr = branch_addr
        dut.read_ack = read_ack
        dut.read_data = read_data

        print("reset %s we %s pc_reset %s pc_we %s read_data %s read_ack %s" % (str(reset), str(we), str(pc_reset), str(pc_we), str(read_data), str(read_ack)))
        fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

        yield Timer(10000)
        yield FallingEdge(dut.clk)
        if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
            raise TestFailure(
                "Fetch result is incorrect: PC: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))
        else:  # these last two lines are not strictly necessary
            dut.log.info("Ok!")

        reset = 0
        we = 1
        flush = 0
        pc_reset = random.randint(0, 1)
        pc_we = random.randint(0, 1)
        is_jump = 1
        is_branch = 0
        jump_addr = random.randint(0, 63)
        branch_addr = random.randint(0, 63)
        read_ack = 1
        read_data = random.randint(0, 63)

        dut.reset = reset
        dut.we = we
        dut.flush = flush
        dut.pc_reset = pc_reset
        dut.pc_we = pc_we
        dut.is_jump = is_jump
        dut.is_branch = is_branch
        dut.jump_addr = jump_addr
        dut.branch_addr = branch_addr
        dut.read_ack = read_ack
        dut.read_data = read_data

        print("reset %s we %s pc_reset %s pc_we %s read_data %s read_ack %s" % (str(reset), str(we), str(pc_reset), str(pc_we), str(read_data), str(read_ack)))
        fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

        yield Timer(10000)
        yield FallingEdge(dut.clk)
        if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
            raise TestFailure(
                "Fetch result is incorrect: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))
        else:  # these last two lines are not strictly necessary
            dut.log.info("Ok!")

@cocotb.test()
def get_address_branch_and_jump_get_instruction(dut):
    """ if_stage: Get address jump & branch, ask for instruction and get it """

    fetch = if_stage()
    cocotb.fork(Clock(dut.clk, 5000).start())

    reset = 1
    we = 0
    flush = 0
    pc_reset = 0
    pc_we = 1
    is_jump = 1
    is_branch = 0
    jump_addr = random.randint(0, 63)
    branch_addr = random.randint(0, 63)
    read_ack = random.randint(0, 1)
    read_data = random.randint(0, 63)

    dut.reset = reset
    dut.we = we
    dut.flush = flush
    dut.pc_reset = pc_reset
    dut.pc_we = pc_we
    dut.is_jump = is_jump
    dut.is_branch = is_branch
    dut.jump_addr = jump_addr
    dut.branch_addr = branch_addr
    dut.read_ack = read_ack
    dut.read_data = read_data

    fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

    yield Timer(10000)
    yield FallingEdge(dut.clk)

    if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
        raise TestFailure(
            "Fetch result is incorrect: PC: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))

        reset = 0
        we = 1
        flush = 0
        pc_reset = random.randint(0, 1)
        pc_we = random.randint(0, 1)
        is_jump = 1
        is_branch = 1
        jump_addr = random.randint(0, 63)
        branch_addr = random.randint(0, 63)
        read_ack = 0
        read_data = random.randint(0, 63)

        dut.reset = reset
        dut.we = we
        dut.flush = flush
        dut.pc_reset = pc_reset
        dut.pc_we = pc_we
        dut.is_jump = is_jump
        dut.is_branch = is_branch
        dut.jump_addr = jump_addr
        dut.branch_addr = branch_addr
        dut.read_ack = read_ack
        dut.read_data = read_data

        print("reset %s we %s pc_reset %s pc_we %s read_data %s read_ack %s" % (str(reset), str(we), str(pc_reset), str(pc_we), str(read_data), str(read_ack)))
        fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

        yield Timer(10000)
        yield FallingEdge(dut.clk)
        if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
            raise TestFailure(
                "Fetch result is incorrect: PC: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))
        else:  # these last two lines are not strictly necessary
            dut.log.info("Ok!")

        reset = 0
        we = 1
        flush = 0
        pc_reset = random.randint(0, 1)
        pc_we = random.randint(0, 1)
        is_jump = 0
        is_branch = 1
        jump_addr = random.randint(0, 63)
        branch_addr = random.randint(0, 63)
        read_ack = 1
        read_data = random.randint(0, 63)

        dut.reset = reset
        dut.we = we
        dut.flush = flush
        dut.pc_reset = pc_reset
        dut.pc_we = pc_we
        dut.is_jump = is_jump
        dut.is_branch = is_branch
        dut.jump_addr = jump_addr
        dut.branch_addr = branch_addr
        dut.read_ack = read_ack
        dut.read_data = read_data

        print("reset %s we %s pc_reset %s pc_we %s read_data %s read_ack %s" % (str(reset), str(we), str(pc_reset), str(pc_we), str(read_data), str(read_ack)))
        fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

        yield Timer(10000)
        yield FallingEdge(dut.clk)
        if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
            raise TestFailure(
                "Fetch result is incorrect: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))
        else:  # these last two lines are not strictly necessary
            dut.log.info("Ok!")

@cocotb.test()
def get_address_anyinput_not_get_instruction(dut):
    """ if_stage: Get address (could be jump, branch or whatever, ask for instruction and not get it """

    fetch = if_stage()
    cocotb.fork(Clock(dut.clk, 5000).start())

    reset = 1
    we = 0
    flush = 0
    pc_reset = 0
    pc_we = 1
    is_jump = random.randint(0, 1)
    is_branch = random.randint(0, 1)
    jump_addr = random.randint(0, 63)
    branch_addr = random.randint(0, 63)
    read_ack = random.randint(0, 1)
    read_data = random.randint(0, 63)

    dut.reset = reset
    dut.we = we
    dut.flush = flush
    dut.pc_reset = pc_reset
    dut.pc_we = pc_we
    dut.is_jump = is_jump
    dut.is_branch = is_branch
    dut.jump_addr = jump_addr
    dut.branch_addr = branch_addr
    dut.read_ack = read_ack
    dut.read_data = read_data

    fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

    yield Timer(10000)
    yield FallingEdge(dut.clk)

    if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
        raise TestFailure(
            "Fetch result is incorrect: PC: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))

        reset = 0
        we = 1
        flush = 0
        pc_reset = random.randint(0, 1)
        pc_we = random.randint(0, 1)
        is_jump = random.randint(0, 1)
        is_branch = random.randint(0, 1)
        jump_addr = random.randint(0, 63)
        branch_addr = random.randint(0, 63)
        read_ack = 0
        read_data = random.randint(0, 63)

        dut.reset = reset
        dut.we = we
        dut.flush = flush
        dut.pc_reset = pc_reset
        dut.pc_we = pc_we
        dut.is_jump = is_jump
        dut.is_branch = is_branch
        dut.jump_addr = jump_addr
        dut.branch_addr = branch_addr
        dut.read_ack = read_ack
        dut.read_data = read_data

        print("reset %s we %s pc_reset %s pc_we %s read_data %s read_ack %s" % (str(reset), str(we), str(pc_reset), str(pc_we), str(read_data), str(read_ack)))
        fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

        yield Timer(10000)
        yield FallingEdge(dut.clk)
        if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
            raise TestFailure(
                "Fetch result is incorrect: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))
        else:  # these last two lines are not strictly necessary
            dut.log.info("Ok!")

        reset = 0
        we = 1
        flush = 0
        pc_reset = random.randint(0, 1)
        pc_we = random.randint(0, 1)
        is_jump = random.randint(0, 1)
        is_branch = random.randint(0, 1)
        jump_addr = random.randint(0, 63)
        branch_addr = random.randint(0, 63)
        read_ack = 0
        read_data = random.randint(0, 63)

        dut.reset = reset
        dut.we = we
        dut.flush = flush
        dut.pc_reset = pc_reset
        dut.pc_we = pc_we
        dut.is_jump = is_jump
        dut.is_branch = is_branch
        dut.jump_addr = jump_addr
        dut.branch_addr = branch_addr
        dut.read_ack = read_ack
        dut.read_data = read_data

        print("reset %s we %s pc_reset %s pc_we %s read_data %s read_ack %s" % (str(reset), str(we), str(pc_reset), str(pc_we), str(read_data), str(read_ack)))
        fetch.newcycle(reset, flush, we, pc_reset, pc_we, is_jump, is_branch, jump_addr, branch_addr, read_ack, read_data)

        yield Timer(10000)
        yield FallingEdge(dut.clk)
        if int(dut.pc_next) != fetch.pc_next or int(dut.instruction) != fetch.instruction:
            raise TestFailure(
                "Fetch result is incorrect: VERILOG: %s PYTHON: %s, Instr: VERILOG: %s PYTHON: %s" % (str(dut.pc_next), str(fetch.pc_next), str(dut.instruction), str(fetch.instruction)))
        else:  # these last two lines are not strictly necessary
            dut.log.info("Ok!")
