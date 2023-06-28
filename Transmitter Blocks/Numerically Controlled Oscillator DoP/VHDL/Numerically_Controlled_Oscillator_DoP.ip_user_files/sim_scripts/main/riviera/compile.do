vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/sim_clk_gen_v1_0_2
vlib riviera/xlconstant_v1_1_7

vmap xil_defaultlib riviera/xil_defaultlib
vmap sim_clk_gen_v1_0_2 riviera/sim_clk_gen_v1_0_2
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7

vcom -work xil_defaultlib -93 \
"../../../bd/main/ip/main_nco_dop_0_0/sim/main_nco_dop_0_0.vhd" \

vlog -work sim_clk_gen_v1_0_2  -v2k5 \
"../../../../Numerically_Controlled_Oscillator_DoP.gen/sources_1/bd/main/ipshared/b740/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/main/ip/main_sim_clk_gen_0_0/sim/main_sim_clk_gen_0_0.v" \

vlog -work xlconstant_v1_1_7  -v2k5 \
"../../../../Numerically_Controlled_Oscillator_DoP.gen/sources_1/bd/main/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/main/ip/main_xlconstant_0_0/sim/main_xlconstant_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/main/sim/main.vhd" \


vlog -work xil_defaultlib \
"glbl.v"

