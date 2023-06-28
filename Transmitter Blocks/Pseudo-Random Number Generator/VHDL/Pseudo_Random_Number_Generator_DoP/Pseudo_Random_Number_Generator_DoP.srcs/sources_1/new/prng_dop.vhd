library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prng_dop is
generic(
        bits_per_symbol         : positive := 4;        -- log2(M)
        initial_seed            : positive := 1;
        degree_of_parallelism   : positive := 2  
       );
port(
        clk : in std_logic;
        output_data : out std_logic_vector((degree_of_parallelism*bits_per_symbol-1) downto 0)
    );
end prng_dop;

architecture prng_dop_behavioral of prng_dop is
signal auxSignal : std_logic_vector((degree_of_parallelism*bits_per_symbol-1) downto 0) := (others => '0');
begin

for_prng : for idx in 0 to (degree_of_parallelism-1) generate
begin
    prbg_blk : entity work.prng
        generic map(
                prngBitwidth    => bits_per_symbol,
                prngSeed        => (bits_per_symbol*idx)+initial_seed,
                prbgBitwidth    => 8,
                prbgTaps        => 184
                    )
        port map(
            clk => clk,
            wordOut => auxSignal((bits_per_symbol*(idx+1))-1 downto bits_per_symbol*idx)
                );   
end generate for_prng;

output_data <= auxSignal;

end prng_dop_behavioral;