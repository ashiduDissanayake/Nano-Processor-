library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Add_3 is
--  Port ( );
end TB_Add_3;

architecture Behavioral of TB_Add_3 is
    component Adder_3_bit
        port ( a : in STD_LOGIC_VECTOR (2 downto 0); -- Input A
               b : in STD_LOGIC_VECTOR (2 downto 0); -- Input B
               s : out STD_LOGIC_VECTOR (2 downto 0) -- Sum output
        );
    end component;

    signal a, b, s : STD_LOGIC_VECTOR (2 downto 0) := "000"; -- Input and output signals

begin
    UUT: Adder_3_bit port map (
        a => a,
        b => b,
        s => s
    );
        
    process
    begin
        -- Test Cases
        -- Index number : 220135N = 110 101 101 111 100 111
        -- 110 + 101 = 6 + 5 = 11 --> overloaded --> 3
        a <= "110";
        b <= "101";
        wait for 100ns;
        
        -- 101 + 111 = 5 + 7 = 12 --> overloaded --> 3
        a <= "101";
        b <= "111";
        wait for 100ns;
        
        -- 100 + 111 = 4 + 7 = 11 --> overloaded --> 3
        a <= "100";
        b <= "111";
        wait;
    end process;
       
end Behavioral;
