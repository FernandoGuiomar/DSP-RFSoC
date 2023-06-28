------------------------------------------------------------------------------------------------
-- Author : Jorge Silva, (jhgsilva@ua.pt) May of 2023
------------------------------------------------------------------------------------------------

-- This file implements a QAM Modulator with a generic degree of parallelism defined by the user

library ieee;
use ieee.std_logic_1164.all;

-- Symbols are stored in the format Q2.14 
package myPackage is
    type romConstellation is array(natural range <>) of std_logic_vector(15 downto 0);
end package myPackage;

use work.myPackage.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity qam_mod_dop is
generic(
    bitwidth                : natural range 1 to 16 := 16;  
    bits_per_symbol         : positive              := 4;                    -- log2(M) or 2^(bits_per_symbol) = M
    degree_of_parallelism   : positive              := 2         
       );       
port(
    clk                 : in std_logic;
    clk_ena_in          : in std_logic;
    input_bits          : in std_logic_vector((bits_per_symbol*degree_of_parallelism - 1) downto 0);
    clk_ena_out         : out std_logic;
    output_data_real    : out std_logic_vector((bitwidth*degree_of_parallelism - 1) downto 0);
    output_data_imag    : out std_logic_vector((bitwidth*degree_of_parallelism - 1) downto 0)
    );
end qam_mod_dop;

architecture qam_mod_dop_behavioral of qam_mod_dop is

-- Auxiliary signals for the constellation symbols output
signal array_value_real         : std_logic_vector((bitwidth*degree_of_parallelism - 1) downto 0) := (others =>'0');
signal array_value_imag         : std_logic_vector((bitwidth*degree_of_parallelism - 1) downto 0) := (others =>'0');
signal output_signal_real       : std_logic_vector((bitwidth*degree_of_parallelism - 1) downto 0) := (others =>'0');
signal output_signal_imag       : std_logic_vector((bitwidth*degree_of_parallelism - 1) downto 0) := (others =>'0');

-- Auxiliary signals for the clock enable output
signal sclk_ena_out             : std_logic_vector(degree_of_parallelism-1 downto 0) := (others => '0');
signal clk_enable_out_signal    : std_logic := '0';


-- Function to read values from a .txt file
impure function InitRomFromFile(RomFileName : in string) return romConstellation is
        FILE RomFile : text open read_mode is RomFileName;
        variable RomFileLine : line;
        variable ROM : romConstellation(0 to ((2**bits_per_symbol)-1));
    begin
         for idx in 0 to ((2**bits_per_symbol)-1) loop        
            readline(RomFile, RomFileLine);
            hread(RomFileLine, ROM(idx));
         end loop;
     return ROM;
end function;

-------------------------Constellation Symbols (Real and Imag Values)---------------------------------
--------------------------------------------4QAM------------------------------------------------------
constant RealConstellation4QAM  : romConstellation := InitRomFromFile("ConstellationValues/Real_4QAM.txt");
constant ImagConstellation4QAM  : romConstellation := InitRomFromFile("ConstellationValues/Imag_4QAM.txt");

--------------------------------------------8QAM------------------------------------------------------
constant RealConstellation8QAM  : romConstellation := InitRomFromFile("ConstellationValues/Real_8QAM.txt");
constant ImagConstellation8QAM  : romConstellation := InitRomFromFile("ConstellationValues/Imag_8QAM.txt");

--------------------------------------------16QAM------------------------------------------------------
constant RealConstellation16QAM : romConstellation := InitRomFromFile("ConstellationValues/Real_16QAM.txt");
constant ImagConstellation16QAM : romConstellation := InitRomFromFile("ConstellationValues/Imag_16QAM.txt");

--------------------------------------------32QAM------------------------------------------------------
constant RealConstellation32QAM : romConstellation := InitRomFromFile("ConstellationValues/Real_32QAM.txt");
constant ImagConstellation32QAM : romConstellation := InitRomFromFile("ConstellationValues/Imag_32QAM.txt");
        
--------------------------------------------64QAM------------------------------------------------------
constant RealConstellation64QAM : romConstellation := InitRomFromFile("ConstellationValues/Real_64QAM.txt");
constant ImagConstellation64QAM : romConstellation := InitRomFromFile("ConstellationValues/Real_64QAM.txt");   
    
begin

dop_for : for idx in 0 to (degree_of_parallelism-1) generate
    array_value_real((bitwidth*(idx+1)-1) downto bitwidth*idx) <=   RealConstellation4QAM(to_integer(unsigned(input_bits((bits_per_symbol*(idx+1)-1) downto bits_per_symbol*idx))))(15 downto (16-bitwidth))    when (bits_per_symbol = 2) else
                                                        RealConstellation8QAM(to_integer(unsigned(input_bits((bits_per_symbol*(idx+1)-1) downto bits_per_symbol*idx))))(15 downto (16-bitwidth))    when (bits_per_symbol = 3) else
                                                        RealConstellation16QAM(to_integer(unsigned(input_bits((bits_per_symbol*(idx+1)-1) downto bits_per_symbol*idx))))(15 downto (16-bitwidth))   when (bits_per_symbol = 4) else
                                                        RealConstellation32QAM(to_integer(unsigned(input_bits((bits_per_symbol*(idx+1)-1) downto bits_per_symbol*idx))))(15 downto (16-bitwidth))   when (bits_per_symbol = 5) else
                                                        RealConstellation64QAM(to_integer(unsigned(input_bits((bits_per_symbol*(idx+1)-1) downto bits_per_symbol*idx))))(15 downto (16-bitwidth))   when (bits_per_symbol = 6) else
                                                        (others => '0');
                    
    array_value_imag((bitwidth*(idx+1)-1) downto bitwidth*idx) <=   ImagConstellation4QAM(to_integer(unsigned(input_bits((bits_per_symbol*(idx+1)-1) downto bits_per_symbol*idx))))(15 downto (16-bitwidth))    when (bits_per_symbol = 2) else
                                                        ImagConstellation8QAM(to_integer(unsigned(input_bits((bits_per_symbol*(idx+1)-1) downto bits_per_symbol*idx))))(15 downto (16-bitwidth))    when (bits_per_symbol = 3) else
                                                        ImagConstellation16QAM(to_integer(unsigned(input_bits((bits_per_symbol*(idx+1)-1) downto bits_per_symbol*idx))))(15 downto (16-bitwidth))   when (bits_per_symbol = 4) else
                                                        ImagConstellation32QAM(to_integer(unsigned(input_bits((bits_per_symbol*(idx+1)-1) downto bits_per_symbol*idx))))(15 downto (16-bitwidth))   when (bits_per_symbol = 5) else
                                                        ImagConstellation64QAM(to_integer(unsigned(input_bits((bits_per_symbol*(idx+1)-1) downto bits_per_symbol*idx))))(15 downto (16-bitwidth))   when (bits_per_symbol = 6) else
                                                        (others => '0');
    
    -- Synchronous Outputs
    sync_process : process(clk,clk_ena_in)
    begin
        if (clk_ena_in = '1') then
            if(rising_edge(clk)) then
                sclk_ena_out(idx) <= '1';
                output_signal_real((bitwidth*(idx+1)-1) downto bitwidth*idx) <= array_value_real((bitwidth*(idx+1)-1) downto bitwidth*idx);
                output_signal_imag((bitwidth*(idx+1)-1) downto bitwidth*idx) <= array_value_imag((bitwidth*(idx+1)-1) downto bitwidth*idx);
            end if;
        else 
            sclk_ena_out(idx) <= '0';
            output_signal_real((bitwidth*(idx+1)-1) downto bitwidth*idx) <= (others =>'0');
            output_signal_imag((bitwidth*(idx+1)-1) downto bitwidth*idx) <= (others =>'0');
        end if; 
    end process sync_process;
    
    output_data_real((bitwidth*(idx+1)-1) downto bitwidth*idx) <= output_signal_real((bitwidth*(idx+1)-1) downto bitwidth*idx);
    output_data_imag((bitwidth*(idx+1)-1) downto bitwidth*idx) <= output_signal_imag((bitwidth*(idx+1)-1) downto bitwidth*idx);
    
end generate dop_for;

clk_ena_out <= clk_enable_out_signal;

process_clk_ena_out : process (sclk_ena_out)
variable aux : std_logic_vector(degree_of_parallelism-1 downto 0) := (others => '1');
begin
    if(sclk_ena_out = aux) then
        clk_enable_out_signal <= '1';
    else
        clk_enable_out_signal <= '0';
    end if;
end process process_clk_ena_out;

end qam_mod_dop_behavioral;