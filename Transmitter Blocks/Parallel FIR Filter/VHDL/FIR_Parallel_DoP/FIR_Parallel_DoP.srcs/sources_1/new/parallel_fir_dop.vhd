-------------------------------------------------------------------------------------------------------------------
-- Author: Jorge Silva, jhgsilva@ua.pt, May of 2023
-----------------------------------------------------------------------------------------------------------

-- This file implements a parallel FIR filter with a user-defined degree of parallelism. All the computations
-- are implemented in a fixed-point format.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity parallel_fir_dop is
generic(
        nTaps                       : natural   := 33;
        bitWidth                    : natural   := 16;
        input_degree_of_parallelism : natural   := 4
        );
port(
    clk          : in std_logic;
    input_data   : in std_logic_vector((bitWidth*input_degree_of_parallelism)-1 downto 0);
    clk_ena_out  : out std_logic;
    output_data  : out std_logic_vector((bitWidth*input_degree_of_parallelism)-1 downto 0)
    );
end parallel_fir_dop;

architecture parallel_fir_dop_behavioral of parallel_fir_dop is

type sOut is array (0 to input_degree_of_parallelism-1) of std_logic_vector((bitWidth*input_degree_of_parallelism)-1 downto 0);
signal sOutFIR : sOut := (others => (others=>'0'));

signal sSumFIR : std_logic_vector((bitWidth*input_degree_of_parallelism)-1 downto 0) := (others=>'0');

signal sclk : std_logic := '0';
signal sclk_en_out : std_logic := '0';

begin

sclk <= clk;

clk_ena_out<= sclk_en_out;

dopInput : for idxDOP in 0 to (input_degree_of_parallelism-1) generate 
begin
    FIRs : for idxFIR in 0 to (input_degree_of_parallelism-1) generate 
    begin
        fir : entity work.fir_filter
        generic map(
                    bitWidth    => bitWidth,
                    coeffFiles  => "Coefficients/filterCoeff" & integer'image(idxDOP*input_degree_of_parallelism + idxFIR) & ".txt",
                    nTaps       => nTaps
                    )
        port map(
                clk =>clk,
                inputData =>input_data((bitWidth*(idxFIR+1))-1 downto (bitWidth*idxFIR)),
                outputData =>sOutFIR(idxDOP)((bitWidth*(idxFIR+1))-1 downto (bitWidth*idxFIR))
                );    
    end generate FIRs;
end generate dopInput;

dopSum : for idxSum in 0 to (input_degree_of_parallelism-1) generate 
begin
    firSum : entity work.fir_sum
    generic map(
            bitWidth => bitWidth,
            input_degree_of_parallelism => input_degree_of_parallelism
                )
    port map(
            inputData => sOutFIR(idxSum),
            outputData => sSumFIR((bitWidth*(idxSum+1))-1 downto (bitWidth*idxSum))
            ); 
end generate dopSum;

sync_process : process(clk)
begin
        if (rising_edge(clk)) then
            sclk_en_out <= '1';
            output_data <= sSumFIR;    
        end if;
end process sync_process;

end parallel_fir_dop_behavioral;