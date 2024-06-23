library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA is
    port (
        a : in STD_LOGIC; -- Input A
        b : in STD_LOGIC; -- Input B
        s : out STD_LOGIC; -- Sum output
        c : out STD_LOGIC -- Carry output
    );
end HA;

architecture Behavioral of HA is

begin
    -- Calculate Sum and Carry
    s <= a XOR b; -- Sum is the XOR combination of inputs A and B
    c <= a AND b; -- Carry is the AND combination of inputs A and B

end Behavioral;
