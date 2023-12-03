LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY processor IS
PORT (
port_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
port_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

clk : IN STD_LOGIC;
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

    component fetch_stage IS
        PORT (
        forceInstruction : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        regFileReadI : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        memoryData : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        isRetOperation : IN STD_LOGIC;
        isNonContionalJump : IN STD_LOGIC;
        isJumpZero : IN STD_LOGIC;
        zeroFlag : IN STD_LOGIC;
        nextPc : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        forcePc : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        nextAddress : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        takeMemoryControl : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        nextInstruction : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        clk : IN STD_LOGIC;
        --------------------------------------------------
        currentPc : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        instructionOut : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        instructionMemoryOut : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        waitFor : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
        );
    END component;

    component decode_stage IS
        GENERIC (
            REG_SIZE : INTEGER := 32;
            REG_NUMBER : INTEGER := 8;
            CONTROL_SIGNAL_SIZE : INTEGER := 22
        );
        PORT (
            -- fetch
            op_code : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            immediate_16 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            pc : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
            
            -- execute 
            alu_result : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
            execute_destination : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            execute_will_write_back : IN STD_LOGIC;

            -- memory
            memory_result : IN STD_LOGIC_VECTOR(REG_SIZE - 1 DOWNTO 0);
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
            reg_file_i_output : OUT STD_LOGIC_VECTOR(REG_SIZE - 1 downto 0);
            write_back_register_address : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)

        );
    END component;

    component execute_stage is 
        GENERIC (
            n : integer := 32;
            SelSize : integer := 4 
        );
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

    component writeback_stage IS
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
    END component;
    -- fetch stage output wires
    signal global_reset : std_logic;
    signal current_pc : std_logic_vector(31 downto 0);
    signal wait_for : std_logic_vector(1 downto 0);
    signal instruction_memory_out : std_logic_vector(15 downto 0);

    -- decode stage output wires
    signal register_file_output_i : std_logic_vector(31 downto 0);

    -- execute stage output wires
    signal current_flags : std_logic_vector(3 downto 0); 


    -- memory stage output wires
    signal memory_data_out : std_logic_vector(31 downto 0);

    -- write back wires 
    signal write_back_data :std_logic_vector(31 downto 0);
    signal write_back_address :std_logic_vector(2 downto 0);

    -- 32 opcode
    signal fetch_stage_output   : std_logic_vector(15 downto 0);  
    signal decode_stage_input  : std_logic_vector(15 downto 0);
    -- 15 control signal == 3 write back address == 32 operand-1 == 32 operand-2
    signal decode_stage_output  : std_logic_vector(88 downto 0);
    signal execute_stage_input : std_logic_vector(88 downto 0);
    -- 11 control signal == 3 write back address == 32 operand-1 == 32 operand-2
    signal execute_stage_output : std_logic_vector(77 downto 0);
    signal memory_stage_input  : std_logic_vector(77 downto 0);
    -- 2 control signal == 3 write back address == 32 write back data
    signal memory_stage_output  : std_logic_vector(36 downto 0);
    signal write_back_stage_input  : std_logic_vector(36 downto 0);
BEGIN
-- place fetch stage here and connect fetch_stage_output correct according to the comment
fetch: fetch_stage
port map (
  forceInstruction     => "0", -- edit this when you integrate the interruption control
  regFileReadI         => register_file_output_i, 
  memoryData           => memory_data_out,
  isRetOperation       => decode_stage_input(0),
  isNonContionalJump   => decode_stage_input(0),
  isJumpZero           => decode_stage_input(0),
  zeroFlag             => current_flags(0),
  nextPc               => (others => '0'), -- edit this when you integrate the interruption control
  forcePc              => "0", -- edit this when you integrate the interruption control
  nextAddress          => (others => '0'), -- edit this when you integrate the interruption control
  takeMemoryControl    => "0", -- edit this when you integrate the interruption control
  nextInstruction      => (others => '0'), -- edit this when you integrate the interruption control
  clk                  => clk,
  currentPc            => current_pc,
  instructionOut       => fetch_stage_output,
  instructionMemoryOut => instruction_memory_out,
  waitFor              => wait_for
); 

IF_ID: genReg generic map(32,0) port map(
    dataIn => fetch_stage_output,
    writeEnable => '1', 
    clk => clk,
    rst => global_reset,
    dataOut => decode_stage_input
);

-- place decode stage here and connect decode_stage_output correct according to the comment
decode: decode_stage
    generic map (
    REG_SIZE            => 32,
    REG_NUMBER          => 8,
    CONTROL_SIGNAL_SIZE => 22
    )
    port map (
    op_code                     => fetch_stage_output,
    immediate_16                => instruction_memory_out,
    pc                          => current_pc,
    alu_result                  => execute_stage_output(31 downto 0),
    execute_destination         => execute_stage_input(66 downto 64),
    execute_will_write_back     => execute_stage_input(67), -- change this
    memory_result               => memory_stage_output(31 downto 0),
    memory_destination          => memory_stage_input(66 downto 64),
    memory_will_write_back      => memory_stage_input(67),
    
    write_register_address      => write_back_address,
    should_write_back           => write_back_stage_input(0),
    load_data                   => write_back_data,
    
    input_port                  => port_in,
    clk                         => clk,
    reset                       => global_reset,
    
    reg_file_i_output           => register_file_output_i,

    control_signals_out         => decode_stage_output(88 downto 67),
    operand_1                   => decode_stage_output(63 downto 32),
    write_back_register_address => decode_stage_input(66 downto 64),
    operand_2                   => decode_stage_output(31 downto 0)
);

ID_IE: genReg generic map(82,0) port map(
    dataIn => decode_stage_output,
    writeEnable => '1', 
    clk => clk,
    rst => global_reset,
    dataOut => execute_stage_input
);

-- place execute stage here and connect execute_stage_output correct according to the comment
exec: execute_stage generic map(32,4) port map(
    operand_i => execute_stage_input(63 downto 32),
    operand_ii => execute_stage_input(31 downto 0),
    function_select => execute_stage_input(81 downto 78),

    memory_data_out => memory_data_out,
    is_pop_flags_operation => execute_stage_input(77),

    clk => clk,
    rst => global_reset,

    current_flags => current_flags,
    alu_result => execute_stage_output(31 downto 0)
);


IE_IM: genReg generic map(78,0) port map(
    dataIn => execute_stage_output,
    writeEnable => '1', 
    clk => clk,
    rst => global_reset,
    dataOut => memory_stage_input
);

-- place memory stage here and connect memory_stage_output correct according to the comment
memo : memory_stage generic map(32,2,4) port map (
    memory_data_in => memory_stage_input(63 downto 32),
    address => memory_stage_input(31 downto 0),
    input_flags => current_flags,
   
    -- change the flags later
    write_enable => memory_stage_input(77),
    protect_address => memory_stage_input(76),
    free_address => memory_stage_input(75),

    memory_operation => memory_stage_input(74),

    is_stack_operation => memory_stage_input(73),
    inc_dec_stack => memory_stage_input(72),

    is_push_flags => memory_stage_input(71),
    is_pop_flags => memory_stage_input(70),


    clk => clk,
    reset => global_reset,
    
    memory_data_result => memory_data_out,    
    final_data => memory_stage_output(31 downto 0)     
);

IM_IW: genReg generic map(37,0) port map(
    dataIn => memory_stage_output,
    writeEnable => '1', 
    clk => clk,
    rst => global_reset,
    dataOut => write_back_stage_input
);

-- place write back stage here
writeback: writeback_stage
generic map (
  REG_SIZE            => 32
)
port map (
  output_port_select    => write_back_stage_input(35),
  writeback_address_in  => write_back_stage_input(34 downto 32),
  writeback_data_in     => write_back_stage_input(31 downto 0),
  clk                   => clk,
  reset                 => global_reset,
  writeback_address_out => write_back_address,
  output_port           => port_out,
  writeback_data_out    => write_back_data
);

END arch;