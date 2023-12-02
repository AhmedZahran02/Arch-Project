LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY processor IS
PORT (
instruction_memory_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
instruction_memory_address : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);

data_memory_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
data_memory_address : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);

port_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
port_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
interrupt_signal : IN STD_LOGIC;
reset_signal : IN STD_LOGIC
);
END processor;

ARCHITECTURE arch OF processor IS

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

    component memory_stage is
        generic (
            DATA_SIZE : integer := 32; 
            SP_STEP : integer := 2;
            FLAGS_COUNT : integer := 4
        );
        Port (
            memory_data_in : in std_logic_vector(DATA_SIZE - 1 downto 0);
            address : in std_logic_vector(DATA_SIZE - 1 downto 0);
            input_flags : in std_logic_vector(FLAGS_COUNT - 1 downto 0);
            --==================================================================
            -- control signals
            write_enable : in std_logic;
            protect_address : in std_logic;
            free_address : in std_logic;
    
            memory_operation : in std_logic;
    
            is_stack_operation : in std_logic;
            inc_dec_stack : in std_logic; -- if 0 will increament else decreament
    
            is_push_flags : in std_logic;
            is_pop_flags : in std_logic;
    
    
            clk : in std_logic;
            reset : in std_logic;
            --==================================================================
            memory_data_result : out std_logic_vector(DATA_SIZE - 1 downto 0);    
            final_data : out std_logic_vector(DATA_SIZE - 1 downto 0)         
        );
    end component;

    signal global_reset : std_logic
    -- 32 opcode
    signal fetch_stage_output   : std_logic_vector(31 downto 0);  
    signal decode_stage_input  : std_logic_vector(31 downto 0);
    -- 15 control signal == 3 write back address == 32 operand-1 == 32 operand-2
    signal decode_stage_output  : std_logic_vector(81 downto 0);
    signal execute_stage_input : std_logic_vector(81 downto 0);
    -- 11 control signal == 3 write back address == 32 operand-1 == 32 operand-2
    signal execute_stage_output : std_logic_vector(77 downto 0);
    signal memory_stage_input  : std_logic_vector(77 downto 0);
    -- 2 control signal == 3 write back address == 32 write back data
    signal memory_stage_output  : std_logic_vector(36 downto 0);
    signal write_back_stage_input  : std_logic_vector(36 downto 0);

BEGIN


-- place fetch stage here and connect fetch_stage_output correct according to the comment

IF_ID: genReg generic map(32,0) port map(
    dataIn => fetch_stage_output,
    writeEnable => '1', 
    clk => clk,
    rst => global_reset,
    dataOut => decode_stage_input
)

-- place decode stage here and connect decode_stage_output correct according to the comment

ID_IE: genReg generic map(82,0) port map(
    dataIn => decode_stage_output,
    writeEnable => '1', 
    clk => clk,
    rst => global_reset,
    dataOut => execute_stage_input
)

-- place execute stage here and connect execute_stage_output correct according to the comment

IE_IM: genReg generic map(78,0) port map(
    dataIn => execute_stage_output,
    writeEnable => '1', 
    clk => clk,
    rst => global_reset,
    dataOut => memory_stage_input
)

-- place memory stage here and connect memory_stage_output correct according to the comment

IM_IW: genReg generic map(37,0) port map(
    dataIn => memory_stage_output,
    writeEnable => '1', 
    clk => clk,
    rst => global_reset,
    dataOut => write_back_stage_input
)

-- place write back stage here


END arch;