library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mixer_dop is
generic(
        bitWidth                : integer   := 16;
        degree_of_parallelism   : positive  := 4
        );
port(
        clk         : in std_logic;
        input_data  : in std_logic_vector((bitWidth*degree_of_parallelism)-1 downto 0);
        input_osc   : in std_logic_vector((bitWidth*degree_of_parallelism)-1 downto 0);
        output_data : out std_logic_vector((bitWidth*degree_of_parallelism)-1 downto 0)
    );
end mixer_dop;

architecture mixer_dop_behavioral of mixer_dop is
signal output_data_aux : std_logic_vector((2*bitWidth*degree_of_parallelism)-1 downto 0) := (others => '0');
begin

sync_process : process(clk)
begin
    if(rising_edge(clk)) then
        for_loop : for idx in 0 to (degree_of_parallelism-1) loop
            output_data_aux(2*bitWidth*(idx+1)-1 downto 2*bitWidth*idx) <= std_logic_vector(signed(input_data(bitWidth*(idx+1)-1 downto bitWidth*idx))*signed(input_osc(bitWidth*(idx+1)-1 downto bitWidth*idx)));
        end loop for_loop;
    end if;
end process sync_process;

for_generate : for idxF in 0 to (degree_of_parallelism-1) generate
begin
    output_data(bitWidth*(idxF+1)-1 downto bitWidth*idxF) <= output_data_aux(2*bitWidth*(idxF+1)-1 downto 2*bitWidth*idxF + bitWidth);
end generate for_generate;

end mixer_dop_behavioral;