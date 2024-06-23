library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    port (
        a : in STD_LOGIC_VECTOR (3 downto 0);
        b : in STD_LOGIC_VECTOR (3 downto 0);
        sel : in STD_LOGIC; -- Add/Sub Selector (sel=0 for add, sel=1 for subtract)
        s : out STD_LOGIC_VECTOR (3 downto 0);
        cOut : out STD_LOGIC; -- Carry flag
        zOut : out STD_LOGIC; -- Zero flag
        nOut : out STD_LOGIC; -- Negative flag
        pOut : out STD_LOGIC -- Parity flag (odd parity detector)
    );
end ALU;

architecture Behavioral of ALU is
    component RCA
        port (
            a : in STD_LOGIC_VECTOR (3 downto 0);
            b : in STD_LOGIC_VECTOR (3 downto 0);
            cIn : in STD_LOGIC;
            s : out STD_LOGIC_VECTOR (3 downto 0);
            cOut : out STD_LOGIC
        );
    end component;

    signal aSel, sOut: STD_LOGIC_VECTOR (3 downto 0);

begin
    aSel(0) <= a(0) XOR sel;
    aSel(1) <= a(1) XOR sel;
    aSel(2) <= a(2) XOR sel;
    aSel(3) <= a(3) XOR sel;

    RCA_4: RCA
        port map (
            a =>aSel  ,
            b =>b,
            cIn => sel,
            s => sOut,
            cOut => cOut
        );

    s <= sOut;
    zOut <= NOT (sOut(0) OR sOut(1) OR sOut(2) OR sOut(3));
    nOut <= sOut(3);
    pOut <= sOut(0) XOR sOut(1) XOR sOut(2) XOR sOut(3);
end Behavioral;
