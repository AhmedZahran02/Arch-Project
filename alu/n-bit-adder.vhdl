

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY n_bit_adder IS
GENERIC (n : integer := 8);
PORT   (a, b : IN std_logic_vector(n-1 DOWNTO 0) ;
             cin : IN std_logic;
             s : OUT std_logic_vector(n-1 DOWNTO 0);
             cout : OUT std_logic);

END n_bit_adder;

ARCHITECTURE Structural OF n_bit_adder IS
         COMPONENT one_bit_adder IS
                  PORT( a,b,cin : IN std_logic; s,cout : OUT std_logic);
          END COMPONENT;
         SIGNAL temp : std_logic_vector(n DOWNTO 0);
BEGIN
temp(0) <= cin;
loop1: FOR i IN 0 TO n-1 GENERATE
        fx: one_bit_adder PORT MAP(a(i),b(i),temp(i),s(i),temp(i+1));
END GENERATE;
Cout <= temp(n);
END Structural;
