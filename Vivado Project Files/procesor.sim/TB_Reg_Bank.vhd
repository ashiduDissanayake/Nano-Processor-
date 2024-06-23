LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TB_Reg_Bank IS
    --  Port ( );
END TB_Reg_Bank;

ARCHITECTURE Behavioral OF TB_Reg_Bank IS
    COMPONENT Reg_Bank
        PORT (
            regIn : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- Value to be written
            regSel : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- Register address select 
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC; -- Reset all registers to 0000 
            r0 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            r1 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            r2 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            r3 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            r4 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            r5 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            r6 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            r7 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL regIn : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL clk, reset : STD_LOGIC := '0';
    SIGNAL regSel : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL r0, r1, r2, r3, r4, r5, r6, r7 : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
    UUT : Reg_Bank
    PORT MAP(
        regIn => regIn,
        clk => clk,
        regSel => regSel,
        reset => reset,
        r0 => r0,
        r1 => r1,
        r2 => r2,
        r3 => r3,
        r4 => r4,
        r5 => r5,
        r6 => r6,
        r7 => r7
    );

    PROCESS
    BEGIN
        WAIT FOR 5ns;
        clk <= NOT(clk);
    END PROCESS;

    PROCESS
    BEGIN
        reset <= '1';
        WAIT FOR 5ns;
        reset <= '0';

        -- Index Number : 220135N
        -- Index Number : 220155B
        -- Index Number : 220264H
        -- Index Number : 220361D
        regSel <= "000";
        WAIT FOR 5ns;
        regIn <= "0000"; -- 0
        WAIT FOR 100ns;
        regSel <= "001";
        WAIT FOR 5ns;
        regIn <= "0010"; -- 2
        WAIT FOR 100ns;
        regSel <= "010";
        WAIT FOR 5ns;
        regIn <= "0010"; -- 2
        WAIT FOR 100ns;
        regSel <= "011";
        WAIT FOR 5ns;
        regIn <= "0000"; -- 0
        WAIT FOR 100ns;
        regSel <= "100";
        WAIT FOR 5ns;
        regIn <= "0001"; -- 1
        WAIT FOR 100ns;
        regSel <= "101";
        WAIT FOR 5ns;
        regIn <= "0011"; -- 3
        WAIT FOR 100ns;
        regSel <= "110";
        WAIT FOR 5ns;
        regIn <= "0101"; -- 5
        WAIT FOR 5ns;
        regSel <= "110";
        WAIT FOR 100ns;
        reset <= '1';
        WAIT;
    END PROCESS;
END Behavioral;
