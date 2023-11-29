
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

ENTITY genReg IS
    GENERIC (
        REG_SIZE : INTEGER := 32
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
        IF (rst = '1') THEN -- may be modified to this   IF (rst = '1' AND writeEnable = '1') THEN
            tempDataOut <= (OTHERS => '0');
        ELSE
            IF (writeEnable = '1') THEN
                tempDataOut <= dataIn;
            END IF;
        END IF;
    END PROCESS;
END Behavioral;