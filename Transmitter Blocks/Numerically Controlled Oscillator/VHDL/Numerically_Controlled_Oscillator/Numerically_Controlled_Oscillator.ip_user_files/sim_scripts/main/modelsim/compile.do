vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/sim_clk_gen_v1_0_2
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xlconstant_v1_1_7

vmap sim_clk_gen_v1_0_2 modelsim_lib/msim/sim_clk_gen_v1_0_2
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xlconstant_v1_1_7 modelsim_lib/msim/xlconstant_v1_1_7

vlog -work sim_clk_gen_v1_0_2  -incr \
"../../../../Numerically_Controlled_Oscillator.gen/sources_1/bd/main/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr \
"../../../bd/main/ip/main_sim_clk_gen_0_0/sim/main_sim_clk_gen_0_0.v" \

vlog -work xlconstant_v1_1_7  -incr \
"../../../../Numerically_Controlled_Oscillator.gen/sources_1/bd/main/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr \
"../../../bd/main/ip/main_xlconstant_0_0/sim/main_xlconstant_0_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/main/ip/main_nco_0_0/sim/main_nco_0_0.vhd" \
"../../../bd/main/sim/main.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

