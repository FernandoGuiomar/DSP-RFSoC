--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Thu Apr 27 16:57:07 2023
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
    MemoryOut : out STD_LOGIC_VECTOR ( 15 downto 0 );
    adress : out STD_LOGIC_VECTOR ( 13 downto 0 );
    clk : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of main : entity is "main,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=main,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of main : entity is "main.hwdef";
end main;

architecture STRUCTURE of main is
  component main_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 13 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component main_blk_mem_gen_0_0;
  component main_sim_clk_gen_0_0 is
  port (
    clk : out STD_LOGIC;
    sync_rst : out STD_LOGIC
  );
  end component main_sim_clk_gen_0_0;
  component main_c_counter_binary_0_0 is
  port (
    CLK : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  end component main_c_counter_binary_0_0;
  component main_generate_save_data_0_4 is
  port (
    clk : in STD_LOGIC;
    writeSamples : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component main_generate_save_data_0_4;
  signal blk_mem_gen_0_douta : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal c_counter_binary_0_Q : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal sim_clk_gen_0_clk : STD_LOGIC;
  signal NLW_sim_clk_gen_0_sync_rst_UNCONNECTED : STD_LOGIC;
begin
  MemoryOut(15 downto 0) <= blk_mem_gen_0_douta(15 downto 0);
  adress(13 downto 0) <= c_counter_binary_0_Q(13 downto 0);
  clk <= sim_clk_gen_0_clk;
blk_mem_gen_0: component main_blk_mem_gen_0_0
     port map (
      addra(13 downto 0) => c_counter_binary_0_Q(13 downto 0),
      clka => sim_clk_gen_0_clk,
      douta(15 downto 0) => blk_mem_gen_0_douta(15 downto 0)
    );
c_counter_binary_0: component main_c_counter_binary_0_0
     port map (
      CLK => sim_clk_gen_0_clk,
      Q(13 downto 0) => c_counter_binary_0_Q(13 downto 0)
    );
generate_save_data_0: component main_generate_save_data_0_4
     port map (
      clk => sim_clk_gen_0_clk,
      writeSamples(15 downto 0) => blk_mem_gen_0_douta(15 downto 0)
    );
sim_clk_gen_0: component main_sim_clk_gen_0_0
     port map (
      clk => sim_clk_gen_0_clk,
      sync_rst => NLW_sim_clk_gen_0_sync_rst_UNCONNECTED
    );
end STRUCTURE;
