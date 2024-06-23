library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_Rom is
    Port (
        romIn : in STD_LOGIC_VECTOR (2 downto 0); -- ROM address input
        romOut : out STD_LOGIC_VECTOR (0 to 12) -- ROM data output
    );
end Program_Rom;

architecture Behavioral of Program_Rom is

 --   type RomType is array (0 to 5) of std_logic_vector(0 to 12);
 --   signal programRom : RomType := (
 --       "0100010000011", -- 0 -- MOVI R1, 3    010 001 000 0011
 --       "0100100000001", -- 1 -- MOVI R2, 1    010 010 000 0001
 --       "0010100000000", -- 2 -- NEG R2        001 010 000 0000
 --       "0000010100000", -- 3 -- ADD R1, R2    000 001 010 0000
 --       "0001110010000", -- 4 -- ADD R7, R1    000 111 001 0000
 --       "1110000000000"  -- 5 -- END           111 000 000 0000
 --   );
    
    
    -- Program to calculate the total of all integers between 1 and 3
        type rom_type is array (0 to 7) of std_logic_vector(0 to 12);
            signal programRom : rom_type := (
                "0101010000101", -- 0 -- MOVI R1, 3
                "0100100000001", -- 1 -- MOVI R2, 1
                "0010100000000", -- 2 -- NEG R2
                "0001111010000", -- 3 -- ADD R7, R1
                "0001010100000", -- 4 -- ADD R1, R2
                "0111010000111", -- 5 -- JZR R1, 7 
                "0110000000011", -- 6 -- JZR R0, 3
                "1110000000111" ); -- 7 --
                
                
                

--    ---- Program that displays numbers by decrementing 10 by 1
--    type RomType is array (0 to 6) of std_logic_vector(0 to 12);
--    signal programRom : RomType := (
--        "0101110000110", -- 0 -- MOVI R7, 10
--        "0100100000001", -- 1 -- MOVI R2, 1
--        "0010100000000", -- 2 -- NEG R2
--        "0001110100000", -- 3 -- ADD R7, R2
--        "0111110000110", -- 4 -- JZR R7, 6
--        "0110000000011", -- 5 -- JZR R0, 3
--        "0110000000110",  -- 6 -- JZR R0, 6 
--        "0110000000000" -- 7 -- END wiTH RESET
--        "1110000000000"  -- 7 -- END
--    );

begin
    romOut <= programRom(to_integer(unsigned(romIn)));
end Behavioral;
