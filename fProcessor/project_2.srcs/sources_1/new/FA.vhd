library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    port (
        a : in STD_LOGIC; -- Input A
        b : in STD_LOGIC; -- Input B
        cIn : in STD_LOGIC; -- Carry-in
        s : out STD_LOGIC; -- Sum output
        cOut : out STD_LOGIC -- Carry-out
    );
end FA;

architecture Behavioral of FA is

    component HA
        port (
            a, b : in STD_LOGIC; -- Input A and B
            s, c : out STD_LOGIC -- Sum and Carry output
        );
    end component;

    signal ha0S, ha0C, ha1S, ha1C : STD_LOGIC; -- Internal signals for half adders

begin
    -- Half Adder 0
    HA_0 : HA
    port map (
        a => a,
        b => b,
        s => ha0S,
        c => ha0C
    ); -- End HA_0

    -- Half Adder 1
    HA_1 : HA
    port map (
        a => ha0S,
        b => cIn,
        s => ha1S,
        c => ha1C
    ); -- End HA_1

    -- Calculate Carry-out and Sum
    cOut <= ha0C OR ha1C; -- Carry-out is the OR combination of carry outputs from both half adders
    s <= ha1S; -- Sum is the output of the second half adder

end Behavioral;
