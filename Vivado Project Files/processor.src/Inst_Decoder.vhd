library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inst_Decoder is
    Port (
        inst: in STD_LOGIC_VECTOR (0 to 12); -- Instruction
        clk: in STD_LOGIC; -- Clock signal
        regChk: in STD_LOGIC_VECTOR (3 downto 0); -- Check register value for JZR
        regSelA: out STD_LOGIC_VECTOR (2 downto 0); -- Select register to load into MUX A
        regSelB: out STD_LOGIC_VECTOR (2 downto 0); -- Select register to load into MUX B
        imdVal: out STD_LOGIC_VECTOR (3 downto 0); -- Immediate value
        regEn: out STD_LOGIC_VECTOR (2 downto 0); -- Enable register for write
        loadSel: out STD_LOGIC; -- Choose between Imd value or Add/Sub Unit result
        addSubSel: out STD_LOGIC; -- Add Sub selector
        clkEn: out STD_LOGIC; -- Enable/Disable clock
        jmp: out STD_LOGIC; -- Jump flag
        jmpAddress: out STD_LOGIC_VECTOR (2 downto 0) -- Address to jump
    );
end Inst_Decoder;

architecture Behavioral of Inst_Decoder is
    component Inst_Reg
        Port (
            d: in STD_LOGIC_VECTOR (0 to 12);
            clk: in STD_LOGIC;
            q: out STD_LOGIC_VECTOR (0 to 12)
        );
    end component;

    signal i: STD_LOGIC_VECTOR (0 to 12);
    signal jmpZ, jmpNZ, jmpC, sub, neg: STD_LOGIC;

begin
    -- 13-bit instruction register
    instReg13: Inst_Reg
        port map (
            d => inst,
            clk => clk,
            q => i
        );

    -- Mapping 1st three bits of instruction
    -- 010 - MOV
    -- 000 - ADD
    -- 001 - NEG
    -- 011 - JZR
    -- 100 - SUB
    -- 101 - JMP
    -- 110 - JNZR
    -- 111 - END
    sub <= i(0) AND NOT i(1) AND NOT i(2); -- Output is 1 when opcode is 100
    neg <= NOT i(0) AND NOT i(1) AND i(2); -- Output is 1 when opcode is 001
    addSubSel <= neg OR sub;

    loadSel <= i(1) AND NOT i(2); -- Output is 1 when opcode is 010
    clkEn <= NOT i(0) OR NOT i(1) OR NOT i(2); -- Output is 0 when opcode is 111

    jmpC <= i(0) AND NOT i(1) AND i(2); -- Output is 1 when opcode is 101
    jmpZ <= (i(1) AND i(2)) AND NOT (regChk(0) OR regChk(1) OR regChk(2) OR regChk(3)); -- Output is 1 when opcode is 011 and checked register value is 0000
    jmpNZ <= (i(0) AND i(1) AND NOT i(2)) AND (regChk(0) OR regChk(1) OR regChk(2) OR regChk(3)); -- Output is 1 when opcode is 110 and checked register value is not 0000
    jmp <= jmpC OR jmpZ OR jmpNZ;

    -- Mapping bits for register A and B
    regSelA <= i(3) & i(4) & i(5);
    regSelB <= i(6) & i(7) & i(8);

    regEn <= i(3) & i(4) & i(5);

    -- Mapping last 4 bits
    imdVal <= i(9) & i(10) & i(11) & i(12); -- Value to load if MOVI instruction is used
    jmpAddress <= i(10) & i(11) & i(12); -- Address to jump to if JMP instruction is used

end Behavioral;
