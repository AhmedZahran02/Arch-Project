LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY special_instruction_handler IS
    PORT (
        instructionIn : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        clk, bypass: IN STD_LOGIC;
        current_pc : in std_logic_vector(31 downto 0);

        --==================================================================
        instructionOut : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        isSpecial : OUT STD_LOGIC;
        stallCyclesCount : out std_logic_vector(1 downto 0)
    );
END special_instruction_handler;
ARCHITECTURE special_instruction_handler_architecture OF special_instruction_handler IS
    SIGNAL nextInstruction : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL tempCount : INTEGER RANGE 0 TO 255 := 0;
    SIGNAL currentState : std_logic_vector(3 downto 0) := "0000";
    SIGNAL nextState : std_logic_vector(3 downto 0) := "0000";
    SIGNAL previous_pc : std_logic_vector(31 downto 0) := (others => '0');
BEGIN
    stallCyclesCount <= std_logic_vector(to_unsigned(tempCount, 2));
    instructionOut <= instructionIn when (currentState = "0000" or bypass = '1') ELSE nextInstruction;

    PROCESS (instructionIn, clk, bypass)
    BEGIN
        IF bypass = '1' then 
            currentState <= "0000";
            isSpecial <= '0';
            nextState <= "0000";
        ELSIF instructionIn(15 DOWNTO 11) = "11110" and currentState = "0000" and previous_pc /= current_pc THEN
            isSpecial <= '1';
            tempCount <= 2;
            previous_pc <= current_pc;
            currentState <= "0001";
            nextState <= "0001";
            nextInstruction <= "11111" & instructionIn(7 downto 5) & instructionIn(7 downto 5) & instructionIn(4 downto 2) & "00";
        -- Ret Operation Detected
        elsif instructionIn(15 DOWNTO 11) = "11111" and currentState = "0000" and previous_pc /= current_pc THEN
            isSpecial <= '1';
            tempCount <= 1;          
            previous_pc <= current_pc;  
            currentState <= "1001";
            nextState <= "1001";
            nextInstruction <= "1110100000000000"; -- ret
        elsif falling_edge(clk) then
            currentState <= nextState;
            previous_pc <= current_pc;
            if tempCount > 0 then
                tempCount <= tempCount - 1;
            end if;
        elsif rising_edge(clk) then  
            previous_pc <= current_pc; 
            CASE currentState is
                -- swap
                when "0001" =>
                    nextState <= "0010";
                    isSpecial <= '1';
                    nextInstruction <= "11111" & instructionIn(4 downto 2) & instructionIn(7 downto 5) & instructionIn(4 downto 2) & "00";
    
                when "0010" =>
                    nextState <= "0011";
                    isSpecial <= '1';
                    nextInstruction <= "11111" & instructionIn(7 downto 5) & instructionIn(7 downto 5) & instructionIn(4 downto 2) & "00";

                when "0011" =>
                    nextState <= "0000";
                    isSpecial <= '0';

                when "1001" =>
                    nextState <= "0011";
                    isSpecial <= '1';
                    nextInstruction <= "1010000000000010";


                when others =>
                    nextState <= "0000";
                    nextInstruction <= instructionIn;
                    isSpecial <= '0';
            end case;

        end if;

    END PROCESS;
END special_instruction_handler_architecture;