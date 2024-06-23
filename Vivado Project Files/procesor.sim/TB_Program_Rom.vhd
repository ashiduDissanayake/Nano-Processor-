library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Program_Rom is
--  Port ( );
end TB_Program_Rom;

architecture Behavioral of TB_Program_Rom is
    component Program_Rom
        Port (
            romIn : in STD_LOGIC_VECTOR (2 downto 0);
            romOut : out STD_LOGIC_VECTOR (0 to 12)
        );
    end component;

    signal romIn : STD_LOGIC_VECTOR (2 downto 0);
    signal romOut : STD_LOGIC_VECTOR (0 to 12);

begin
    UUT: Program_Rom port map (
        romIn => romIn,
        romOut => romOut
    );
    
    process 
    begin
        -- Index number: 220135N = 110 101 101 111 100 111
        romIn <= "110"; -- Set romIn to "110"
        wait for 100ns;
        
        romIn <= "101"; -- Set romIn to "101"
        wait for 100ns;
        
        romIn <= "111"; -- Set romIn to "111"
        wait for 100ns;
        
        romIn <= "100"; -- Set romIn to "100"

        wait;
    end process;
   
end Behavioral;
