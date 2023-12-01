LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY controlUnit IS
PORT (
opCode : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
controlSignals : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
);
END controlUnit;

ARCHITECTURE controlUnit_architecture OF controlUnit IS
BEGIN
PROCESS (opCode)
BEGIN

-- Initialize
controlSignals <= (OTHERS => '0');

CASE opCode IS
-- NOP
WHEN "00000" =>
controlSignals <= (OTHERS => '0');
-- NOT
WHEN "00001" =>
controlSignals <= "1000000000100000000001";
-- NEG
WHEN "00010" =>
controlSignals <= "1000000000100000000010";
-- INC
WHEN "00011" =>
controlSignals <= "1000000000100000000011";
-- DEC
WHEN "00100" =>
controlSignals <= "1000000000100000000100";
-- OUT
WHEN "00101" =>
controlSignals <= "1000000000000100000101";
-- IN
WHEN "00110" =>
controlSignals <= "1000000000100010000110";
-- ADD
WHEN "00111" =>
controlSignals <= "0000000000100000000111";
-- ADDI
WHEN "01000" =>
controlSignals <= "0001000000100000000111";
-- SUB
WHEN "01001" =>
controlSignals <= "0000000000100000001000";
-- AND
WHEN "01010" =>
controlSignals <= "0000000000100000001001";
-- OR
WHEN "01011" =>
controlSignals <= "0000000000100000001010";
-- XOR
WHEN "01100" =>
controlSignals <= "0000000000100000001011";
-- CMP
WHEN "01101" =>
controlSignals <= "0000000000000000001000";
-- BITSET
WHEN "01110" =>
controlSignals <= "1000100000100000001100";
-- RCL
WHEN "01111" =>
controlSignals <= "1000100000000000001101";
-- RCR
WHEN "10000" =>
controlSignals <= "1000100000100000001110";
-- PUSH
WHEN "10001" =>
controlSignals <= "1000011000000001000000";
-- POP
WHEN "10010" =>
controlSignals <= "1000010000100000000000";
-- PUSH FLAGS
WHEN "10011" =>
controlSignals <= "1000011000000001100000";
-- POP FLAGS
WHEN "10100" =>
controlSignals <= "1000010000000000010000";
-- LDM
WHEN "10101" =>
controlSignals <= "1001000001100000000110";
-- LDD
WHEN "10110" =>
controlSignals <= "1001100001100000000110";
-- STD
WHEN "10111" =>
controlSignals <= "1001101000000000000110";
-- PROTECT
WHEN "11000" =>
controlSignals <= "1000000100000000000101";
-- FREE
WHEN "11001" =>
controlSignals <= "1000000010000000000101";
-- JZ
WHEN "11010" =>
controlSignals <= "1000000000001000000000";
-- JMP
WHEN "11011" =>
controlSignals <= "1000000000010000000000";
-- CALL
WHEN "11100" =>
controlSignals <= "1100011000010001000000";
-- RET
WHEN "11101" =>
controlSignals <= "0010010000000000000000";
WHEN OTHERS =>
controlSignals <= (OTHERS => '0');
END CASE;
END PROCESS;
END controlUnit_architecture;