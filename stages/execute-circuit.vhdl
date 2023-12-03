library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_textio.all;
use std.textio.all;
use IEEE.numeric_STD.ALL;


entity execute_stage is 
    GENERIC (n : integer := 32;
            SelSize : integer := 4 );
    port(
        operand_i,operand_ii: in std_logic_vector (n - 1 downto 0) ; 
        function_select : in std_logic_vector(SelSize - 1 downto 0);
        
        memory_data_out : in std_logic_vector(31 downto 0);
        is_pop_flags_operation : in std_logic;

        clk : in std_logic;
        rst : in std_logic;

        current_flags : out std_logic_vector(3 downto 0) ;
        alu_result : out std_logic_vector(n - 1 downto 0)
        );
    
end entity execute_stage;


architecture execute_stage_arch of execute_stage is 
    component alu is 
        GENERIC (n : integer := 32;
             SelSize : integer := 4 );
        port(
            Data1,Data2: in std_logic_vector (n - 1 downto 0) ; 
            Sel: in std_logic_vector(SelSize - 1 downto 0);
            FlagsIn:in std_logic_vector(2 downto 0);
            FlagsOut:out std_logic_vector(2 downto 0);
            DataOut : out std_logic_vector(n - 1 downto 0)
            );
    end component;

    component genReg is
        generic (
            REG_SIZE : INTEGER := 32;
            RESET_VALUE : INTEGER := 0 
        );
        port (
            dataIn : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
            writeEnable, clk, rst : IN STD_LOGIC;
            dataOut : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0)
        );
    end component;

    -- either alu output or memory if pop flags
	 signal alu_flags_output : std_logic_vector(2 downto 0);
    signal flag_register_input : std_logic_vector(2 downto 0);
    signal flag_register_output : std_logic_vector(2 downto 0);

begin


flag_register_input <= alu_flags_output when is_pop_flags_operation = '0' else memory_data_out(2 downto 0);

current_flags <= '0' & flag_register_output;

execution_flags_register : genReg generic map(3,0) port map(
    dataIn => flag_register_input,
    writeEnable => '1', -- check for this later
    clk => clk,
    rst => rst,
    dataOut => flag_register_output
);

computation_unit : alu generic map(32,4) port map(
    Data1 => operand_i,
    Data2 => operand_ii,
    Sel => function_select,
    FlagsIn => flag_register_output,
    FlagsOut => alu_flags_output,
    DataOut => alu_result
);

end architecture;