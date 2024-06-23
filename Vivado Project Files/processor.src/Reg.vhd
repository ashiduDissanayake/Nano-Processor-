library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
    Port (
        d : in STD_LOGIC_VECTOR (3 downto 0); -- Data input
        en : in STD_LOGIC; -- Enable signal
        clk : in STD_LOGIC; -- Clock signal
        clr : in STD_LOGIC; -- Clear signal
        q : out STD_LOGIC_VECTOR (3 downto 0) := "0000" -- Data output
    );
end Reg;

architecture Behavioral of Reg is
begin
    process (clk, clr)
    begin
        if (clr = '1') then
            q <= "0000"; -- Clear the output
        elsif (rising_edge(clk)) then
            if (en = '1') then
                q <= d; -- Update the output with input data
            end if;
        end if;
    end process;
end Behavioral;
