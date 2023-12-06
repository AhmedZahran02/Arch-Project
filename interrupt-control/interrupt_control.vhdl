LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

ENTITY interrupt_control IS
PORT (
memoryData : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
waitFor : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
int, clk, rst : IN STD_LOGIC;
globalReset, forceInstruction, takeMemoryControl, forcePc : OUT STD_LOGIC;
nextInstruction : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
nextPc : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
nextAddress : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
);
END interrupt_control;

ARCHITECTURE interrupt_control_archticture OF interrupt_control IS
COMPONENT genReg
GENERIC (
REG_SIZE : INTEGER := 32;
-- MoA : i need this for the stack pointer to be initialy = 2^12 - 1
RESET_VALUE : INTEGER := 0
);
PORT (
dataIn : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
writeEnable, clk, rst : IN STD_LOGIC;
dataOut : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0)
);
END COMPONENT;

COMPONENT counter IS
GENERIC (
n : POSITIVE := 2
);
PORT (
clk : IN STD_LOGIC;
reset : IN STD_LOGIC;
load_enable : IN STD_LOGIC;
load_data : IN STD_LOGIC_VECTOR(n - 1 DOWNTO 0);
result : OUT STD_LOGIC
);
END COMPONENT;

SIGNAL currentState, nextState : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL regIn1, RegIn2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL We1, regRst1, We2, regRst2 : STD_LOGIC;
SIGNAL regOut1, RegOut2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL counterRst, counterLoadEn, counterResult : STD_LOGIC;
BEGIN


u1 : genReg PORT MAP(regIn1, We1, clk, regRst1, RegOut1);
u2 : genReg PORT MAP(regIn2, We2, clk, regRst2, RegOut2);
u3 : counter PORT MAP(clk, counterRst, counterLoadEn, waitFor, counterResult);

PROCESS (clk, rst, int)
BEGIN
IF rst = '1' THEN
currentState <= "0000";
ELSIF int = '1' THEN
currentState <= "0111";
counterLoadEn <= '1';
ELSIF rising_edge(clk) THEN
currentState <= nextState;
ELSIF falling_edge(clk) THEN
counterLoadEn <= '0';
END IF;
END PROCESS;

PROCESS (clk)
BEGIN
    IF rising_edge(clk) then 
        CASE currentState IS
        WHEN "0000" =>
            nextState <= "0001";
            nextPc <= (OTHERS => '0');
            globalReset <= '1';
            forceInstruction <= '0';
            nextInstruction <= (OTHERS => '0');
            takeMemoryControl <= '0';
            nextAddress <= (OTHERS => '0');
            forcePc <= '0';
            regRst1 <= '1';
            regRst2 <= '1';
            regIn1 <= (OTHERS => '0');
            regIn2 <= (OTHERS => '0');
            we1 <= '0';
            we2 <= '0';
            counterRst <= '0';
        
        -- read address 0
        WHEN "0001" =>
        
            nextState <= "0010";
            nextPc <= (OTHERS => '0');
            globalReset <= '1';
            forceInstruction <= '0';
            nextInstruction <= (OTHERS => '0');
            takeMemoryControl <= '1';
            nextAddress <= (OTHERS => '0');
            forcePc <= '0';
        
            regRst1 <= '0';
            regIn1 <= (31 DOWNTO 16 => '0') & memoryData;
            we1 <= '1';
        
            regRst2 <= '0';
            regIn2 <= (OTHERS => '0');
            we2 <= '0';
        
            counterRst <= '0';
        
        -- read address 1
        WHEN "0010" =>
            nextState <= "0011";
            nextPc <= (OTHERS => '0');
            globalReset <= '1';
            forceInstruction <= '0';
            nextInstruction <= (OTHERS => '0');
            takeMemoryControl <= '1';
            nextAddress <= (31 DOWNTO 1 => '0') & '1';
            forcePc <= '0';
        
            regRst1 <= '0';
            we1 <= '1';
            regIn1 <= memoryData & regOut1(15 DOWNTO 0);
        
            regRst2 <= '0';
            we2 <= '0';
            regIn2 <= (OTHERS => '0');
        
            counterRst <= '0';
        
        -- read address 2
        WHEN "0011" =>
            nextState <= "0100";
            nextPc <= (OTHERS => '0');
            globalReset <= '1';
            forceInstruction <= '0';
            nextInstruction <= (OTHERS => '0');
            takeMemoryControl <= '1';
            nextAddress <= (31 DOWNTO 2 => '0') & "10";
            forcePc <= '0';
        
            regRst1 <= '0';
            regIn1 <= (OTHERS => '0');
            we1 <= '0';
        
            regRst2 <= '0';
            regIn2 <= (31 DOWNTO 16 => '0') & memoryData;
            we2 <= '1';
        
            counterRst <= '0';
        
        -- read address 3
        WHEN "0100" =>
        
        nextState <= "0101";
        nextPc <= (OTHERS => '0');
        globalReset <= '1';
        forceInstruction <= '0';
        nextInstruction <= (OTHERS => '0');
        takeMemoryControl <= '1';
        nextAddress <= (31 DOWNTO 2 => '0') & "11";
        forcePc <= '0';
        regRst1 <= '0';
        regRst2 <= '0';
        regIn1 <= (OTHERS => '0');
        regIn2 <= memoryData & regOut2(15 DOWNTO 0);
        we1 <= '0';
        we2 <= '1';
        counterRst <= '0';
        
        WHEN "0101" =>
        
            nextState <= "0110";
            nextPc <= regOut1;
            globalReset <= '0';
            forceInstruction <= '0';
            nextInstruction <= (OTHERS => '0');
            takeMemoryControl <= '0';
            nextAddress <= (OTHERS => '0');
            forcePc <= '1';
            regRst1 <= '0';
            regRst2 <= '0';
            regIn1 <= memoryData & regOut2(15 DOWNTO 0);
            regIn2 <= (OTHERS => '0');
            we1 <= '0';
            we2 <= '0';
            counterRst <= '0';
        
        WHEN "0110" =>
        
            nextState <= "0110";
            nextPc <= (OTHERS => '0');
            globalReset <= '0';
            forceInstruction <= '0';
            nextInstruction <= (OTHERS => '0');
            takeMemoryControl <= '0';
            nextAddress <= (OTHERS => '0');
            forcePc <= '0';
            regRst1 <= '0';
            regRst2 <= '0';
            regIn1 <= (OTHERS => '0');
            regIn2 <= (OTHERS => '0');
            we1 <= '0';
            we2 <= '0';
            counterRst <= '0';
        
        WHEN "0111" =>
        
        IF counterResult = '0' THEN
        nextState <= "1000";
        ELSE
        nextState <= "0111";
        END IF;
        nextPc <= (OTHERS => '0');
        globalReset <= '0';
        forceInstruction <= '1';
        nextInstruction <= (OTHERS => '0');
        takeMemoryControl <= '0';
        nextAddress <= (OTHERS => '0');
        forcePc <= '0';
        regRst1 <= '0';
        regRst2 <= '0';
        regIn1 <= (OTHERS => '0');
        regIn2 <= (OTHERS => '0');
        we1 <= '0';
        we2 <= '0';
        counterRst <= '0';
        
        WHEN "1000" =>
        
        nextState <= "1001";
        nextPc <= (OTHERS => '0');
        globalReset <= '0';
        forceInstruction <= '1';
        nextInstruction <= "1110000000000001";
        takeMemoryControl <= '0';
        nextAddress <= (OTHERS => '0');
        forcePc <= '0';
        regRst1 <= '0';
        regRst2 <= '0';
        regIn1 <= (OTHERS => '0');
        regIn2 <= (OTHERS => '0');
        we1 <= '0';
        we2 <= '0';
        counterRst <= '0';
        
        WHEN "1001" =>
        
        nextState <= "1010";
        nextPc <= (OTHERS => '0');
        globalReset <= '0';
        forceInstruction <= '1';
        nextInstruction <= "1001100000000000";
        takeMemoryControl <= '0';
        nextAddress <= (OTHERS => '0');
        forcePc <= '0';
        regRst1 <= '0';
        regRst2 <= '0';
        regIn1 <= (OTHERS => '0');
        regIn2 <= (OTHERS => '0');
        we1 <= '0';
        we2 <= '0';
        counterRst <= '0';
        
        WHEN "1010" =>
        
        nextState <= "0110";
        nextPc <= RegOut2;
        globalReset <= '0';
        forceInstruction <= '0';
        nextInstruction <= (OTHERS => '0');
        takeMemoryControl <= '0';
        nextAddress <= (OTHERS => '0');
        forcePc <= '1';
        regRst1 <= '0';
        regRst2 <= '0';
        regIn1 <= (OTHERS => '0');
        regIn2 <= (OTHERS => '0');
        we1 <= '0';
        we2 <= '0';
        counterRst <= '0';
        
        WHEN OTHERS =>
        
        nextState <= "0110";
        nextPc <= (OTHERS => '0');
        globalReset <= '0';
        forceInstruction <= '0';
        nextInstruction <= (OTHERS => '0');
        takeMemoryControl <= '0';
        nextAddress <= (OTHERS => '0');
        forcePc <= '0';
        regRst1 <= '0';
        regRst2 <= '0';
        regIn1 <= (OTHERS => '0');
        regIn2 <= (OTHERS => '0');
        we1 <= '0';
        we2 <= '0';
        counterRst <= '0';
        
        END CASE;
        
    End if;

END PROCESS;

END interrupt_control_archticture;