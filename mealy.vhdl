LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mealy IS
    PORT (
        clk, reset, enable : IN std_logic;
        i : IN INTEGER;
        o : OUT std_logic_vector(1 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF mealy IS

    SIGNAL state, next_state : INTEGER;

BEGIN
    state_memory : PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            state <= 0;
        ELSIF rising_edge(clk) THEN
            IF enable = '1' THEN
                state <= next_state;
            END IF;
        END IF;
    END PROCESS;

    transition : PROCESS (state, i)
    BEGIN
        next_state <= state;

        IF state = 0 AND i = 0 THEN
            next_state <= 4;
        ELSIF state = 0 AND i = 1 THEN
            next_state <= 1;
        ELSIF state = 1 AND i = 0 THEN
            next_state <= 2;
        ELSIF state = 1 AND i = 1 THEN
            next_state <= 3;
        ELSIF state = 2 AND i = 0 THEN
            next_state <= 4;
        ELSIF state = 2 AND i = 1 THEN
            next_state <= 1;
        ELSIF state = 3 AND i = 0 THEN
            next_state <= 0;
        ELSIF state = 3 AND i = 1 THEN
            next_state <= 3;
        ELSIF state = 4 AND i = 0 THEN
            next_state <= 4;
        ELSIF state = 4 AND i = 1 THEN
            next_state <= 5;
        ELSIF state = 5 AND i = 0 THEN
            next_state <= 2;
        ELSIF state = 5 AND i = 1 THEN
            next_state <= 0;
            -- hier darf kein ELSE sein! Ansonsten folgt "unresolved signal"
        END IF;
    END PROCESS;

    output : PROCESS (state, i)
    BEGIN
        IF state = 0 AND i = 0 THEN
            o <= "00";
        ELSIF state = 0 AND i = 1 THEN
            o <= "00";
        ELSIF state = 1 AND i = 0 THEN
            o <= "00";
        ELSIF state = 1 AND i = 1 THEN
            o <= "00";
        ELSIF state = 2 AND i = 0 THEN
            o <= "10";
        ELSIF state = 2 AND i = 1 THEN
            o <= "00";
        ELSIF state = 3 AND i = 0 THEN
            o <= "00";
        ELSIF state = 3 AND i = 1 THEN
            o <= "01";
        ELSIF state = 4 AND i = 0 THEN
            o <= "01";
        ELSIF state = 4 AND i = 1 THEN
            o <= "00";
        ELSIF state = 5 AND i = 0 THEN
            o <= "01";
        ELSIF state = 5 AND i = 1 THEN
            o <= "00";
        ELSE
            o <= "00";
        END IF;
    END PROCESS;

END ARCHITECTURE;