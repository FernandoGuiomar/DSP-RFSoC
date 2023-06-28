library ieee;
use ieee.std_logic_1164.all;

-- Symbols are stored in the format Q2.14 
package myPackage is
    type romValues is array(natural range <>) of std_logic_vector(15 downto 0);
end package myPackage;

use work.myPackage.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity nco_dop is
generic(
    degree_of_parallelism   : natural := 4;
    lookUpTableSize         : natural := 4096;
    freqSignal              : natural := 100000;
    freqSampling            : natural := 100000000
       );
port(
    clk         : in std_logic; 
    clk_ena_in  : in std_logic;
    clk_ena_out : out std_logic;
    cosValues   : out std_logic_vector((16*degree_of_parallelism)-1 downto 0);
    sinValues   : out std_logic_vector((16*degree_of_parallelism)-1 downto 0)
    );
end nco_dop;

architecture nco_dop_behavioral of nco_dop is

-- Function to read values from a .txt file
impure function InitRomFromFile(RomFileName : in string) return romValues is
        FILE RomFile : text open read_mode is RomFileName;
        variable RomFileLine : line;
        variable ROM : romValues(0 to ((lookUpTableSize)-1));
    begin
         for idx in 0 to ((lookUpTableSize)-1) loop        
            readline(RomFile, RomFileLine);
            hread(RomFileLine, ROM(idx));
         end loop;
     return ROM;
end function;

constant lookUpTableCos : romValues := InitRomFromFile("NCO/cosValues.txt");
constant lookUpTableSin : romValues := InitRomFromFile("NCO/sinValues.txt");

signal sinValuesAux,cosValuesAux : std_logic_vector((16*degree_of_parallelism)-1 downto 0) := (others =>'0');

signal indexSig     : unsigned (31 downto 0) := (others => '0');
constant freqStep   : unsigned (31 downto 0) :=  to_unsigned(((2**(32))*freqSignal)/freqSampling,32);
begin

sync_process : process(clk)
variable indexVar : unsigned (31 downto 0) := indexSig;
begin
    if(rising_edge(clk)) then
        if(clk_ena_in = '1') then
            clk_ena_out <= '1';
            for idx in 0 to (degree_of_parallelism-1) loop
                indexVar := indexVar + freqStep;
                cosValuesAux(16*(idx+1)-1 downto 16*(idx)) <= lookUpTableCos(to_integer(indexVar(31 downto 20)));
                sinValuesAux(16*(idx+1)-1 downto 16*(idx)) <= lookUpTableSin(to_integer(indexVar(31 downto 20)));    
            end loop;
            indexSig <= indexVar;
        else
            clk_ena_out <= '0';
            cosValuesAux <= (others => '0');
            sinValuesAux <= (others => '0');
        end if;
    end if;
end process sync_process;

cosValues <= cosValuesAux;
sinValues <= sinValuesAux;



end nco_dop_behavioral;