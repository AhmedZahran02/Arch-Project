library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity memory_tb is
end memory_tb;

architecture TB_ARCH of memory_tb is
    constant DATA_BUS_SIZE : integer := 32;
    constant ADDRESS_BUS_SIZE : integer := 12;

    signal input_data_bus_tb : std_logic_vector(DATA_BUS_SIZE - 1 downto 0);
    signal address_bus_tb : std_logic_vector(ADDRESS_BUS_SIZE - 1 downto 0);
    signal write_enable_tb, free_enable_tb, protect_enable_tb, clk_tb, reset_tb : std_logic;
    signal output_data_bus_tb : std_logic_vector(DATA_BUS_SIZE - 1 downto 0);

    -- Instantiate the memory entity
    component memory
        Generic (
            DATA_BUS_SIZE : integer := 32;
            ADDRESS_BUS_SIZE : integer := 12
        );
        Port (
            input_data_bus : in std_logic_vector(DATA_BUS_SIZE - 1 downto 0);
            address_bus : in std_logic_vector(ADDRESS_BUS_SIZE - 1 downto 0);
            write_enable : in std_logic;
            free_enable : in std_logic;
            protect_enable : in std_logic;
            clk : in std_logic;
            reset : in std_logic;
            output_data_bus : out std_logic_vector(DATA_BUS_SIZE - 1 downto 0)
        );
    end component;

begin
    -- Instantiate the memory entity
    UUT: memory
        Generic Map (
            DATA_BUS_SIZE => DATA_BUS_SIZE,
            ADDRESS_BUS_SIZE => ADDRESS_BUS_SIZE
        )
        Port Map (
            input_data_bus => input_data_bus_tb,
            address_bus => address_bus_tb,
            write_enable => write_enable_tb,
            free_enable => free_enable_tb,
            protect_enable => protect_enable_tb,
            clk => clk_tb,
            reset => reset_tb,
            output_data_bus => output_data_bus_tb
        );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Initialize inputs
        input_data_bus_tb <= (others => '0');
        address_bus_tb <= (others => '0');
        write_enable_tb <= '0';
        free_enable_tb <= '0';
        protect_enable_tb <= '0';
        reset_tb <= '1';

        wait for 11 ns;

        reset_tb <= '0';  -- De-assert reset
        wait for 10 ns;

        -- Test case 1: Write data

        input_data_bus_tb <= "10101010101010101010101010101010";
        address_bus_tb <= "010101010101";
        write_enable_tb <= '1';
        wait for 10 ns;
        assert (output_data_bus_tb = "10101010101010101010101010101010") report "error test case 1" severity error;

        write_enable_tb <= '0';
        wait for 10 ns;

        -- Test case 2: disable write and add data on input data bus
        input_data_bus_tb <= "10101010101010101000100010001010";
        address_bus_tb <= "010101010101";
        wait for 10 ns;
        assert (output_data_bus_tb = "10101010101010101010101010101010") report "error test case 2" severity error;

        -- Test case 3: protecting address
        input_data_bus_tb <= "10101010101010101000100010001010";
	    protect_enable_tb <= '1';
        address_bus_tb <= "010101010101";
        wait for 10 ns;
        assert (output_data_bus_tb = "10101010101010101010101010101010") report "error test case 3" severity error;

	
	-- Test case 4: trying to write to protected memory location
	    protect_enable_tb <= '0';
	    write_enable_tb <= '1';
        input_data_bus_tb <= "10101010101010101000100010001010";
        address_bus_tb <= "010101010101";
        wait for 10 ns;
        assert (output_data_bus_tb = "10101010101010101010101010101010") report "error test case 4" severity error;

        -- Test case 5: freeing address
        input_data_bus_tb <= "10101010101010101000100010001010";
	    write_enable_tb <= '0';
	    free_enable_tb <= '1';
        address_bus_tb <= "010101010101";
        wait for 10 ns;
        assert (output_data_bus_tb = "10101010101010101010101010101010") report "error test case 5" severity error;

        -- Test case 6: writing to a freed memory location
        input_data_bus_tb <= "10101010101010101000100010001010";
	    write_enable_tb <= '1';
	    free_enable_tb <= '0';
        address_bus_tb <= "010101010101";
        wait for 10 ns;
        assert (output_data_bus_tb = "10101010101010101000100010001010") report "error test case 6" severity error;

        wait;
    end process stimulus_process;


end TB_ARCH;
