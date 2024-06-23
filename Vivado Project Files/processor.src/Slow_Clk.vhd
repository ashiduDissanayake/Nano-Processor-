library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Slow_Clk is
    Port (
        clkIn : in STD_LOGIC := '0';
        en : in STD_LOGIC := '1';
        reset : in STD_LOGIC;
        clkOut : out STD_LOGIC := '0';
        clkOutBar : out STD_LOGIC := '1'
    );
end Slow_Clk;

architecture Behavioral of Slow_Clk is
    signal count : integer := 1;
    signal clkStatus : STD_LOGIC := '0';

begin

    process (clkIn, reset) begin
        if (en = '0') then
               clkOut <= '0';
               clkOutBar <= '1';
        elsif (reset = '1') then
            clkStatus <= '0';
            clkOut <= clkStatus;
            clkOutBar <= not clkStatus;
       
        elsif (rising_edge(clkIn)) then
            count <= count + 1;
--             if(count = 100000000) then  -- For Basys3 board
            if(count = 5) then         -- For simulation in Vivado
                clkStatus <= not clkStatus;
                clkOut <= clkStatus;
                clkOutBar <= not clkStatus;
                count <= 1;
            end if;
        end if;
    end process;

end Behavioral;
