LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY serial_in_parallel_out IS
    PORT (
        -- "port can't be assigned" ->
        -- aus diesem grund ist enable (= i) ein einzelnes bit
        clk, reset : IN std_logic;
        i : IN std_logic;
        o : OUT std_logic_vector(3 DOWNTO 0) -- to angebracht?
    );
END ENTITY;

ARCHITECTURE behaviour OF serial_in_parallel_out IS
    -- Schieberegister/-maske
    SIGNAL sequentialEnable : std_logic_vector(2 DOWNTO 0) := "000";
BEGIN
    PROCESS (clk, reset, i)
    BEGIN
        IF reset = '1' THEN
            sequentialEnable <= "000";
            o <= "0000";
        ELSIF rising_edge(clk) THEN
            IF i = '1' THEN
                sequentialEnable <= "001";
            END IF;

            CASE (sequentialEnable) IS
                WHEN "001" =>
                    sequentialEnable <= "010";
                    o <= "1000";
                WHEN "010" =>
                    sequentialEnable <= "011";
                    o <= "0100";
                WHEN "011" =>
                    sequentialEnable <= "100";
                    o <= "0010";
                WHEN "100" =>
                    sequentialEnable <= "000";
                    o <= "0001";
                WHEN OTHERS =>
                    -- o <= "1111";
            END CASE;
        END IF;
    END PROCESS;
END ARCHITECTURE;