def hzdcontrol_model(memtoreg, rt, opcode, ex_rs, ex_rt):
    """ hzdcontrol_model """
    stall = 0

    if (memtoreg):
        if(opcode == 2 or opcode == 3):
            stall = 0
        else:
            stall = (ex_rs == rt or ex_rt == rt)
    else:
        stall = 0

    return stall
