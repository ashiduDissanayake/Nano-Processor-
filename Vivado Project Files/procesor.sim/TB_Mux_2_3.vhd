library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux_2_3 is
--  Port ( );
end TB_Mux_2_3;

architecture behavioral of TB_Mux_2_3 is
component mux_2_3
    port ( i0 : in STD_LOGIC_VECTOR (2 downto 0);
           i1 : in STD_LOGIC_VECTOR (2 downto 0);
           s : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal i0, i1, q : STD_LOGIC_VECTOR (2 downto 0);
signal s : STD_LOGIC;

begin
uut: mux_2_3 port map(
        i0 => i0,
        i1 => i1,                   
        s => s,        
        q => q );
    
    -- Inputs
    i0 <= "011";
    i1 <= "101"; 
    
    process
    begin
        s <= '0'; -- i0 is selected    
        wait for 100ns;
        s <= '1'; -- i1 is selected
        wait;
    end process;
end behavioral;
