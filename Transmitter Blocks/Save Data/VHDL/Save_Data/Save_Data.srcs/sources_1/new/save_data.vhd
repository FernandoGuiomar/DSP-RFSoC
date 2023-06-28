--------------------------------------------------------------------------------------------------
-- Authors : Jorge Silva, jhgsilva@ua.pt, April of 2023
--------------------------------------------------------------------------------------------------
--  This VHD script is only intended to simulation (cannot be synthesized!)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity generate_save_data is
generic (
    writeDepth  : integer := 10000;
    writeWidth  : integer := 16;
    writeFile   : string  := "outputVector.txt"
        );
 port(
    clk          : in std_logic;
    writeSamples : in std_logic_vector (writeWidth-1 downto 0)
     );
end generate_save_data;

architecture generate_save_data_behavioral of generate_save_data is 

-- Output Text File
file fileInput : text;

-- Use variable for rapid assign
shared variable lineCount : integer := 0;
begin

sync_write_process : process 
variable v_space    : character;
variable v_oline : line;
begin
    file_open(fileInput, writeFile, write_mode);
    while (lineCount <= writeDepth) loop -- nao posso ter while aqui........
        wait until rising_edge(clk); 
        hwrite(v_oline, writeSamples, right, 4);
        writeline(fileInput, v_oline);
        lineCount := lineCount + 1;
    end loop;      
    file_close(fileInput); 
    wait;
end process sync_write_process;

end generate_save_data_behavioral;