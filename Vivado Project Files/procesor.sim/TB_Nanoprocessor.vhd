
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Microprocessor is
--  Port ( );
end TB_Microprocessor;

architecture Behavioral of TB_Microprocessor is
component Microprocessor
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           L : out STD_LOGIC_VECTOR (3 downto 0); 
           C_Flag : out STD_LOGIC; -- Carry flag
           Z_Flag : out STD_LOGIC; -- Zero flag
           N_Flag : out STD_LOGIC; -- Negetive flag
           P_Flag : out STD_LOGIC; -- Parity flag (Odd parity detector)
           Seg_7 : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0) );
end component;

signal Clk : STD_LOGIC := '0';
signal Reset, C_Flag, Z_Flag , N_Flag, P_Flag : STD_LOGIC := '0';
signal L : STD_LOGIC_VECTOR (3 downto 0); 
signal Seg_7 : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT: Microprocessor PORT MAP(
       Clk => Clk,
       Reset => Reset,
       L => L,
       C_Flag => C_Flag,
       Z_Flag => Z_Flag,
       N_Flag => N_Flag,
       P_Flag => P_Flag,
       Seg_7 => Seg_7 );
    
    process 
    begin
        wait for 5ns;
        Clk <= NOT(Clk);
    end process;
    
    process
    begin
        wait for 150ns;
        Reset <= '1';
        wait for 5ns;     
        Reset <= '0';
        wait for 150ns;
        Reset <= '1';
        wait for 5ns;     
        Reset <= '0';
        wait;
    end process;
end Behavioral;