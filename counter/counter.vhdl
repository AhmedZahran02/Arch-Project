LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY counter IS
GENERIC (
n : POSITIVE := 3
);
PORT (
clk : IN STD_LOGIC;
reset : IN STD_LOGIC;
load_enable : IN STD_LOGIC;
load_data : IN STD_LOGIC_VECTOR(n - 1 DOWNTO 0);
result : OUT STD_LOGIC_VECTOR(n-1 downto 0);
next_count : OUT std_logic_vector(n-1 downto 0);
counter_enable : IN std_logic
);
END counter;

ARCHITECTURE counter_archticture OF counter IS
SIGNAL counter_reg : STD_LOGIC_VECTOR(n - 1 DOWNTO 0) := (OTHERS => '0');
SIGNAL isNotZero : STD_LOGIC := '0';
BEGIN
PROCESS (clk, reset) -- this is async not sync
BEGIN
IF reset = '1' THEN
counter_reg <= (OTHERS => '0');
ELSIF rising_edge(clk) THEN
IF load_enable = '1' THEN
counter_reg <= load_data;
ELSIF isnotZero = '1' and counter_enable = '1' THEN
counter_reg <= counter_reg - 1;
ELSE
counter_reg <= counter_reg;
END IF;
END IF;
END PROCESS;

PROCESS (counter_reg)
VARIABLE temp : STD_LOGIC := '0';
BEGIN
temp := '0';
FOR i IN 0 TO N - 1 LOOP
temp := temp OR counter_reg(i);
END LOOP;
isNotZero <= temp;
if counter_reg = "00" then
    next_count <= "00";
else
    next_count <= counter_reg - 1;
end if;
result <= counter_reg;
END PROCESS;

END counter_archticture;