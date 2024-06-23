
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8_4 is
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
end Mux_8_4;

architecture Behavioral of Mux_8_4 is

begin
    process(r0,r1,r2,r3,r4,r5,r6,r7,s)
    begin
        case s is
            when "000" => q <= r0;
            when "001" => q <= r1; 
            when "010" => q <= r2; 
            when "011" => q <= r3; 
            when "100" => q <= r4; 
            when "101" => q <= r5; 
            when "110" => q <= r6; 
            when "111" => q <= r7; 
            when others => q <= "ZZZZ";
        end case;
     end process;
end Behavioral;