library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
-- 8 way mux using 2 way bux all in 4 bits
entity Mux_8_1 is
    Port ( s : in STD_LOGIC_VECTOR (2 downto 0);
           r0,r1,r2,r3,r4,r5,r6,r7 : in std_logic_vector (3 downto 0);
           q : out STD_LOGIC_vector(3 downto 0));
end Mux_8_1;

architecture Behavioral of Mux_8_1 is


component Mux_2_1 is
    Port ( i0 : in STD_LOGIC_VECTOR (3 downto 0);
           i1 : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL d01, d23, d45, d67, a, b:STD_LOGIC_VECTOR(3 DOWNTO 0);

begin
Mux_2_1_A:Mux_2_1
    port map(r0,r1,s(0),d01);

Mux_2_1_B:Mux_2_1
    port map(r2,r3,s(0),d23);
    
Mux_2_1_C:Mux_2_1
        port map(r4,r5,s(0),d45);    

Mux_2_1_D:Mux_2_1
        port map(r6,r7,s(0),d67);   

Mux_2_1_E:Mux_2_1
        port map(d01,d23,s(1),a); 

Mux_2_1_F:Mux_2_1
        port map(d45,d67,s(1),b); 

Mux_2_1_G:Mux_2_1
        port map(a,b,s(2),q);         
                
end Behavioral;