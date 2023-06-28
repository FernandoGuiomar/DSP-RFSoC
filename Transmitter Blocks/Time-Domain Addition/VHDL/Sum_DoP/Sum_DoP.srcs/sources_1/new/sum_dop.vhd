library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum_dop is 
generic (
            number_of_inputs        : positive := 4;
            degree_of_parallelism   : positive := 4;
            bitwidth                : positive := 16
        );
port(
        clk         : in std_logic;
        input_data  : in std_logic_vector((number_of_inputs*degree_of_parallelism*bitwidth)-1 downto 0);
        output_data : out std_logic_vector((degree_of_parallelism*bitwidth)-1 downto 0)
    );
end sum_dop;

architecture sum_dop_behavioral of sum_dop is
signal auxSignal : std_logic_vector((degree_of_parallelism*bitwidth)-1 downto 0) := (others => '0');
begin

sync_process : process(clk)
variable auxVariable : signed((degree_of_parallelism*bitwidth)-1 downto 0) := (others => '0');
begin
    if(rising_edge(clk)) then
        auxVariable := (others => '0');
        for_loop1 : for indX in 0 to (degree_of_parallelism-1) loop
            for_loop2 : for indJ in 0 to (number_of_inputs-1) loop
                auxVariable(bitwidth*(indX+1)-1 downto bitwidth*indX) := auxVariable(bitwidth*(indX+1)-1 downto bitwidth*indX) + signed(input_data((degree_of_parallelism*bitwidth*indJ + bitwidth*(indX+1) -1) downto (degree_of_parallelism*bitwidth*indJ + bitwidth*indX)));      
            end loop for_loop2;
        end loop for_loop1;
        auxSignal <= std_logic_vector(auxVariable);
    end if;
end process sync_process;

output_data <= auxSignal;

end sum_dop_behavioral; 
