library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inst_Reg is
    Port (
        D : in STD_LOGIC_VECTOR (0 to 12); -- Data input
        Clk : in STD_LOGIC; -- Clock input
        Q : out STD_LOGIC_VECTOR (0 to 12) := "0100010000011" -- Data output
    );
end Inst_Reg;

architecture Behavioral of Inst_Reg is
begin
    process(Clk)
    begin
        if falling_edge(Clk) then -- Check for falling edge of the clock
            Q <= D; -- Assign input data to output
        end if;
    end process;

end Behavioral;
