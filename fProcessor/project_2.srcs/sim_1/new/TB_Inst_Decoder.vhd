library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Inst_Decoder is
--  Port ( );
end TB_Inst_Decoder;

architecture Behavioral of TB_Inst_Decoder is
    component Inst_Decoder
        Port (
            inst : in STD_LOGIC_VECTOR (0 to 12); -- Instruction
            clk : in STD_LOGIC;
            regChk : in STD_LOGIC_VECTOR (3 downto 0); -- Check register value for JZR
            regSelA : out STD_LOGIC_VECTOR (2 downto 0);
            regSelB : out STD_LOGIC_VECTOR (2 downto 0);
            imdVal : out STD_LOGIC_VECTOR (3 downto 0); -- Immediate value
            regEn : out STD_LOGIC_VECTOR (2 downto 0); -- Enable register for write
            loadSel : out STD_LOGIC; -- Choose between Imd value or Add/Sub Unit result
            addSubSel : out STD_LOGIC; -- Add Sub selector
            jmp : out STD_LOGIC; -- Jump flag
            jmpAddress : out STD_LOGIC_VECTOR (2 downto 0) -- Address to jump
        );
    end component;

    signal inst : STD_LOGIC_VECTOR (0 to 12);
    signal regChk, imdVal : STD_LOGIC_VECTOR (3 downto 0);
    signal regSelA, regSelB, regEn, jmpAddress : STD_LOGIC_VECTOR (2 downto 0);
    signal clk, loadSel, addSubSel, jmp : STD_LOGIC := '0';

begin
    uut: Inst_Decoder port map (
        inst => inst,
        clk => clk,
        regChk => regChk,
        regSelA => regSelA,
        regSelB => regSelB,
        imdVal => imdVal,
        regEn => regEn,
        loadSel => loadSel,
        addSubSel => addSubSel,
        jmp => jmp,
        jmpAddress => jmpAddress
    );
    
    process 
    begin
        wait for 20ns;
        clk <= not clk;
    end process;
    
    process
    begin
        
        -- Index number : 220135N = 110101101111100111 
        -- Index number : 220135N = 110101101111111011
        -- Index number : 220135N = 110101110001101000
        -- Index number : 220135N = 110101110011001001
        
        --From the index number binary form we get 13 bits to create a instruction from 2nd index 
        
        inst <= "0100010001000"; -- MOV 8 to Reg 1
        wait for 100ns;
                
        inst <= "0100100001101"; -- MOV -3 to Reg 2
        wait for 100ns;
                
        inst <= "0000100010000"; -- ADD Reg 2 and Reg 1
        wait for 100ns;
                
        inst <= "0010010000000"; -- NEG Reg 1
        wait for 100ns;
                
        inst <= "1011110000100"; -- JMP Reg to Inst 4
        wait for 100ns;
                
        inst <= "0111110000011"; -- (JZR) JMP to Inst 3 if Reg 7 is zero
        regChk <= "0000";
        wait for 100ns; 
    end process;
end Behavioral;
