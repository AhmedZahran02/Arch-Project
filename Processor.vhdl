library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity processor is
    Port (
            instruction_memory_data : in std_logic_vector(15 downto 0);
            instruction_memory_address : out std_logic_vector(11 downto 0);

            data_memory_data : in std_logic_vector(31 downto 0);
            data_memory_address : out std_logic_vector(11 downto 0);

            port_in : in std_logic_vector(31 downto 0);
            port_out : out std_logic_vector(31 downto 0)ك

            interrupt_signal : in std_logic;
            reset_signal : in std_logic;
        
        );
end processor;

architecture arch of processor is
begin
    
end arch;