LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sys_zelle IS
    PORT (
        clk, reset : IN std_logic;
        links_in, oben_in : IN INTEGER;
        unten_out, rechts_out, ergebnis_out : OUT INTEGER
    );
END ENTITY;

ARCHITECTURE behaviour OF sys_zelle IS
    signal speicher: integer := 0;
BEGIN
    clocking : PROCESS (clk, reset)
    BEGIN
        IF (reset = '1') THEN
            speicher <= 0;
            ergebnis_out <= 0;
            unten_out <= 0; -- korrekt?
            rechts_out <= 0;-- korrekt?
        ELSIF (rising_edge(clk)) THEN
            speicher <= links_in * oben_in + speicher;
            rechts_out <= links_in;
            unten_out <= oben_in;
        END IF;
        ergebnis_out <= speicher;
    END PROCESS;
END ARCHITECTURE;