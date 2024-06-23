library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux_2_4 is
--  Port ( );
end TB_Mux_2_4;

architecture behavioral of TB_Mux_2_4 is
component mux_2_4
    port ( i0 : in STD_LOGIC_VECTOR (3 downto 0);
           i1 : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal selector : STD_LOGIC;
signal i0 : STD_LOGIC_VECTOR(3 downto 0);
signal i1 : STD_LOGIC_VECTOR(3 downto 0);
signal output : STD_LOGIC_VECTOR(3 downto 0);

begin
uut: mux_2_4 port map(
        i0 => i0,
        i1 => i1,                   
        s => selector,        
        q => output );
    
    process
    begin
        -- First test case
        i0 <= "0010";   --2
        i1 <= "0110";   --6
        selector <= '0';
        wait for 150ns;
       
        selector <= '1';
        wait for 150ns;
        -- Second test case
        i0 <= "0100";   --4
        i1 <= "1000";   --8
        selector <= '0';
        wait for 150 ns;
        selector <= '1';
        wait;
    end process;
end behavioral;
