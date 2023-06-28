--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Thu Apr 27 16:57:07 2023
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
    MemoryOut : out STD_LOGIC_VECTOR ( 15 downto 0 );
    adress : out STD_LOGIC_VECTOR ( 13 downto 0 );
    clk : out STD_LOGIC
  );
end main_wrapper;

architecture STRUCTURE of main_wrapper is
  component main is
  port (
    clk : out STD_LOGIC;
    MemoryOut : out STD_LOGIC_VECTOR ( 15 downto 0 );
    adress : out STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  end component main;
begin
main_i: component main
     port map (
      MemoryOut(15 downto 0) => MemoryOut(15 downto 0),
      adress(13 downto 0) => adress(13 downto 0),
      clk => clk
    );
end STRUCTURE;
