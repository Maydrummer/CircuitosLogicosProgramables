vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../lab1_VIO.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../lab1_VIO.srcs/sources_1/ip/vio_0/hdl" "+incdir+../../../../lab1_VIO.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../lab1_VIO.srcs/sources_1/ip/vio_0/hdl" \
"../../../../lab1_VIO.srcs/sources_1/ip/vio_0/sim/vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

