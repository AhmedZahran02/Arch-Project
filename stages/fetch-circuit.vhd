LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fetch_stage IS
    GENERIC (
        REG_SIZE : INTEGER := 32;
        REG_NUMBER : INTEGER := 8;
        CONTROL_SIGNAL_SIZE : INTEGER := 22
    );
    PORT (
        control_signals_in : IN STD_LOGIC_VECTOR(CONTROL_SIGNAL_SIZE - 1 DOWNTO 0);
        op_code : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        instruction : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        write_register_address : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        input_port : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        load_data : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        pc : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        alu_result : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        memory_result : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        execute_destination : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        memory_destination : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        execute_will_write_back : IN STD_LOGIC;
        memory_will_write_back : IN STD_LOGIC;
        should_write_back : IN STD_LOGIC;
        output_port_select : IN STD_LOGIC;
        --==================================================================
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        --==================================================================
        control_signals_out : OUT STD_LOGIC_VECTOR(CONTROL_SIGNAL_SIZE - 1 DOWNTO 0);
        operand_1 : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        operand_2 : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        output_port : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        write_back_register_address : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)

    );
END fetch_stage;
ARCHITECTURE fetch_stage_architecture OF fetch_stage IS
BEGIN


END fetch_stage_architecture;