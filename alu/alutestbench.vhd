

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TestBench_alu is
end TestBench_alu;

architecture Test of TestBench_alu is
   constant n : positive := 32;
   constant SelSize : positive := 4;

   signal Data1,Data2:  std_logic_vector (n - 1 downto 0) ; 
   signal Sel:  std_logic_vector(SelSize - 1 downto 0);
   signal FlagsIn: std_logic_vector(2 downto 0);
   signal FlagsOut: std_logic_vector(2 downto 0);
   signal DataOut :  std_logic_vector(n - 1 downto 0);

    signal Clock : std_logic := '0';
    constant ClockPeriod : time := 10 ns;

begin

    DUT: entity work.alu
        generic map (
            n => n,
            SelSize => SelSize
        )
        port map (
            Data1 => Data1,
	    Data2 => Data2,
	    Sel => Sel,
            FlagsIn    => FlagsIn,
            FlagsOut => FlagsOut,
	    DataOut => DataOut
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

        Data1 <= X"0000000F"; -- 15
        Data2 <= X"00000002"; -- 2
	FlagsIn<= "000";
        Sel <= "0000"; -- nop
        wait for ClockPeriod;
	Sel <= "0001"; -- not
	wait for ClockPeriod;
	Sel <= "0010"; -- neg
	wait for ClockPeriod;
	Sel <= "0011"; -- inc
        wait for ClockPeriod;
	Sel <= "0100"; -- dec
	wait for ClockPeriod;
	Sel <= "0101"; -- op1
	wait for ClockPeriod;
	Sel <= "0110"; -- op2
        wait for ClockPeriod;
	Sel <= "0111"; -- add
	wait for ClockPeriod;
	Sel <= "1000"; -- sub
	wait for ClockPeriod;
	Sel <= "1001"; -- and
        wait for ClockPeriod;
	Sel <= "1010"; -- or
	wait for ClockPeriod;
	Sel <= "1011"; -- xor
	wait for ClockPeriod;
	Sel <= "1100"; -- bitset
	wait for ClockPeriod;
	Sel <= "1101"; -- RCL
	wait for ClockPeriod;
	Sel <= "1110"; -- RCR
	wait for ClockPeriod;

        wait;
    end process;

end Test;