library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prng is
generic(
        prngBitwidth    : natural := 4;
        prngSeed        : natural := 1;
        prbgBitwidth    : natural := 8;
        prbgTaps        : natural := 184
        );
port(
    clk : in std_logic;
    wordOut : out std_logic_vector((prngBitwidth-1) downto 0)
    );
end prng;

architecture prng_behavioral of prng is
constant tapsBin : std_logic_vector((prbgBitwidth-1) downto 0) := std_logic_vector(to_unsigned(prbgTaps, prbgBitwidth));
signal auxSignal : std_logic_vector((prngBitwidth-1) downto 0) := (others => '0');
begin

for_idx : for idx in 0 to (prngBitwidth-1) generate
begin
    prbg_blk : entity work.prbg
        generic map(
                    bitwidth => prbgBitwidth,
                    seed => (prngSeed + idx),
                    taps => prbgTaps
                    )
        port map(
                clk =>clk,
                bit_Out => auxSignal(idx)
                );    
end generate for_idx;

wordOut <= auxSignal;

end prng_behavioral;