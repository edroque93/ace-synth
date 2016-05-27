def fwdcontrol_model(r, ex_dst, mem_dst, wb_dst, ex_rw, mem_rw, wb_rw):
    """ fwdcontrol_model """
    ctrl = 0

    if (wb_rw and (wb_dst != 0)) and (wb_dst == r):
        ctrl = 3

    if (mem_rw and (mem_dst != 0)) and (mem_dst == r):
	ctrl = 2

    if (ex_rw and (ex_dst != 0)) and (ex_dst == r):
	ctrl = 1

    return ctrl
