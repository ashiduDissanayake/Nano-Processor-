library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is
    component PC
        Port (
            pcIn : in STD_LOGIC_VECTOR (2 downto 0);
            clk : in STD_LOGIC;
            res : in STD_LOGIC;
            pcOut : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal pcIn, pcOut : STD_LOGIC_VECTOR (2 downto 0);
    signal res : STD_LOGIC;

begin
    UUT: PC port map (
        pcIn => pcIn,
        clk => clk,
        res => res,
        pcOut => pcOut
    );
    
    process 
    begin
        wait for 20ns;
        clk <= NOT clk;
    end process;
    
    process 
    begin
        -- Index number: 220135N = 110 101 101 111 100 111
        res <= '1'; -- Set res to 1
        wait for 100ns;
        
        res <= '0'; -- Clear res
        pcIn <= "110"; -- Set pcIn to "110"
        wait for 200ns;
        
        pcIn <= "101"; -- Set pcIn to "101"
        wait for 200ns;
        
        pcIn <= "101"; -- Set pcIn to "101"
        wait for 200ns;
        
        pcIn <= "111"; -- Set pcIn to "111"
        wait for 200ns;
        
        pcIn <= "100"; -- Set pcIn to "100"
        wait for 200ns;
        
         res <= '1'; -- Set res to 1
        wait ;
    end process;

end Behavioral;
