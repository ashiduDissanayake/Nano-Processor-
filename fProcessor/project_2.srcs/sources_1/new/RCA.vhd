library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA is
    Port (
        a : in STD_LOGIC_VECTOR (3 downto 0);
        b : in STD_LOGIC_VECTOR (3 downto 0);
        s : out STD_LOGIC_VECTOR (3 downto 0);
        cIn : in STD_LOGIC;
        cOut : out STD_LOGIC
    );
end RCA;

architecture Behavioral of RCA is
    component FA
        Port (
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            cIn : in STD_LOGIC;
            s : out STD_LOGIC;
            cOut : out STD_LOGIC
        );
    end component;

    signal fa0S, fa0C, fa1S, fa1C, fa2S, fa2C, fa3S, fa3C : STD_LOGIC;

begin
    -- Full Adder 0
    FA_0 : FA
        port map (
            a => a(0),
            b => b(0),
            cIn => cIn,
            s => s(0),
            cOut => fa0C
        );
        
    -- Full Adder 1
    FA_1 : FA
        port map (
            a => a(1),
            b => b(1),
            cIn => fa0C,
            s => s(1),
            cOut => fa1C
        );
        
    -- Full Adder 2
    FA_2 : FA
        port map (
            a => a(2),
            b => b(2),
            cIn => fa1C,
            s => s(2),
            cOut => fa2C
        );
        
    -- Full Adder 3
    FA_3 : FA
        port map (
            a => a(3),
            b => b(3),
            cIn => fa2C,
            s => s(3),
            cOut => cOut
        );
        
end Behavioral;
