
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY one_bit_adder IS     -- single bit adder          
PORT( a,b,cin : IN std_logic;
	s,cout : OUT std_logic); 
END one_bit_adder;


ARCHITECTURE Structural OF one_bit_adder IS
BEGIN            
	s <= a XOR b XOR cin;              
	cout <= (a AND b) or (cin AND (a XOR b));
END Structural;
