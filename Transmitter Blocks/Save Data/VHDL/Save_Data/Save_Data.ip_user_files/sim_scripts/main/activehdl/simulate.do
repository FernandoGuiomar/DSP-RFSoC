onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+main -L xpm -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L sim_clk_gen_v1_0_2 -L xbip_utils_v3_0_10 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L c_gate_bit_v12_0_6 -L xbip_counter_v3_0_6 -L c_counter_binary_v12_0_14 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.main xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {main.udo}

run -all

endsim

quit -force
