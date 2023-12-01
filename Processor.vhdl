LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY processor IS
PORT (
instruction_memory_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
instruction_memory_address : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);

data_memory_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
data_memory_address : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);

port_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
port_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
interrupt_signal : IN STD_LOGIC;
reset_signal : IN STD_LOGIC
);
END processor;

ARCHITECTURE arch OF processor IS
BEGIN

END arch;