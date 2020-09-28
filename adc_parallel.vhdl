-- Aufgabe 1: Prioritaetsdecoder
-- Decoder entsprechend der Tabelle beim ADU
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adc_parallel IS
    PORT (
        inputVoltage : IN std_logic_vector(6 DOWNTO 0);
        outputVoltage : OUT std_logic_vector(2 DOWNTO 0)
    );
END adc_parallel;

ARCHITECTURE behave OF adc_parallel IS
BEGIN
    WITH inputVoltage SELECT
        outputVoltage <= "000" WHEN "0000000",
        "001" WHEN "0000001",
        "010" WHEN "0000011",
        "011" WHEN "0000111",
        "100" WHEN "0001111",
        "101" WHEN "0011111",
        "110" WHEN "0111111",
        "111" WHEN "1111111",
        "000" WHEN OTHERS;
END behave;