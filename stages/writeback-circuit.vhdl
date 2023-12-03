LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY writeback_stage IS
    GENERIC (
        REG_SIZE : INTEGER := 32;
        REG_NUMBER : INTEGER := 8;
        CONTROL_SIGNAL_SIZE : INTEGER := 22
    );
    PORT (
        control_signals_in : IN STD_LOGIC_VECTOR(CONTROL_SIGNAL_SIZE - 1 DOWNTO 0);
        writeback_address_in : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        writeback_data : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        --==================================================================
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        --==================================================================
        control_signals_out : OUT STD_LOGIC_VECTOR(CONTROL_SIGNAL_SIZE - 1 DOWNTO 0);
        writeback_address_out : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        output_port : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0)

    );
END writeback_stage;
ARCHITECTURE writeback_stage_architecture OF writeback_stage IS

    SIGNAL output_port_select : STD_LOGIC; -- 8
BEGIN

    -- ==================================== Wires Connection ====================================
    output_port_select <= control_signals_in(8);

    output_port <= writeback_data WHEN (output_port_select = '1');

END writeback_stage_architecture;