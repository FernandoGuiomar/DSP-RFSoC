-----------------------------------------------------------------------------------------------------------
-- Author: Jorge Silva, jhgsilva@ua.pt, June of 2023
-----------------------------------------------------------------------------------------------------------

-- This file implements a FIR filter where the filter's coefficients are loaded from a .txt file with the fixed-point format Q2.14
-- The user can defin the input data bitwidth between 8 or 16 bits

library ieee;
use ieee.std_logic_1164.all;

package RomPackage is
    type romCoeff is array(integer range <>) of std_logic_vector(15 downto 0);
end package RomPackage;

use work.RomPackage.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity fir_filter is
generic(
    bitWidth            : natural   := 16;
    coeffFiles          : string    := "Coefficients/filterCoeff.txt";
    nTaps               : natural   := 129
        );
port(
    clk             : in std_logic;
    inputData       : in std_logic_vector ((bitWidth-1) downto 0);
    outputData      : out std_logic_vector((bitWidth-1) downto 0)
    );
end fir_filter;

architecture fir_filter_behavioral of fir_filter is

type multOutput is array (0 to nTaps-1) of std_logic_vector((2*bitWidth-1) downto 0);
type sumOutput is array (0 to nTaps-1) of std_logic_vector((2*bitWidth-1) downto 0);
type regOutput is array(0 to nTaps-1) of std_logic_vector((2*bitWidth-1) downto 0);

signal multOut  : sumOutput := (others => (others => '0'));
signal sumOut   : sumOutput := (others => (others => '0'));
signal regOut   : regOutput := (others => (others => '0')); 

-- Function used to load the filter coefficients from the .txt file to an ROM
impure function InitRomFromFile(RomFileName : in string) return romCoeff is
        FILE RomFile : text open read_mode is RomFileName;
        variable RomFileLine : line;
        variable ROM : romCoeff(0 to (nTaps-1));
    begin
         for idx in 0 to (nTaps-1) loop        
            readline(RomFile, RomFileLine);
            hread(RomFileLine, ROM(idx));
         end loop;
     return ROM;
end function;

-- Filter coefficients
constant fCoeff : romCoeff := InitRomFromFile(coeffFiles);

begin

sync_process : process (clk)
begin
    if(rising_edge (clk)) then
        for idx in 0 to (nTaps-1) loop
            regOut(idx) <= sumOut(idx);
        end loop;
    end if;
end process sync_process;

async_process_sum : process (regOut,multOut,inputData)
begin
    for idx in 0 to (nTaps-1) loop
        if idx = (nTaps-1) then
            sumOut(idx) <= multOut(idx);
        else
            sumOut(idx) <= std_logic_vector (signed(regOut(idx+1)) + signed(multOut(idx)));
        end if;   
    end loop; 
end process async_process_sum;

async_process_mult : process (inputData)
begin
    for idx in 0 to (nTaps-1) loop
        multOut(idx) <= std_logic_vector (signed(inputData)*signed(fCoeff(idx)(15 downto (16-bitWidth))));     
    end loop;
end process async_process_mult;

outputData <= regOut(0)((regOut(0)'LENGTH -1) downto (regOut(0)'LENGTH-bitWidth));

end fir_filter_behavioral;