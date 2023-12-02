LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

ENTITY regFile IS
	GENERIC (
		REG_SIZE : INTEGER := 8;
		REG_NUMBER : INTEGER := 8
	);
	PORT (
		writeData : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
		writeEnable, clk, rst : IN STD_LOGIC;
		readAddr1, readAddr2, writeAddr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		readData1, readData2 : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0)
	);
END regFile;
ARCHITECTURE Behavioral OF regFile IS

	TYPE VectorArrayType IS ARRAY (NATURAL RANGE <>) OF STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
	SIGNAL generalRegister : VectorArrayType(0 TO REG_NUMBER - 1);

BEGIN
	readData1 <= generalRegister(to_integer(unsigned(readAddr1)));
	readData2 <= generalRegister(to_integer(unsigned(readAddr2)));

	PROCESS (clk)
	BEGIN
	IF rising_edge(clk) THEN -- moa => added this to make it positive edge triggered
		IF (rst = '1') THEN -- may be modified to this   IF (rst = '1' AND writeEnable = '1') THEN
			FOR i IN 0 TO REG_NUMBER - 1 LOOP
				generalRegister(i) <= (OTHERS => '0');
			END LOOP;
		ELSE
			IF (writeEnable = '1') THEN
				generalRegister(to_integer(unsigned(writeAddr))) <= writeData;
			END IF;
		END IF;
	END IF;
	END PROCESS;
END Behavioral;