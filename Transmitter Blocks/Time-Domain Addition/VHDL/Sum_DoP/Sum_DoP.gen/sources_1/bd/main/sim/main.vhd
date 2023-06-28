--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Tue Jun 13 12:01:49 2023
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
    input_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    output_data : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of main : entity is "main,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=main,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of main : entity is "main.hwdef";
end main;

architecture STRUCTURE of main is
  component main_sum_dop_0_0 is
  port (
    clk : in STD_LOGIC;
    input_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    output_data : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component main_sum_dop_0_0;
  component main_sim_clk_gen_0_0 is
  port (
    clk : out STD_LOGIC;
    sync_rst : out STD_LOGIC
  );
  end component main_sim_clk_gen_0_0;
  component main_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    In2 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    In3 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 255 downto 0 )
  );
  end component main_xlconcat_0_0;
  component main_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component main_xlconstant_0_0;
  component main_xlconstant_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component main_xlconstant_1_0;
  component main_xlconstant_2_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component main_xlconstant_2_0;
  component main_xlconstant_3_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component main_xlconstant_3_0;
  signal sim_clk_gen_0_clk : STD_LOGIC;
  signal sum_dop_0_output_data : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xlconstant_2_dout : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xlconstant_3_dout : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_sim_clk_gen_0_sync_rst_UNCONNECTED : STD_LOGIC;
begin
  clk <= sim_clk_gen_0_clk;
  input_data(255 downto 0) <= xlconcat_0_dout(255 downto 0);
  output_data(63 downto 0) <= sum_dop_0_output_data(63 downto 0);
sim_clk_gen_0: component main_sim_clk_gen_0_0
     port map (
      clk => sim_clk_gen_0_clk,
      sync_rst => NLW_sim_clk_gen_0_sync_rst_UNCONNECTED
    );
sum_dop_0: component main_sum_dop_0_0
     port map (
      clk => sim_clk_gen_0_clk,
      input_data(255 downto 0) => xlconcat_0_dout(255 downto 0),
      output_data(63 downto 0) => sum_dop_0_output_data(63 downto 0)
    );
xlconcat_0: component main_xlconcat_0_0
     port map (
      In0(63 downto 0) => xlconstant_0_dout(63 downto 0),
      In1(63 downto 0) => xlconstant_1_dout(63 downto 0),
      In2(63 downto 0) => xlconstant_2_dout(63 downto 0),
      In3(63 downto 0) => xlconstant_3_dout(63 downto 0),
      dout(255 downto 0) => xlconcat_0_dout(255 downto 0)
    );
xlconstant_0: component main_xlconstant_0_0
     port map (
      dout(63 downto 0) => xlconstant_0_dout(63 downto 0)
    );
xlconstant_1: component main_xlconstant_1_0
     port map (
      dout(63 downto 0) => xlconstant_1_dout(63 downto 0)
    );
xlconstant_2: component main_xlconstant_2_0
     port map (
      dout(63 downto 0) => xlconstant_2_dout(63 downto 0)
    );
xlconstant_3: component main_xlconstant_3_0
     port map (
      dout(63 downto 0) => xlconstant_3_dout(63 downto 0)
    );
end STRUCTURE;
