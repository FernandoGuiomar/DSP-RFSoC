--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Tue Jun  6 17:20:09 2023
--Host        : id6395 running 64-bit major release  (build 9200)
--Command     : generate_target main_wrapper.bd
--Design      : main_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity main_wrapper is
  port (
    clk : out STD_LOGIC;
    clk_ena_out : out STD_LOGIC;
    cosValues : out STD_LOGIC_VECTOR ( 15 downto 0 );
    sinValues : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end main_wrapper;

architecture STRUCTURE of main_wrapper is
  component main is
  port (
    cosValues : out STD_LOGIC_VECTOR ( 15 downto 0 );
    sinValues : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clk_ena_out : out STD_LOGIC;
    clk : out STD_LOGIC
  );
  end component main;
begin
main_i: component main
     port map (
      clk => clk,
      clk_ena_out => clk_ena_out,
      cosValues(15 downto 0) => cosValues(15 downto 0),
      sinValues(15 downto 0) => sinValues(15 downto 0)
    );
end STRUCTURE;
