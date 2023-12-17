LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY special_instruction_handler IS
    PORT (
        instructionIn : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        clk : IN STD_LOGIC;

        --==================================================================
        instructionOut : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        isSpecial : OUT STD_LOGIC

    );
END special_instruction_handler;
ARCHITECTURE special_instruction_handler_architecture OF special_instruction_handler IS
    SIGNAL isSwap : STD_LOGIC := '0';
    SIGNAL isRet : STD_LOGIC := '0';
    SIGNAL nextInstruction : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL tempCount : INTEGER RANGE 0 TO 255 := 0;

BEGIN

    instructionOut <= nextInstruction;
    PROCESS (clk) -- this is async not sync
    BEGIN

        IF rising_edge(clk) THEN
            IF isSwap = '1' THEN
                IF tempCount = 0 THEN
                    nextInstruction <= "01100" & instructionIn(4 downto 2) & instructionIn(7 downto 5) & instructionIn(4 downto 2) & "00";
                    tempCount <= tempCount + 1;
                ELSIF tempCount = 1 THEN
                    nextInstruction <= "01100" & instructionIn(7 downto 5) & instructionIn(7 downto 5) & instructionIn(4 downto 2) & "00";
                    tempCount <= tempCount + 1;
                    isSpecial <= '0';
                    isSwap <= '0';
            -- Swap Operation Detected
                END IF;
            ELSIF isRet = '1' THEN
                IF tempCount = 0 THEN
                    nextInstruction <= "1110100000000000";
                    tempCount <= tempCount + 1;
                    isRet <= '0';
                    isSpecial <= '0';
                END IF;
            -- Swap Operation Detected
            ELSIF instructionIn(15 DOWNTO 11) = "11110" THEN
                isSpecial <= '1';
                isSwap <= '1';
                tempCount <= 0;
                nextInstruction <= "01100" & instructionIn(7 downto 5) & instructionIn(7 downto 5) & instructionIn(4 downto 2) & "00";
            -- Ret Operation Detected
            ELSIF instructionIn(15 DOWNTO 11) = "11111" THEN
                isSpecial <= '1';
                isRet <= '1';
                tempCount <= 0;
                nextInstruction <= "1010000000000000";
            ELSE
                nextInstruction <= instructionIn;
            END IF;
        END IF;
    END PROCESS;

END special_instruction_handler_architecture;