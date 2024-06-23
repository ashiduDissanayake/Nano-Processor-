library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_2_to_4 is
    Port (
        input : in STD_LOGIC_VECTOR (1 downto 0);
        enable : in STD_LOGIC;
        output : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is
begin
    output(0) <= NOT(input(0)) AND NOT(input(1)) AND enable;
    output(1) <= input(0) AND NOT(input(1)) AND enable;
    output(2) <= NOT(input(0)) AND input(1) AND enable;
    output(3) <= input(0) AND input(1) AND enable;
end Behavioral;
