LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY controlUnit_tb IS
END controlUnit_tb;

ARCHITECTURE controlUnit_tb_architecture OF controlUnit_tb IS
SIGNAL opCode : STD_LOGIC_VECTOR(4 DOWNTO 0) := (OTHERS => '0');
SIGNAL controlSignals : STD_LOGIC_VECTOR(21 DOWNTO 0);

COMPONENT controlUnit
PORT (
opCode : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
controlSignals : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
);
END COMPONENT;

BEGIN

u1 : controlUnit
PORT MAP(
opCode => opCode,
controlSignals => controlSignals
);

PROCESS
BEGIN
-- NOP
opCode <= "00000";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "0000000000000000000000")) THEN
REPORT "Test Case #1 : Failed" SEVERITY failure;
END IF;
-- NOT
opCode <= "00001";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000000000100000000001")) THEN
REPORT "Test Case #2 : Failed" SEVERITY failure;
END IF;
-- NEG
opCode <= "00010";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000000000100000000010")) THEN
REPORT "Test Case #3 : Failed" SEVERITY failure;
END IF;
-- INC
opCode <= "00011";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000000000100000000011")) THEN
REPORT "Test Case #4 : Failed" SEVERITY failure;
END IF;
-- DEC
opCode <= "00100";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000000000100000000100")) THEN
REPORT "Test Case #5 : Failed" SEVERITY failure;
END IF;
-- OUT
opCode <= "00101";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000000000000100000101")) THEN
REPORT "Test Case #6 : Failed" SEVERITY failure;
END IF;
-- IN
opCode <= "00110";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000000000100010000110")) THEN
REPORT "Test Case #7 : Failed" SEVERITY failure;
END IF;
-- ADD
opCode <= "00111";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "0000000000100000000111")) THEN
REPORT "Test Case #8 : Failed" SEVERITY failure;
END IF;
-- ADDI
opCode <= "01000";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "0001000000100000000111")) THEN
REPORT "Test Case #9 : Failed" SEVERITY failure;
END IF;
-- SUB
opCode <= "01001";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "0000000000100000001000")) THEN
REPORT "Test Case #10 : Failed" SEVERITY failure;
END IF;
-- AND
opCode <= "01010";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "0000000000100000001001")) THEN
REPORT "Test Case #11 : Failed" SEVERITY failure;
END IF;
-- OR
opCode <= "01011";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "0000000000100000001010")) THEN
REPORT "Test Case #12 : Failed" SEVERITY failure;
END IF;
-- XOR
opCode <= "01100";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "0000000000100000001011")) THEN
REPORT "Test Case #13 : Failed" SEVERITY failure;
END IF;
-- CMP
opCode <= "01101";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "0000000000000000001000")) THEN
REPORT "Test Case #14 : Failed" SEVERITY failure;
END IF;
-- BITSET
opCode <= "01110";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000100000100000001100")) THEN
REPORT "Test Case #15 : Failed" SEVERITY failure;
END IF;
-- RCL
opCode <= "01111";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000100000000000001101")) THEN
REPORT "Test Case #16 : Failed" SEVERITY failure;
END IF;
-- RCR
opCode <= "10000";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000100000100000001110")) THEN
REPORT "Test Case #17 : Failed" SEVERITY failure;
END IF;
-- PUSH
opCode <= "10001";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000011000000001000000")) THEN
REPORT "Test Case #18 : Failed" SEVERITY failure;
END IF;
-- POP
opCode <= "10010";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000010000100000000000")) THEN
REPORT "Test Case #19 : Failed" SEVERITY failure;
END IF;
-- PUSH FLAGS
opCode <= "10011";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000011000000001100000")) THEN
REPORT "Test Case #20 : Failed" SEVERITY failure;
END IF;
-- POP FLAGS
opCode <= "10100";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000010000000000010000")) THEN
REPORT "Test Case #21 : Failed" SEVERITY failure;
END IF;
-- LDM
opCode <= "10101";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1001000001100000000110")) THEN
REPORT "Test Case #22 : Failed" SEVERITY failure;
END IF;
-- LDD
opCode <= "10110";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1001100001100000000110")) THEN
REPORT "Test Case #23 : Failed" SEVERITY failure;
END IF;
-- STD
opCode <= "10111";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1001101000000000000110")) THEN
REPORT "Test Case #24 : Failed" SEVERITY failure;
END IF;
-- PROTECT
opCode <= "11000";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000000100000000000101")) THEN
REPORT "Test Case #25 : Failed" SEVERITY failure;
END IF;
-- FREE
opCode <= "11001";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000000010000000000101")) THEN
REPORT "Test Case #26 : Failed" SEVERITY failure;
END IF;
-- JZ
opCode <= "11010";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000000000001000000000")) THEN
REPORT "Test Case #27 : Failed" SEVERITY failure;
END IF;
-- JMP
opCode <= "11011";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1000000000010000000000")) THEN
REPORT "Test Case #28 : Failed" SEVERITY failure;
END IF;
-- CALL
opCode <= "11100";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "1100011000010001000000")) THEN
REPORT "Test Case #29 : Failed" SEVERITY failure;
END IF;
-- RET
opCode <= "11101";
WAIT FOR 1 ns;
IF ("not"(controlSignals = "0010010000000000000000")) THEN
REPORT "Test Case #30 : Failed" SEVERITY failure;
END IF;

WAIT;
END PROCESS;

END controlUnit_tb_architecture;