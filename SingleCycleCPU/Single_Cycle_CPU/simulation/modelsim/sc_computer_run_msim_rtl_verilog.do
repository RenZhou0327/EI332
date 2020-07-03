transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/sc_instmen.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/sc_datamem.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/sc_cu.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/sc_cpu.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/sc_computer.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/regfile.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/mux4x32.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/mux2x32.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/mux2x5.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/lpm_rom_irom.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/lpm_ram_dq_dram.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/dff32.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/cla32.v}
vlog -vlog01compat -work work +incdir+F:/Computer\ composition/experiment/Single_Cycle_CPU/source {F:/Computer composition/experiment/Single_Cycle_CPU/source/alu.v}

