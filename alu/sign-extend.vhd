library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SignExtend is
    generic (
        InputWidth  : positive := 8;  -- Width of the input signal
        OutputWidth : positive := 16  -- Width of the output signal
    );
    port (
        Input  : in  std_logic_vector(InputWidth - 1 downto 0);
        Output : out std_logic_vector(OutputWidth - 1 downto 0)
    );
end entity SignExtend;

architecture Behavioral of SignExtend is
begin
    process (Input)
        variable sign_bit : std_logic;
    begin
        sign_bit := Input(InputWidth - 1);

        if sign_bit = '0' then
            Output <= (others => '0');
        else
            Output <= (others => '1');
        end if;

        -- assigning the input to the output after extendeing
        Output(OutputWidth - InputWidth - 1 downto 0) <= Input;
    end process;
end architecture Behavioral;

