vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../practica2.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../practica2.srcs/sources_1/ip/vio_0/hdl" "+incdir+../../../../practica2.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../practica2.srcs/sources_1/ip/vio_0/hdl" \
"../../../../practica2.srcs/sources_1/ip/vio_0/sim/vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

