library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

entity memory_stage is
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
end memory_stage;

architecture memory_stage_architecture of memory_stage is

    component memory is
        Port (
                input_data_bus : in std_logic_vector(31 downto 0);
                address_bus : in std_logic_vector(11 downto 0);
                extra_address : in std_logic;
                --================================================================
                write_enable : in std_logic;
                free_enable : in std_logic;
                protect_enable : in std_logic;
                clk : in std_logic;
                reset : in std_logic;
                --================================================================
                output_data_bus: out std_logic_vector(31 downto 0)
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

    component SignExtend is
        generic (
            InputWidth  : positive := 8;  -- Width of the input signal
            OutputWidth : positive := 16  -- Width of the output signal
        );
        port (
            Input  : in  std_logic_vector(InputWidth - 1 downto 0);
            Output : out std_logic_vector(OutputWidth - 1 downto 0)
        );
    end component;

    signal memory_data_out : std_logic_vector(DATA_SIZE - 1 downto 0);
    signal address_select : std_logic_vector(DATA_SIZE - 1 downto 0);
    signal memory_data_select : std_logic_vector(DATA_SIZE - 1 downto 0);

    signal stack_pointer_in : std_logic_vector(DATA_SIZE - 1 downto 0);
    signal stack_pointer_out : std_logic_vector(DATA_SIZE - 1 downto 0);

    signal extended_flags : std_logic_vector(DATA_SIZE - 1 downto 0);
begin

    -- ==================================== Wires Connection ====================================
    memory_data_select <= memory_data_in when is_push_flags = '0' else extended_flags;

    address_select <= address           when is_stack_operation = '0'   else 
                      stack_pointer_out when inc_dec_stack      = '1'   else 
                      std_logic_vector(unsigned(stack_pointer_out) + to_unsigned(SP_STEP, stack_pointer_out'length));


    stack_pointer_in <= std_logic_vector(unsigned(stack_pointer_out) + to_unsigned(SP_STEP, stack_pointer_out'length)) 
    when inc_dec_stack = '0' 
    else std_logic_vector(unsigned(stack_pointer_out) - to_unsigned(SP_STEP, stack_pointer_out'length));
    
    memory_data_result <= memory_data_out when reset = '0' else (others => '0');

    final_data <= (others => '0') when reset = '1' else 
                  memory_data_out when memory_operation = '1' else 
                  address;
    -- ==================================== Components Init ====================================

    data_memory : memory generic map(2) port map (
        input_data_bus => memory_data_select,
        address_bus => address_select(11 downto 0),
        extra_address => '1',
        --================================================================
        write_enable => write_enable,
        free_enable => free_address,
        protect_enable => protect_address,
        clk => clk,
        reset => reset,
        --================================================================
        output_data_bus => memory_data_out
    );

    stack_pointer : genReg generic map(DATA_SIZE,4094) port map(
        dataIn => stack_pointer_in,
        writeEnable => is_stack_operation,
        clk => clk,
        rst => reset,
        dataOut => stack_pointer_out
    );

    extend_flags : SignExtend generic map(FLAGS_COUNT,DATA_SIZE) port map(
        Input => input_flags,
        Output => extended_flags
    );
end memory_stage_architecture;