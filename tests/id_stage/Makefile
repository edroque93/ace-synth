ACE = ../..
SRC = $(ACE)/src
COCOTB = $(ACE)/tools/cocotb
VERILOG_SOURCES = $(SRC)/id_stage.v
TOPLEVEL = id_stage
MODULE = test_id_stage
EXTRA_ARGS = -I $(ACE)/src -D TEST_COCOTB
include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim
