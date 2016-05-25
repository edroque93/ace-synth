def wb_stage_model(reset, we, reg_data, reg_addr, reg_write):
    """ wb_stage_model """
    reg_data_out = 0
    reg_addr_out = 0
    reg_write_out = 0

    if reset:
        reg_data_out = 0
        reg_addr_out = 0
        reg_write_out = 0
    else:
        if we:
            reg_data_out = reg_data
            reg_addr_out = reg_addr
            reg_write_out = reg_write

    return (reg_data_out, reg_addr_out, reg_write_out)
