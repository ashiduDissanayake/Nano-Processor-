library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_Bank is
    Port (
        regIn : in STD_LOGIC_VECTOR (3 downto 0); -- Value to be written
        regSel : in STD_LOGIC_VECTOR (2 downto 0); -- Register address select 
        clk : in STD_LOGIC;
        reset : in STD_LOGIC; -- Reset all registers to 0000 
        r0 : out STD_LOGIC_VECTOR (3 downto 0);
        r1 : out STD_LOGIC_VECTOR (3 downto 0);
        r2 : out STD_LOGIC_VECTOR (3 downto 0);
        r3 : out STD_LOGIC_VECTOR (3 downto 0);
        r4 : out STD_LOGIC_VECTOR (3 downto 0);
        r5 : out STD_LOGIC_VECTOR (3 downto 0);
        r6 : out STD_LOGIC_VECTOR (3 downto 0);
        r7 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Reg_Bank;

architecture Behavioral of Reg_Bank is
    -- Component declarations
    component Decoder_3_to_8 is
        Port (
            input : in STD_LOGIC_VECTOR (2 downto 0);
            enable : in STD_LOGIC;
            output : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    component Reg is
        Port (
            d : in STD_LOGIC_VECTOR (3 downto 0);
            en : in STD_LOGIC;
            clk : in STD_LOGIC;
            clr : in STD_LOGIC;
            q : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signal declarations
    signal regEnSig : STD_LOGIC_VECTOR (7 downto 0);

begin
    -- Instantiate the Decoder_3_to_8 component
    decoder : Decoder_3_to_8
    port map (
        input => regSel,
        enable => '1',
        output => regEnSig
    );
        
    -- Instantiate the Reg components for each register
    reg_0 : Reg
    port map (
        d => "0000",
        en => regEnSig(0),
        clk => clk,
        clr => reset,
        q => r0
    );
    reg_1 : Reg
    port map (
        d => regIn,
        en => regEnSig(1),
        clk => clk,
        clr => reset,
        q => r1
    );
    reg_2 : Reg
    port map (
        d => regIn,
        en => regEnSig(2),
        clk => clk,
        clr => reset,
        q => r2
    );
    reg_3 : Reg
    port map (
        d => regIn,
        en => regEnSig(3),
        clk => clk,
        clr => reset,
        q => r3
    );
    reg_4 : Reg
    port map (
        d => regIn,
        en => regEnSig(4),
        clk => clk,
        clr => reset,
        q => r4
    );
    reg_5 : Reg
    port map (
        d => regIn,
        en => regEnSig(5),
        clk => clk,
        clr => reset,
        q => r5
    );
    reg_6 : Reg
    port map (
        d => regIn,
        en => regEnSig(6),
        clk => clk,
        clr => reset,
        q => r6
    );
    reg_7 : Reg
    port map (
        d => regIn,
        en => regEnSig(7),
        clk => clk,
        clr => reset,
        q => r7
    );
end Behavioral;
