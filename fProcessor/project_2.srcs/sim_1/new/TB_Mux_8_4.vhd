
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux_8_4 is
--  Port ( );
end TB_Mux_8_4;

architecture Behavioral of TB_Mux_8_4 is
component Mux_8_4
    Port ( r0 : in STD_LOGIC_VECTOR (3 downto 0);
           r1 : in STD_LOGIC_VECTOR (3 downto 0);
           r2 : in STD_LOGIC_VECTOR (3 downto 0);
           r3 : in STD_LOGIC_VECTOR (3 downto 0);
           r4 : in STD_LOGIC_VECTOR (3 downto 0);
           r5 : in STD_LOGIC_VECTOR (3 downto 0);
           r6 : in STD_LOGIC_VECTOR (3 downto 0);
           r7 : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (2 downto 0);
           q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal r0, r1, r2, r3, r4, r5, r6, r7, q : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal s : STD_LOGIC_VECTOR (2 downto 0);

begin
uut: Mux_8_4 PORT MAP(
        -- Index Number : 210249H 
        -- Index Number : 210648F
        r0 => "0000", --0
        r1 => "0010", --2
        r2 => "0001", --1
        r3 => "0000", --0
        r4 => "0100", --4
        r5 => "1001", --9
        r6 => "0110", --6
        r7 => "1000", --8                
        s => s,        
        q => q );   
        
    process
    begin
        s <= "000";
        wait for 100ns;
        s <= "001";
        wait for 100ns;
        s <= "010";
        wait for 100ns;
        s <= "011";
        wait for 100ns;
        s <= "100";
        wait for 100ns;
        s <= "101";
        wait for 100ns;
        s <= "110";
        wait for 100ns;
        s <= "111";
        wait;   
    end process;
end Behavioral;
