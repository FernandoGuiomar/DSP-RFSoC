@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Fri Jun 02 17:22:21 +0100 2023
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto e1d33eb1ca4f4864ab6adcb007ea4886 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L sim_clk_gen_v1_0_2 -L blk_mem_gen_v8_4_4 -L xbip_utils_v3_0_10 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L c_gate_bit_v12_0_6 -L xbip_counter_v3_0_6 -L c_counter_binary_v12_0_14 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot main_wrapper_behav xil_defaultlib.main_wrapper xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto e1d33eb1ca4f4864ab6adcb007ea4886 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L sim_clk_gen_v1_0_2 -L blk_mem_gen_v8_4_4 -L xbip_utils_v3_0_10 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L c_gate_bit_v12_0_6 -L xbip_counter_v3_0_6 -L c_counter_binary_v12_0_14 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot main_wrapper_behav xil_defaultlib.main_wrapper xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
