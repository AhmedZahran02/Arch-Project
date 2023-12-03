LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY hazard_detection_unit IS
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
END hazard_detection_unit;
ARCHITECTURE hazard_detection_unit_architecture OF hazard_detection_unit IS
BEGIN
    hazard_operand_1_selector <= "01" WHEN ((source_1_address = execute_destination) AND(execute_will_write_back = '1'))ELSE
        "10"
        WHEN ((source_1_address = memory_destination) AND(memory_will_write_back = '1')) ELSE
        "00";

    hazard_operand_2_selector <= "01" WHEN ((source_2_address = execute_destination) AND(execute_will_write_back = '1'))ELSE
        "10"
        WHEN ((source_2_address = memory_destination) AND(memory_will_write_back = '1')) ELSE
        "00";

END hazard_detection_unit_architecture;