LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ampel IS
    PORT (
        clk : IN std_logic;
        nReset : IN std_logic;
        rot_haupt, gelb_haupt, gruen_haupt : OUT std_logic;
        rot_neben, gelb_neben, gruen_neben : OUT std_logic
    );
END ampel;

ARCHITECTURE behaviour OF ampel IS
    -- zähler wird als signal angelegt
    SIGNAL counter : unsigned(3 DOWNTO 0) := "0000";

BEGIN
    counter_process : PROCESS (clk, nReset)
    BEGIN
        -- Der invertierte Reset wird getriggert sobald der Counter 1111 entspricht
        IF nReset = '0' THEN
            counter <= "0000";
        ELSIF rising_edge(clk) THEN
            -- increment counter on rising_edge
            counter <= counter + 1;
        END IF;
    END PROCESS;

    schaltwerk : PROCESS (counter)
    BEGIN
        CASE (counter) IS
            WHEN "0000" =>
                rot_haupt <= '1';
                gelb_haupt <= '0';
            WHEN "0111" =>
                gelb_haupt <= '1';
            WHEN "1000" =>
                rot_haupt <= '0';
                gelb_haupt <= '0';
                gruen_haupt <= '1';
            WHEN "1111" =>
                gelb_haupt <= '1';
                gruen_haupt <= '0';
            WHEN OTHERS =>
                counter <= "0000";
        END CASE;
    END PROCESS;

END behaviour;