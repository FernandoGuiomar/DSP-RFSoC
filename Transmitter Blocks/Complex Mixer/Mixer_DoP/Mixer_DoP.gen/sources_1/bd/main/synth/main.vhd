--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Fri Jun  9 18:27:12 2023
--Host        : id6395 running 64-bit major release  (build 9200)
--Command     : generate_target main.bd
--Design      : main
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity main is
  port (
    Input1 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Input2 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clk : out STD_LOGIC;
    outputValue : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of main : entity is "main,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=main,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of main : entity is "main.hwdef";
end main;

architecture STRUCTURE of main is
  component main_sim_clk_gen_0_0 is
  port (
    clk : out STD_LOGIC;
    sync_rst : out STD_LOGIC
  );
  end component main_sim_clk_gen_0_0;
  component main_c_counter_binary_0_0 is
  port (
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component main_c_counter_binary_0_0;
  component main_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component main_xlconstant_0_0;
  component main_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component main_xlconstant_0_1;
  component main_mixer_dop_0_0 is
  port (
    clk : in STD_LOGIC;
    input_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    input_osc : in STD_LOGIC_VECTOR ( 63 downto 0 );
    output_data : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component main_mixer_dop_0_0;
  signal blk_mem_gen_0_douta : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal mixer_dop_0_output_data : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal nco_dop_0_cosValues : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal sim_clk_gen_0_clk : STD_LOGIC;
  signal NLW_c_counter_binary_0_Q_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_sim_clk_gen_0_sync_rst_UNCONNECTED : STD_LOGIC;
begin
  Input1(63 downto 0) <= nco_dop_0_cosValues(63 downto 0);
  Input2(63 downto 0) <= blk_mem_gen_0_douta(63 downto 0);
  clk <= sim_clk_gen_0_clk;
  outputValue(63 downto 0) <= mixer_dop_0_output_data(63 downto 0);
c_counter_binary_0: component main_c_counter_binary_0_0
     port map (
      CLK => sim_clk_gen_0_clk,
      Q(15 downto 0) => NLW_c_counter_binary_0_Q_UNCONNECTED(15 downto 0)
    );
mixer_dop_0: component main_mixer_dop_0_0
     port map (
      clk => sim_clk_gen_0_clk,
      input_data(63 downto 0) => blk_mem_gen_0_douta(63 downto 0),
      input_osc(63 downto 0) => nco_dop_0_cosValues(63 downto 0),
      output_data(63 downto 0) => mixer_dop_0_output_data(63 downto 0)
    );
sim_clk_gen_0: component main_sim_clk_gen_0_0
     port map (
      clk => sim_clk_gen_0_clk,
      sync_rst => NLW_sim_clk_gen_0_sync_rst_UNCONNECTED
    );
xlconstant_0: component main_xlconstant_0_0
     port map (
      dout(63 downto 0) => blk_mem_gen_0_douta(63 downto 0)
    );
xlconstant_1: component main_xlconstant_0_1
     port map (
      dout(63 downto 0) => nco_dop_0_cosValues(63 downto 0)
    );
end STRUCTURE;
