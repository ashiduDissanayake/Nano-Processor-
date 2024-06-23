----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2024 11:00:10 AM
-- Design Name: 
-- Module Name: TB_Mux_2_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Mux_2_1 is
--  Port ( );
end TB_Mux_2_1;

architecture Behavioral of TB_Mux_2_1 is

component Mux_2_1
    Port ( 
       i0 : in STD_LOGIC_VECTOR (3 downto 0);
       i1 : in STD_LOGIC_VECTOR (3 downto 0);
       s : in STD_LOGIC;
       q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal i0 : STD_LOGIC_VECTOR (3 downto 0);
signal i1 : STD_LOGIC_VECTOR (3 downto 0);
signal s : STD_LOGIC;
signal q : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : Mux_2_1
    port map (i0,i1,s,q);
    
process
begin

    --INDEX Number = 220135N --> 3 & 5 used

    i0 <= "0011";
    i1 <= "0101";
    s <= '0';
    
    wait for 100ns;
    
    s <= '1';
    
    wait;

end process;


end Behavioral;
