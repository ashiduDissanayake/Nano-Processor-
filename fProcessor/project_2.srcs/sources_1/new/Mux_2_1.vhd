
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_2_1 is
    Port ( i0 : in STD_LOGIC_VECTOR (3 downto 0);
           i1 : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_1;

architecture Behavioral of Mux_2_1 is
component TBuffer_2_1_4Bit_I is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component TBuffer_2_1_4Bit is
    Port ( B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A_out,B_out:STD_LOGIC_VECTOR (3 downto 0);

begin
TBuffer_2_1_4Bit_I_0: TBuffer_2_1_4Bit_I port map(i0,s,A_out);
TBuffer_2_1_4Bit_0: TBuffer_2_1_4Bit PORT MAP(i1,s,B_out);

q<= A_out;
q<= B_out;

end Behavioral;
