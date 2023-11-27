library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GenericMux is
    generic (
        M : positive := 2;   -- Input size, default is 2
        K : positive := 1    -- Number of select lines, default is 1
    );
    port (
        Inputs   : in  std_logic_vector(2**K * M - 1 downto 0);  -- Input signals
        Sel      : in  std_logic_vector(K - 1 downto 0);          -- Select lines
        Output   : out std_logic_vector(M - 1 downto 0)           -- Output signal
    );
end entity GenericMux;

architecture Behavioral of GenericMux is
    function binary_to_integer(bin_val : std_logic_vector) return natural is
        variable result : natural := 0;
    begin
        for i in bin_val'range loop
            result := result * 2;
            if bin_val(i) = '1' then
                result := result + 1;
            end if;
        end loop;
        return result;
    end function;

    signal SelectedIndex : natural range 0 to 2**K - 1 := 0;
begin
    process (Sel)
    begin
        SelectedIndex <= binary_to_integer(Sel);
    end process;

    process (Inputs, SelectedIndex)
    begin
        for i in 0 to M-1 loop
            Output(i) <= Inputs(SelectedIndex * M + i);
        end loop;
    end process;
end architecture Behavioral;

