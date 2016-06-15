ACE = ../..
SRC = $(ACE)/src
COCOTB = $(ACE)/tools/cocotb
VERILOG_SOURCES = $(SRC)/ex_stage.v
TOPLEVEL = ex_stage 
MODULE = test_ex_stage
EXTRA_ARGS = -I $(ACE)/src -D TEST_COCOTB
include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim
