library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_3_bit is
    Port (
        a : in STD_LOGIC_VECTOR (2 downto 0); -- Input A
        b : in STD_LOGIC_VECTOR (2 downto 0); -- Input B
        s : out STD_LOGIC_VECTOR (2 downto 0) -- Output S
    );
end Adder_3_bit;

architecture Behavioral of Adder_3_bit is
    component FA
        Port (
            a : in STD_LOGIC; -- Input A
            b : in STD_LOGIC; -- Input B
            cIn : in STD_LOGIC; -- Carry-in
            s : out STD_LOGIC; -- Sum output
            cOut : out STD_LOGIC -- Carry-out
        );
    end component;

    signal fa0_c, fa1_c, fa2_c : STD_LOGIC; -- Internal carry signals

begin
    -- Full Adder 0
    FA_0 : FA
    port map (
        a => a(0),
        b => b(0),
        cIn => '0', -- Set to ground (no initial carry)
        s => s(0),
        cOut => fa0_c
    ); -- End FA_0

    -- Full Adder 1
    FA_1 : FA
    port map (
        a => a(1),
        b => b(1),
        cIn => fa0_c, -- Carry from FA_0
        s => s(1),
        cOut => fa1_c
    ); -- End FA_1

    -- Full Adder 2
    FA_2 : FA
    port map (
        a => a(2),
        b => b(2),
        cIn => fa1_c, -- Carry from FA_1
        s => s(2),
        cOut => fa2_c
    ); -- End FA_2

end Behavioral;
