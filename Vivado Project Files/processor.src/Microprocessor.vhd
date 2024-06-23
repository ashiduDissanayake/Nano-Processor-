
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Microprocessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC := '0'; -- Resets clock, program counter and register bank
           L : out STD_LOGIC_VECTOR (3 downto 0); -- LED output of register 7
           C_Flag : out STD_LOGIC; -- Carry flag
           Z_Flag : out STD_LOGIC; -- Zero flag
           N_Flag : out STD_LOGIC; -- Negetive flag
           P_Flag : out STD_LOGIC; -- Parity flag (Odd parity detector)
           Seg_7 : out STD_LOGIC_VECTOR (6 downto 0); -- 7 Segment output of register 7
           Anode : out STD_LOGIC_VECTOR (3 downto 0)); -- Anode for 7 segment display        
end Microprocessor;
architecture Behavioral of Microprocessor is
-- Slow Clock
component Slow_Clk
    Port ( clkIn : in STD_LOGIC;
           en : in STD_LOGIC;
           reset : in STD_LOGIC;
           clkOut : out STD_LOGIC;
           clkOutBar : out STD_LOGIC );
end component;

-- Instruction Decoder
component Inst_Decoder
    Port ( inst : in STD_LOGIC_VECTOR (0 to 12); -- Instruction
           clk : in STD_LOGIC;
           regChk : in STD_LOGIC_VECTOR (3 downto 0); -- Check register value for JZR
           regSelA : out STD_LOGIC_VECTOR (2 downto 0); -- To select register to load into MUX A
           regSelB : out STD_LOGIC_VECTOR (2 downto 0); -- To select register to load into MUX B
           imdVal : out STD_LOGIC_VECTOR (3 downto 0); -- Immediate value
           regEn : out STD_LOGIC_VECTOR (2 downto 0); -- Enable register for write
           loadSel : out STD_LOGIC; -- Choose between Imd value or Add/Sub Unit result
           addSubSel : out STD_LOGIC; -- Add Sub selector
           clkEn : out STD_LOGIC; -- Enable/Disable clock
           jmp : out STD_LOGIC; -- Jump flag
           jmpAddress : out STD_LOGIC_VECTOR (2 downto 0)); -- Address to jump
end component;

-- Program Rom
component Program_Rom
    Port ( romIn : in STD_LOGIC_VECTOR (2 downto 0);
           romout : out STD_LOGIC_VECTOR (0 to 12));
end component;

-- Program Counter
component PC
    Port ( pcIn : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           res : in STD_LOGIC;
           pcOut : out STD_LOGIC_VECTOR (2 downto 0));
end component;

-- Register Bank
component Reg_Bank
    Port ( regIn : in STD_LOGIC_VECTOR (3 downto 0);
           regSel : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           r0 : out STD_LOGIC_VECTOR (3 downto 0);
           r1 : out STD_LOGIC_VECTOR (3 downto 0);
           r2 : out STD_LOGIC_VECTOR (3 downto 0);
           r3 : out STD_LOGIC_VECTOR (3 downto 0);
           r4 : out STD_LOGIC_VECTOR (3 downto 0);
           r5 : out STD_LOGIC_VECTOR (3 downto 0);
           r6 : out STD_LOGIC_VECTOR (3 downto 0);
           r7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- 4 bit Add/Sub Unit
component ALU
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC; -- Add/Sub Selector
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cOut : out STD_LOGIC; -- Carry flag
           zOut : out STD_LOGIC; -- Zero flag
           nOut : out STD_LOGIC; -- Negetive flag
           pOut : out STD_LOGIC); -- Parity flag (Odd parity detector) 
end component;

-- 3 bit Adder
component Adder_3_bit
    Port ( a : in STD_LOGIC_VECTOR (2 downto 0);
           b : in STD_LOGIC_VECTOR (2 downto 0);
           s : out STD_LOGIC_VECTOR (2 downto 0));
end component;

---- 2-way 3-bit Mux
component Mux_2_3
    Port ( i0 : in STD_LOGIC_VECTOR (2 downto 0);
           i1 : in STD_LOGIC_VECTOR (2 downto 0);
           s : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

---- 2-way 4-bit Mux
--component Mux_2_4
--    Port ( i0 : in STD_LOGIC_VECTOR (3 downto 0);
--           i1 : in STD_LOGIC_VECTOR (3 downto 0);
--           s : in STD_LOGIC;
--           q : out STD_LOGIC_VECTOR (3 downto 0));
--end component;

---- 8-way 4-bit Mux
--component Mux_8_4
--    Port ( r0 : in STD_LOGIC_VECTOR (3 downto 0);
--           r1 : in STD_LOGIC_VECTOR (3 downto 0);
--           r2 : in STD_LOGIC_VECTOR (3 downto 0);
--           r3 : in STD_LOGIC_VECTOR (3 downto 0);
--           r4 : in STD_LOGIC_VECTOR (3 downto 0);
--           r5 : in STD_LOGIC_VECTOR (3 downto 0);
--           r6 : in STD_LOGIC_VECTOR (3 downto 0);
--           r7 : in STD_LOGIC_VECTOR (3 downto 0);
--           s : in STD_LOGIC_VECTOR (2 downto 0);
--           q : out STD_LOGIC_VECTOR (3 downto 0));
--end component;

--Mux with tri state buffer declaration

-- 2-way 4-bit Mux
component Mux_2_1
    Port ( i0 : in STD_LOGIC_VECTOR (3 downto 0);
           i1 : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- 8-way 4-bit Mux
component Mux_8_1
    Port ( r0 : in STD_LOGIC_VECTOR (3 downto 0);
           r1 : in STD_LOGIC_VECTOR (3 downto 0);
           r2 : in STD_LOGIC_VECTOR (3 downto 0);
           r3 : in STD_LOGIC_VECTOR (3 downto 0);
           r4 : in STD_LOGIC_VECTOR (3 downto 0);
           r5 : in STD_LOGIC_VECTOR (3 downto 0);
           r6 : in STD_LOGIC_VECTOR (3 downto 0);
           r7 : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (2 downto 0);
           q : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

type DATA_BUS is array (0 to 7) of std_logic_vector(3 downto 0);

signal Clk_slow, Clk_slow_bar, Clk_En : STD_LOGIC; -- Internal clock
signal LD, Sub, Jmp : STD_LOGIC;
signal Sel_A, Sel_B, Reg_En, Address, Jmp_Address, Prg_Address, Mem_Sel : STD_LOGIC_VECTOR (2 downto 0);
signal A, B, S, D, M, AddressNew, Jmp_AddressNew, Prg_AddressNew : STD_LOGIC_VECTOR (3 downto 0);
signal I : STD_LOGIC_VECTOR (0 to 12);
signal R : DATA_BUS;

begin

-- Slow Clock
Slow_Clock : Slow_Clk
    PORT MAP (
        clkIn => Clk,
        en => Clk_En,
        reset => Reset,
        clkOut => Clk_slow,
        clkOutBar => Clk_slow_bar);

-- Instruction Decoder
Instruction_Decoder : Inst_Decoder
    PORT MAP (
        inst => I, 
        clk => Clk_slow, 
        regChk => A,
        regSelA => Sel_A, 
        regSelB => Sel_B, 
        imdVal => M, 
        regEn => Reg_En, 
        loadSel => LD, 
        addSubSel => Sub, 
        clkEn => Clk_En,
        jmp => Jmp, 
        jmpAddress => Jmp_Address);

-- Program Rom
Prog_Rom : Program_Rom
    PORT MAP (
        romIn => Mem_Sel,
        romOut => I );

-- Program Counter
Prog_Counter : PC
    PORT MAP ( 
        pcIn => Address,
        clk => Clk_slow,
        res => Reset,
        pcOut => Mem_Sel );

-- Register Bank
Register_Bank : Reg_Bank
    PORT MAP ( 
        regIn => D,
        regSel => Reg_En,
        clk => Clk_slow_bar,
        reset => Reset,
        r0 => R(0),
        r1 => R(1),
        r2 => R(2),
        r3 => R(3),
        r4 => R(4),
        r5 => R(5),
        r6 => R(6),
        r7 => R(7) );

-- 4 bit Add/Sub Unit
Add_Sub_Unit_4_bit : ALU
    PORT MAP ( 
        a => A,
        b => B,
        sel => Sub,
        S => S,
        cOut => C_Flag,
        zOut => Z_Flag,
        nOut => N_Flag,
        pOut => P_Flag );

-- 3 bit Adder
Adder_3bit : Adder_3_bit
    PORT MAP ( 
        a => Mem_Sel,
        b => "001",
        s => Prg_Address );

-- 2-way 3-bit Mux
--AddressNew <= '0' & Address;
--Jmp_AddressNew <= '0' & Jmp_Address;
--Prg_AddressNew <= '0' & Prg_Address;

Mux_2_3_0 : Mux_2_3
    PORT MAP ( 
        i0 => Prg_Address,
        i1 => Jmp_Address,
        s => Jmp,
        q => Address );

-- 2-way 4-bit Mux
Mux_2_4_0 : Mux_2_1
    PORT MAP ( 
        i0 => S,
        i1 => M,
        s => LD,
        q => D );

-- 8-way 4-bit Mux
Mux_8_4_A : Mux_8_1
    PORT MAP ( 
        r0 => R(0),
        r1 => R(1),
        r2 => R(2),
        r3 => R(3),
        r4 => R(4),
        r5 => R(5),
        r6 => R(6),
        r7 => R(7),
        s => Sel_A,
        q => A );

-- 8-way 4-bit Mux
Mux_8_4_B : Mux_8_1
    PORT MAP ( 
        r0 => R(0),
        r1 => R(1),
        r2 => R(2),
        r3 => R(3),
        r4 => R(4),
        r5 => R(5),
        r6 => R(6),
        r7 => R(7),
        s => Sel_B,
        q => B );
    
-- 7-Segment Display
Seg_7_LUT : LUT_16_7
    PORT MAP ( 
        address => R(7),
        data => Seg_7 );

L <= R(7); -- Map value in register 7 to LEDs
Anode <= "1110"; -- Enable only first display in 7 segement display 

end Behavioral;