-----------------------------------------------------------------------------------
-- Author: Jorge Silva, jhgsilva@ua.pt, May of 2023
-----------------------------------------------------------------------------------

-- This file implements upsampling of the input signal by a factor initially specified

library ieee;
use ieee.std_logic_1164.all;

entity upsampler is 
generic (
        samplingFactor              : integer   := 2;
        sample_bitwidth             : integer   := 16;
        input_degree_of_parallelism : positive  := 2
        );
        
port(
        clk         : in std_logic;
        clk_ena_in  : in std_logic;
        input_data  : in std_logic_vector((input_degree_of_parallelism*sample_bitwidth)-1 downto 0);
        clk_ena_out : out std_logic;
        output_data : out std_logic_vector((samplingFactor*input_degree_of_parallelism*sample_bitwidth)-1 downto 0)
     );
end upsampler;

architecture upsampler_behavioral of upsampler is

-- Auxiliary signals
signal soutput                  : std_logic_vector((samplingFactor*input_degree_of_parallelism*sample_bitwidth)-1 downto 0) := (others =>'0');
signal sclk_ena_out             : std_logic_vector(input_degree_of_parallelism-1 downto 0) := (others => '0');
signal clk_enable_out_signal    : std_logic := '0';

begin

-- Synchronous Input/Output Process
sync_process : process(clk,clk_ena_in)
begin
    if(clk_ena_in = '1') then
        if(rising_edge(clk) and clk_ena_in = '1') then
            dop_for : for idx in 0 to (input_degree_of_parallelism-1) loop
                sclk_ena_out(idx) <= '1';
                soutput(((samplingFactor*sample_bitwidth*idx) + sample_bitwidth -1) downto samplingFactor*sample_bitwidth*idx) <= input_data((idx+1)*sample_bitwidth -1 downto idx*sample_bitwidth);
            end loop dop_for;
        end if;
    else
        soutput <= (others => '0');
    end if;
end process sync_process;

-- Clock Enable Out Process
process_clk_ena_out : process (sclk_ena_out)
variable aux : std_logic_vector(input_degree_of_parallelism-1 downto 0) := (others => '1');
begin
    if(sclk_ena_out = aux) then
        clk_enable_out_signal <= '1';
    else
        clk_enable_out_signal <= '0';
    end if;
end process process_clk_ena_out;

output_data <= soutput;
clk_ena_out <= clk_enable_out_signal;

end upsampler_behavioral;