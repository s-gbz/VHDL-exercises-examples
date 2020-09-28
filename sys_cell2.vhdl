LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sys_cell2 IS
    PORT (
        clk, reset : IN std_logic;
        i_top : IN signed (7 DOWNTO 0);
        i_left : IN signed (7 DOWNTO 0);
        o_right : OUT signed (7 DOWNTO 0);
        o_bottom : OUT signed (7 DOWNTO 0);
        cell_out : OUT signed (15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF sys_cell2 IS

BEGIN
    clocking : PROCESS (clk, reset)
    BEGIN
        IF (reset = '1') THEN
            speicher <= 0;
            o_bottom <= 0; -- korrekt?
            o_right <= 0;-- korrekt?
        ELSIF (rising_edge(clk)) THEN
            speicher <= links_in * oben_in + speicher;
            rechts_out <= links_in;
            unten_out <= oben_in;
        END IF;

    END ARCHITECTURE;