LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY writeback_stage IS
    GENERIC (
        REG_SIZE : INTEGER := 32
    );
    PORT (
        output_port_select : STD_LOGIC;
        writeback_address_in : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        writeback_data_in : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        --==================================================================
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        --==================================================================
        writeback_address_out : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        output_port : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
        writeback_data_out : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0)
    );
END writeback_stage;
ARCHITECTURE writeback_stage_architecture OF writeback_stage IS

signal latched_out_port : std_logic_vector(31 downto 0);
BEGIN

    -- ==================================== Wires Connection ====================================
    output_port <= latched_out_port;

    writeback_data_out <= writeback_data_in;
    writeback_address_out <= writeback_address_in;

    process(clk,reset)
    begin
        if reset = '1' then
            latched_out_port <= (others => '0'); 
        elsif falling_edge(clk) then 
            if output_port_select = '1' then 
                latched_out_port <= writeback_data_in;
            else 
                latched_out_port <= latched_out_port;
            end if;
        end if;
    end process;

END writeback_stage_architecture;