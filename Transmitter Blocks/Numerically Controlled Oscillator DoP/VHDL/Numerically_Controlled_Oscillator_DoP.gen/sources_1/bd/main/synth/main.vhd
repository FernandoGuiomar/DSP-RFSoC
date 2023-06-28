--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Thu Jun 15 10:55:37 2023
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
    clk : out STD_LOGIC;
    clk_ena_out : out STD_LOGIC;
    cosValues : out STD_LOGIC_VECTOR ( 15 downto 0 );
    sinValues : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of main : entity is "main,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=main,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
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
  component main_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component main_xlconstant_0_0;
  component main_nco_dop_0_0 is
  port (
    clk : in STD_LOGIC;
    clk_ena_in : in STD_LOGIC;
    clk_ena_out : out STD_LOGIC;
    cosValues : out STD_LOGIC_VECTOR ( 15 downto 0 );
    sinValues : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component main_nco_dop_0_0;
  signal nco_dop_0_clk_ena_out : STD_LOGIC;
  signal nco_dop_0_cosValues : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal nco_dop_0_sinValues : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sim_clk_gen_0_clk : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_sim_clk_gen_0_sync_rst_UNCONNECTED : STD_LOGIC;
begin
  clk <= sim_clk_gen_0_clk;
  clk_ena_out <= nco_dop_0_clk_ena_out;
  cosValues(15 downto 0) <= nco_dop_0_cosValues(15 downto 0);
  sinValues(15 downto 0) <= nco_dop_0_sinValues(15 downto 0);
nco_dop_0: component main_nco_dop_0_0
     port map (
      clk => sim_clk_gen_0_clk,
      clk_ena_in => xlconstant_0_dout(0),
      clk_ena_out => nco_dop_0_clk_ena_out,
      cosValues(15 downto 0) => nco_dop_0_cosValues(15 downto 0),
      sinValues(15 downto 0) => nco_dop_0_sinValues(15 downto 0)
    );
sim_clk_gen_0: component main_sim_clk_gen_0_0
     port map (
      clk => sim_clk_gen_0_clk,
      sync_rst => NLW_sim_clk_gen_0_sync_rst_UNCONNECTED
    );
xlconstant_0: component main_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
end STRUCTURE;
