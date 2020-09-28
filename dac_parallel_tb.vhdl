LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dac_parallel_test IS
END dac_parallel_test;

ARCHITECTURE test OF dac_parallel_test IS
    COMPONENT dac_parallel IS
        PORT (
            inputVoltage : IN std_logic_vector(2 DOWNTO 0);
            outputVoltage : OUT std_logic_vector(4 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL inputVoltage : std_logic_vector(2 DOWNTO 0);
    SIGNAL outputVoltage : std_logic_vector(4 DOWNTO 0);

BEGIN
    dac_parallel_tb : dac_parallel PORT MAP
        (inputVoltage => inputVoltage, outputVoltage => outputVoltage);

    PROCESS BEGIN
        inputVoltage <= "000";
        WAIT FOR 1 fs;
        inputVoltage <= "001";
        WAIT FOR 1 fs;
        inputVoltage <= "010";
        WAIT FOR 1 fs;
        inputVoltage <= "011";
        WAIT FOR 1 fs;
        inputVoltage <= "100";
        WAIT FOR 1 fs;
        WAIT;
    END PROCESS;
END test;