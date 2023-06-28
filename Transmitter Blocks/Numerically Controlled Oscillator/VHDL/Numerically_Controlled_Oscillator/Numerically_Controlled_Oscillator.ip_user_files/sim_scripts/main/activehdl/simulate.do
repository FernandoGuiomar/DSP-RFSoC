onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+main -L sim_clk_gen_v1_0_2 -L xil_defaultlib -L xlconstant_v1_1_7 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.main xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {main.udo}

run -all

endsim

quit -force
