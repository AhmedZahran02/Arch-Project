LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY decode_stage IS
    GENERIC (
        REG_SIZE : INTEGER := 32;
        REG_NUMBER : INTEGER := 8;
        CONTROL_SIGNAL_SIZE : INTEGER := 22
    );
    PORT (
        -- fetch
        op_code : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        immediate_16 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        
        -- execute 
        execute_destination : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        execute_will_write_back : IN STD_LOGIC;
        is_pop_register : IN STD_LOGIC;


        -- memory
        memory_destination : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        memory_will_write_back : IN STD_LOGIC;

        -- write back 
        write_register_address : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        should_write_back : IN STD_LOGIC;
        load_data : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);

        input_port : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        --==================================================================
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        --==================================================================
        control_signals_out : OUT STD_LOGIC_VECTOR(CONTROL_SIGNAL_SIZE - 1 DOWNTO 0);
        operand_1 : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        operand_2 : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        write_back_register_address : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        hazard_code : out std_logic_vector(3 downto 0);
        stall_signal : out std_logic
    );
END decode_stage;

ARCHITECTURE decode_stage_architecture OF decode_stage IS
    COMPONENT regFile IS
        GENERIC (
            REG_SIZE : INTEGER := 32;
            REG_NUMBER : INTEGER := 8
        );
        PORT (
            writeData : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
            writeEnable, clk, rst : IN STD_LOGIC;
            readAddr1, readAddr2, writeAddr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            readData1, readData2 : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0)
        );
    END COMPONENT;

    component controlUnit IS
        PORT (
        opCode : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        controlSignals : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
        );
    END component;

    COMPONENT hazard_detection_unit IS
        PORT (
            source_1_address : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            source_2_address : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            is_one_operand : IN STD_LOGIC;
            input_port_select : IN STD_LOGIC;
            has_immediate_value : IN STD_LOGIC;
            execute_destination : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            memory_destination : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            execute_will_write_back : IN STD_LOGIC;
            memory_will_write_back : IN STD_LOGIC;
            --==================================================================
            hazard_operand_1_selector : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            hazard_operand_2_selector : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)

        );
    END COMPONENT;

    COMPONENT SignExtend IS
        GENERIC (
            InputWidth : POSITIVE := 8; -- Width of the input signal
            OutputWidth : POSITIVE := 16 -- Width of the output signal
        );
        PORT (
            Input : IN STD_LOGIC_VECTOR(InputWidth - 1 DOWNTO 0);
            Output : OUT STD_LOGIC_VECTOR(OutputWidth - 1 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL is_one_operand : STD_LOGIC; -- 21
    SIGNAL input_port_select : STD_LOGIC; -- 7
    SIGNAL is_rotate_operation : STD_LOGIC; -- 17
    SIGNAL has_immediate_value : STD_LOGIC; -- 18

    SIGNAL hazard_operand_1_selector : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL hazard_operand_2_selector : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL read_register_1_address : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL read_register_2_address : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL read_register_1 : STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
    SIGNAL read_register_2 : STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
    SIGNAL extended_rotate_value : STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
    SIGNAL extended_effective_address : STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
    SIGNAL extended_immediate_value : STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);

    SIGNAL immediate_rotate_out : STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
    SIGNAL input_port_select_out : STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);

    SIGNAL temp_signal_con : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL control_signals : STD_LOGIC_VECTOR(CONTROL_SIGNAL_SIZE - 1 DOWNTO 0);
BEGIN

    -- ==================================== Wires Connection ====================================
    control_signals_out <= control_signals;
    
    is_one_operand <= control_signals(21);
    input_port_select <= control_signals(15);
    is_rotate_operation <= control_signals(18);
    has_immediate_value <= control_signals(19);

    write_back_register_address <= op_code(10 DOWNTO 8);

    temp_signal_con <= op_code(7 DOWNTO 4) & immediate_16;
    
    read_register_1_address <= op_code(7 DOWNTO 5) WHEN is_one_operand = '0' ELSE op_code(10 DOWNTO 8);
    read_register_2_address <= op_code(4 DOWNTO 2);

    immediate_rotate_out <= read_register_2 WHEN (has_immediate_value = '0' AND is_rotate_operation = '0') ELSE
        extended_immediate_value WHEN (has_immediate_value = '1' AND is_rotate_operation = '0') ELSE
        extended_immediate_value WHEN (has_immediate_value = '0' AND is_rotate_operation = '1') ELSE
        extended_effective_address;

    input_port_select_out <= immediate_rotate_out WHEN input_port_select = '0' ELSE input_port;

    operand_1 <= read_register_1;

    operand_2 <= input_port_select_out;

    stall_signal <= '1' WHEN is_pop_register = '1' and (hazard_operand_1_selector = "01" or hazard_operand_2_selector = "01") ELSE '0';

    control_signals_out <= control_signals;
    register_file : regFile GENERIC MAP(
        REG_SIZE, REG_NUMBER) PORT MAP(
        writeData => load_data,
        writeEnable => should_write_back,
        clk => clk,
        rst => reset,
        readAddr1 => read_register_1_address,
        readAddr2 => read_register_2_address,
        writeAddr => write_register_address,
        readData1 => read_register_1,
        readData2 => read_register_2
    );
    extend_immediate_value : SignExtend GENERIC MAP(
        16, REG_SIZE) PORT MAP(
        Input => immediate_16,
        Output => extended_immediate_value
    );
    extend_effective_address : SignExtend GENERIC MAP(
        20, REG_SIZE) PORT MAP(
        Input => temp_signal_con,
        Output => extended_effective_address
    );
    extend_rotate_value : SignExtend GENERIC MAP(
        5, REG_SIZE) PORT MAP(
        Input => op_code(7 DOWNTO 3),
        Output => extended_rotate_value
    );
    HDU : hazard_detection_unit PORT MAP(
        source_1_address => read_register_1_address,
        source_2_address => read_register_2_address,
        is_one_operand => is_one_operand,
        input_port_select => input_port_select,
        has_immediate_value => has_immediate_value,
        execute_destination => execute_destination,
        memory_destination => memory_destination,
        execute_will_write_back => execute_will_write_back,
        memory_will_write_back => memory_will_write_back,
        hazard_operand_1_selector => hazard_operand_1_selector,
        hazard_operand_2_selector => hazard_operand_2_selector
    );

    hazard_code <= hazard_operand_1_selector & hazard_operand_2_selector;
    control_unit: controlUnit
    port map (
      opCode         => op_code(15 downto 11),
      controlSignals => control_signals
    );
END decode_stage_architecture;