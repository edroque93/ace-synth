def flow_ctrl_model(reset, dc_stall, is_branch, is_jump, hzd_stall, ic_stall):
     """ flow_ctrl_model """

     if (reset):
         pc_reset  = 1
         pc_we     = 1
         if_reset  = 1
         if_we     = 1
         id_reset  = 1
         id_we     = 1
         ex_reset  = 1
         ex_we     = 1
         mem_reset = 1
         mem_we    = 1
         wb_reset  = 1
         wb_we     = 1
     elif (dc_stall):
         pc_reset  = 0
         pc_we     = 0
         if_reset  = 0
         if_we     = 0
         id_reset  = 0
         id_we     = 0
         ex_reset  = 0
         ex_we     = 0
         mem_reset = 1
         mem_we    = 1
         wb_reset  = 0
         wb_we     = 0
     elif (is_branch):
         pc_reset  = 0
         pc_we     = 1
         if_reset  = 1
         if_we     = 1
         id_reset  = 1
         id_we     = 1
         ex_reset  = 1
         ex_we     = 1
         mem_reset = 0
         mem_we    = 1
         wb_reset  = 0
         wb_we     = 1
     elif (is_jump):
         pc_reset  = 0
         pc_we     = 1
         if_reset  = 1
         if_we     = 1
         id_reset  = 1
         id_we     = 1
         ex_reset  = 0
         ex_we     = 1
         mem_reset = 0
         mem_we    = 1
         wb_reset  = 0
         wb_we     = 1
     elif (hzd_stall):
         pc_reset  = 0
         pc_we     = 0
         if_reset  = 0
         if_we     = 0
         id_reset  = 1
         id_we     = 1
         ex_reset  = 0
         ex_we     = 1
         mem_reset = 0
         mem_we    = 1
         wb_reset  = 0
         wb_we     = 1
     elif (ic_stall):
         pc_reset  = 0
         pc_we     = 0
         if_reset  = 1
         if_we     = 1
         id_reset  = 0
         id_we     = 1
         ex_reset  = 0
         ex_we     = 1
         mem_reset = 0
         mem_we    = 1
         wb_reset  = 0
         wb_we     = 1
     else:
         pc_reset  = 0
         pc_we     = 1
         if_reset  = 0
         if_we     = 1
         id_reset  = 0
         id_we     = 1
         ex_reset  = 0
         ex_we     = 1
         mem_reset = 0
         mem_we    = 1
         wb_reset  = 0
         wb_we     = 1

     return (pc_reset, pc_we, if_reset, if_we, id_reset, id_we, ex_reset, id_we, ex_reset, ex_we, mem_reset, mem_we, wb_reset, wb_we)
