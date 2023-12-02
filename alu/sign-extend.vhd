library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SignExtend is
    generic (
        InputWidth  : positive := 4;  -- Width of the input signal
        OutputWidth : positive := 32  -- Width of the output signal
    );
    port (
        Input  : in  std_logic_vector(InputWidth - 1 downto 0);
        Output : out std_logic_vector(OutputWidth - 1 downto 0)
    );
end entity SignExtend;

architecture Structural of SignExtend is
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
        Output(InputWidth - 1 downto 0) <= Input;
    end process;
end architecture Structural;

