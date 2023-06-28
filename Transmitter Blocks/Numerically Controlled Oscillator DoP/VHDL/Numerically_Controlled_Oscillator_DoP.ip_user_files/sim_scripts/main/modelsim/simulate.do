onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xil_defaultlib -L sim_clk_gen_v1_0_2 -L xlconstant_v1_1_7 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.main xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {main.udo}

run -all

quit -force
