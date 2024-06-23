library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2_4 is
    Port ( i0 : in STD_LOGIC_VECTOR (3 downto 0);
           i1 : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_4;

architecture Behavioral of Mux_2_4 is

begin
    process(i0,i1,s)
    begin
        case s is
            when '0' => q <= i0;
            when '1' => q <= i1; 
            when others => q <= "ZZZZ";
        end case;
     end process;
end Behavioral;
