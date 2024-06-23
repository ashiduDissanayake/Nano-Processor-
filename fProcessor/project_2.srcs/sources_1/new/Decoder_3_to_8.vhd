library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_3_to_8 is
    Port (
        input : in STD_LOGIC_VECTOR (2 downto 0);
        enable : in STD_LOGIC;
        output : out STD_LOGIC_VECTOR (7 downto 0)
    );
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
    component Decoder_2_to_4 is
        Port (
            input : in STD_LOGIC_VECTOR;
            enable : in STD_LOGIC;
            output : out STD_LOGIC_VECTOR
        );
    end component;

    signal input0, input1 : STD_LOGIC_VECTOR (1 downto 0);
    signal output0, output1 : STD_LOGIC_VECTOR (3 downto 0);
    signal enable0, enable1, input2 : STD_LOGIC;
begin
    Decoder_2_to_4_0 : Decoder_2_to_4
    PORT MAP (
        input => input0,
        enable => enable0,
        output => output0
    );

    Decoder_2_to_4_1 : Decoder_2_to_4
    PORT MAP (
        input => input1,
        enable => enable1,
        output => output1
    );

    enable0 <= NOT(input(2)) AND enable;
    enable1 <= input(2) AND enable;
    input0 <= input(1 downto 0);
    input1 <= input(1 downto 0);
    input2 <= input(2);

    output(3 downto 0) <= output0;
    output(7 downto 4) <= output1;
end Behavioral;
