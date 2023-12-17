LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY forwarding_unit IS
    PORT (
        source_1_no_hazard : in std_logic_vector(31 downto 0);
        source_2_no_hazard : in std_logic_vector(31 downto 0);
        source_1_alu_result : in std_logic_vector(31 downto 0);
        source_2_alu_result : in std_logic_vector(31 downto 0);
        source_1_mem_result : in std_logic_vector(31 downto 0);
        source_2_mem_result : in std_logic_vector(31 downto 0);

        hazard_code : in std_logic_vector(3 downto 0);

        operand_1 : out std_logic_vector(31 downto 0);
        operand_2 : out std_logic_vector(31 downto 0)
    );
END forwarding_unit;
ARCHITECTURE forwarding_unit_architecture OF forwarding_unit IS
BEGIN
    operand_1 <= source_1_no_hazard WHEN hazard_code(3 downto 2) = "00" ELSE
                 source_1_alu_result WHEN hazard_code(3 downto 2) = "01" ELSE 
                 source_1_mem_result;
                 
    operand_2 <= source_2_no_hazard WHEN hazard_code(1 downto 0) = "00" ELSE
                 source_2_alu_result WHEN hazard_code(1 downto 0) = "01" ELSE 
                 source_2_mem_result;
END forwarding_unit_architecture;