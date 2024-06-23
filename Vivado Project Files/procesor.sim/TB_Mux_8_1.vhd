library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux_8_1 is
--  Port ( );
end TB_Mux_8_1;

architecture Behavioral of TB_Mux_8_1 is

component Mux_8_1
    Port ( s : in STD_LOGIC_VECTOR (2 downto 0);
           r0,r1,r2,r3,r4,r5,r6,r7 : in std_logic_vector (3 downto 0);
           q : out STD_LOGIC_vector(3 downto 0));
end component;

signal s : STD_LOGIC_VECTOR (2 downto 0);
signal r0,r1,r2,r3,r4,r5,r6,r7 : std_logic_vector (3 downto 0);
signal q : STD_LOGIC_vector(3 downto 0);
           

begin

UUT: Mux_8_1
    PORT MAP(s,r0,r1,r2,r3,r4,r5,r6,r7,q);
    
PROCESS
BEGIN

    --Indec number is 220135N 

    r0 <= "0010";
    r1 <= "0010";
    r2 <= "0000";
    r3 <= "0001";
    r4 <= "0011";
    r5 <= "0101";
    r6 <= "0000";
    r7 <= "0000";
    s <= "000";
    
    WAIT FOR 100ns;
    s <= "001";
    
    WAIT FOR 100ns;
    s <= "010";
    
    WAIT FOR 100ns;
    s <= "011";
    
    WAIT FOR 100ns;
    s <= "100";
    
    WAIT FOR 100ns;
    s <= "101";
    
    WAIT FOR 100ns;
    s <= "110";
    
    WAIT;
    

END PROCESS;


end Behavioral;
