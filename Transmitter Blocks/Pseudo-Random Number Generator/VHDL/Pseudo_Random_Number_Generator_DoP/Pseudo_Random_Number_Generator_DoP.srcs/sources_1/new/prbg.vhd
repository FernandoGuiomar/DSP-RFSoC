library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prbg is
generic (
         bitwidth   : natural := 3;
         seed       : natural := 7;
         taps       : natural := 6
        );
port(
        clk : in std_logic;
        bit_Out : out std_logic;
        dataOut : out std_logic_vector((bitwidth-1) downto 0)
    );
end prbg;

architecture prbg_behavioral of prbg is
constant tapsBin : std_logic_vector((bitwidth-1) downto 0) := std_logic_vector(to_unsigned(taps, bitwidth));
signal cword : std_logic_vector((bitwidth-1) downto 0) := std_logic_vector(to_unsigned(seed, bitwidth));
begin

sync_process : process (clk)
variable newbit : std_logic := '0';
begin
    if(rising_edge(clk)) then
    newbit := '0';
        for_idx : for idx in 0 to (bitwidth-1) loop
            if (tapsBin((bitwidth-1)-idx) = '1') then
                newbit := newbit xor cword(idx);
            else 
                newbit := newbit xor '0';
            end if;
        end loop for_idx; 
        cword <= newbit & cword((bitwidth-1) downto 1);
    end if;
end process sync_process;

bit_Out <= cword(0);
dataOut <= cword;
end prbg_behavioral;