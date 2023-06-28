-------------------------------------------------------------------------------------------------------------------
-- Author: Jorge Silva, jhgsilva@ua.pt, May of 2023
-----------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fir_sum is
generic(
        bitWidth                    : natural   := 16;
        input_degree_of_parallelism : natural   := 2
        );
port(
    inputData   : in std_logic_vector((bitWidth*input_degree_of_parallelism)-1 downto 0);
    outputData  : out std_logic_vector((bitWidth-1) downto 0)
    );
end fir_sum;

architecture fir_sum_behavioral of fir_sum is

begin

process(inputData)
variable sumS : signed((bitWidth-1) downto 0) := (others=>'0');
begin
    sumS := (others=>'0');
    for idxSum in 0 to input_degree_of_parallelism-1 loop
        sumS := sumS + signed(inputData((bitWidth*(idxSum+1))-1 downto (bitWidth*idxSum)));
    end loop;
    outputData <= std_logic_vector(sumS);
end process;
end fir_sum_behavioral;