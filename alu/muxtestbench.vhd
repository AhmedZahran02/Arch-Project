
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TestBench_GenericMux is
end TestBench_GenericMux;

architecture Test of TestBench_GenericMux is
    constant M : positive := 16;
    constant K : positive := 2;
    signal Inputs   : std_logic_vector(2**K * M - 1 downto 0);
    signal Sel      : std_logic_vector(K - 1 downto 0);
    signal Output   : std_logic_vector(M - 1 downto 0);

    signal Clock : std_logic := '0';
    constant ClockPeriod : time := 10 ns;

begin

    DUT: entity work.GenericMux
        generic map (
            M => M,
            K => K
        )
        port map (
            Inputs => Inputs,
            Sel    => Sel,
            Output => Output
        );


    process
    begin
        while now < 100 ns loop
            Clock <= not Clock;
            wait for ClockPeriod / 2;
        end loop;
        wait;
    end process;

    process
    begin

        Inputs <= X"1234ABCDF00D5678";
        

        Sel <= "00";
        wait for ClockPeriod;


        Sel <= "01";
        wait for ClockPeriod;
        Sel <= "10";
        wait for ClockPeriod;
Sel <= "11";
        wait for ClockPeriod;

        wait;
    end process;

end Test;
