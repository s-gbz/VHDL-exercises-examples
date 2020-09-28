LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adc_parallel_test IS
END adc_parallel_test;

ARCHITECTURE test OF adc_parallel_test IS
    COMPONENT adc_parallel IS
        PORT (
            inputVoltage : IN std_logic_vector(6 DOWNTO 0);
            outputVoltage : OUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL inputVoltage : std_logic_vector(6 DOWNTO 0);
    SIGNAL outputVoltage : std_logic_vector(2 DOWNTO 0);

BEGIN
    adc_parallel_pr : adc_parallel PORT MAP
        (inputVoltage => inputVoltage);

    PROCESS BEGIN
        inputVoltage <= "0000000";
        WAIT FOR 1 ns;
        inputVoltage <= "0000001";
        WAIT FOR 1 ns;
        inputVoltage <= "0000011";
        WAIT FOR 1 ns;
        inputVoltage <= "0000111";
        WAIT FOR 1 ns;
        inputVoltage <= "0001111";
        WAIT FOR 1 ns;
        inputVoltage <= "0011111";
        WAIT FOR 1 ns;
        inputVoltage <= "0111111";
        WAIT FOR 1 ns;
        inputVoltage <= "1111111";
        WAIT FOR 1 ns;

		-- ASSERT false REPORT "Reached end of test";
        wait;
    END PROCESS;
END test;