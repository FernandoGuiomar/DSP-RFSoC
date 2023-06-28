--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Tue Jun 13 12:01:49 2023
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
    input_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    output_data : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
end main_wrapper;

architecture STRUCTURE of main_wrapper is
  component main is
  port (
    output_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clk : out STD_LOGIC;
    input_data : out STD_LOGIC_VECTOR ( 255 downto 0 )
  );
  end component main;
begin
main_i: component main
     port map (
      clk => clk,
      input_data(255 downto 0) => input_data(255 downto 0),
      output_data(63 downto 0) => output_data(63 downto 0)
    );
end STRUCTURE;
