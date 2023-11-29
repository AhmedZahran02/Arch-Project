
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

ENTITY genReg IS
    GENERIC (
        REG_SIZE : INTEGER := 32;
        -- MoA : i need this for the stack pointer to be initialy = 2^12 - 1
        RESET_VALUE : Integer := 0
    );
    PORT (
        dataIn : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        writeEnable, clk, rst : IN STD_LOGIC;
        dataOut : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0)
    );
END genReg;
ARCHITECTURE Behavioral OF genReg IS

    SIGNAL tempDataOut : STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);

BEGIN
    dataOut <= tempDataOut;

    PROCESS (clk)
    BEGIN
        -- moa u forgot to check posedge
        if rising_edge(clk) then
            IF (rst = '1') THEN -- may be modified to this   IF (rst = '1' AND writeEnable = '1') THEN
                tempDataOut <= std_logic_vector(to_unsigned(RESET_VALUE, REG_SIZE));
            ELSE
                IF (writeEnable = '1') THEN
                    tempDataOut <= dataIn;
                END IF;
            END IF;
        end if;
    END PROCESS;
END Behavioral;