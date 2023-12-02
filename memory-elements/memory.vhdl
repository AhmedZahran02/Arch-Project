library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

entity memory is
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
end memory;

architecture memory_architecture of memory is
    TYPE ram_type IS ARRAY(0 TO 4095) of STD_LOGIC_VECTOR(15 downto 0); -- 2^12 address location * 16 bit data
    signal ram : ram_type;
    signal protect_bit : std_logic_vector (4095 downto 0); -- 2^12 address location * bit protected 
    signal next_address : std_logic_vector(11 downto 0);
begin
    next_address <= std_logic_vector(unsigned(address_bus) + to_unsigned(1, address_bus'length)); -- next address = current address + 1

    process(clk,reset)
    begin
        if reset = '1' then 
            ram <= (others => (others =>'0'));
            protect_bit <= (others => '0');
        elsif rising_edge(clk) then
            if write_enable = '1' then 

                if protect_bit(to_integer(unsigned(address_bus))) = '0' then
                    ram(to_integer(unsigned(address_bus))) <= input_data_bus(15 downto 0);
                end if;
        
                if extra_address = '1' and protect_bit(to_integer(unsigned(next_address))) = '0' then
                    ram(to_integer(unsigned(next_address))) <= input_data_bus(31 downto 16);
                end if;

            elsif protect_enable = '1' then
                protect_bit(to_integer(unsigned(address_bus))) <= '1';

                if extra_address = '1' then
                    protect_bit(to_integer(unsigned(next_address))) <= '1';
                end if;
            
            elsif free_enable = '1' then
                protect_bit(to_integer(unsigned(address_bus))) <= '0';
                if extra_address = '1' then
                    protect_bit(to_integer(unsigned(next_address))) <= '0';
                end if;
            end if;
        end if;

    end process;

    output_data_bus <= (others => '0') when reset = '1' else
                       std_logic_vector(to_unsigned(0, 16)) & ram(to_integer(unsigned(address_bus))) when extra_address = '0' else
                       ram(to_integer(unsigned(next_address))) & ram(to_integer(unsigned(address_bus)));
    
end memory_architecture;