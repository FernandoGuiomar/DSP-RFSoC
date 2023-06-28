--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Fri Jun  9 18:27:12 2023
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
    Input1 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Input2 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clk : out STD_LOGIC;
    outputValue : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
end main_wrapper;

architecture STRUCTURE of main_wrapper is
  component main is
  port (
    outputValue : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Input1 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Input2 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clk : out STD_LOGIC
  );
  end component main;
begin
main_i: component main
     port map (
      Input1(63 downto 0) => Input1(63 downto 0),
      Input2(63 downto 0) => Input2(63 downto 0),
      clk => clk,
      outputValue(63 downto 0) => outputValue(63 downto 0)
    );
end STRUCTURE;
