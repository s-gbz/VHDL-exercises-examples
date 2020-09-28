LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dac_parallel IS
    PORT (
        inputVoltage : IN std_logic_vector(2 DOWNTO 0);
        outputVoltage : OUT std_logic_vector(4 DOWNTO 0)
    );
END dac_parallel;

ARCHITECTURE behaviour OF dac_parallel IS
BEGIN
    WITH inputVoltage SELECT
        outputVoltage <= "00001" WHEN "000",
        "00010" WHEN "001",
        "00100" WHEN "010",
        "01000" WHEN "011",
        "10000" WHEN "100",
        "00000" WHEN OTHERS;
END behaviour;