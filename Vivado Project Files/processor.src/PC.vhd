library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port (
        pcIn : in STD_LOGIC_VECTOR (2 downto 0) := "000";
        clk : in STD_LOGIC;
        res : in STD_LOGIC;
        pcOut : out STD_LOGIC_VECTOR (2 downto 0) := "000"
    );
end PC;

architecture Behavioral of PC is
begin
    process (clk, res) begin
        if (res = '1') then
            pcOut <= "000";
        elsif (rising_edge(clk)) then
            pcOut <= pcIn;
        end if;
    end process;
end Behavioral;
