vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/sim_clk_gen_v1_0_2
vlib questa_lib/msim/xlconcat_v2_1_4
vlib questa_lib/msim/xlconstant_v1_1_7

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap sim_clk_gen_v1_0_2 questa_lib/msim/sim_clk_gen_v1_0_2
vmap xlconcat_v2_1_4 questa_lib/msim/xlconcat_v2_1_4
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7

vcom -work xil_defaultlib  -93 \
"../../../bd/main/ip/main_sum_dop_0_0/sim/main_sum_dop_0_0.vhd" \

vlog -work sim_clk_gen_v1_0_2  \
"../../../../Sum_DoP.gen/sources_1/bd/main/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  \
"../../../bd/main/ip/main_sim_clk_gen_0_0/sim/main_sim_clk_gen_0_0.v" \

vlog -work xlconcat_v2_1_4  \
"../../../../Sum_DoP.gen/sources_1/bd/main/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  \
"../../../bd/main/ip/main_xlconcat_0_0/sim/main_xlconcat_0_0.v" \

vlog -work xlconstant_v1_1_7  \
"../../../../Sum_DoP.gen/sources_1/bd/main/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  \
"../../../bd/main/ip/main_xlconstant_0_0/sim/main_xlconstant_0_0.v" \
"../../../bd/main/ip/main_xlconstant_1_0/sim/main_xlconstant_1_0.v" \
"../../../bd/main/ip/main_xlconstant_2_0/sim/main_xlconstant_2_0.v" \
"../../../bd/main/ip/main_xlconstant_3_0/sim/main_xlconstant_3_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/main/sim/main.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

