transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src {/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src/ace.v}
vlog -vlog01compat -work work +incdir+/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src {/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src/clock_delay.v}
vlog -vlog01compat -work work +incdir+/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src {/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src/io_ctrl.v}
vlog -vlog01compat -work work +incdir+/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src {/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src/cpu.v}
vlog -vlog01compat -work work +incdir+/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src {/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src/7segments_converter.v}
vlog -vlog01compat -work work +incdir+/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src {/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src/reseter.v}
vlog -vlog01compat -work work +incdir+/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src {/home/ediaz/Documents/UPC/Q2/PD/ace-synth/src/arbiter.v}

