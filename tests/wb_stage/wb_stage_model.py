def wb_stage_model(reset, we, reg_data, reg_addr, reg_write):
    """ wb_stage_model """
    reg_probe = 0
    data_probe = 0
    write_probe = 0
    reg_data_out = 0
    reg_addr_out = 0
    reg_write_out = 0

    if reset:
        reg_probe = 0
        data_probe = 0
        write_probe = 0
        reg_data_out = 0
        reg_addr_out = 0
        reg_write_out = 0
    else:
        if we:
            reg_probe = reg_addr
            data_probe = reg_data
            write_probe = reg_write
            reg_data_out = reg_data
            reg_addr_out = reg_addr
            reg_write_out = reg_write

    return (reg_probe, data_probe, write_probe, reg_data_out, reg_addr_out, reg_write_out)
