LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY folge_101 IS PORT (
    clk, reset, enable, i : IN std_logic;
    o : OUT std_logic
);
END ENTITY;

ARCHITECTURE behaviour OF folge_101 IS
    SIGNAL state, next_state : INTEGER := 0;
BEGIN

    clk_process : PROCESS (clk, reset, enable)
    BEGIN
        IF reset = '1' THEN
            state <= 0;
        ELSIF rising_edge(clk) AND enable = '1' THEN
            state <= next_state;
        END IF;
    END PROCESS;

    transition_and_output_logic : PROCESS (state, i)
    BEGIN
        -- muss im transition prozess sein!
        next_state <= state;

        IF state = 0 AND i = '0' THEN
            next_state <= 0;
            o <= '0';
        ELSIF state = 0 AND i = '1' THEN
            next_state <= 1;
            o <= '0';
        ELSIF state = 1 AND i = '0' THEN
            next_state <= 2;
            o <= '0';
        ELSIF state = 1 AND i = '1' THEN
            next_state <= 1;
            o <= '0';
        ELSIF state = 2 AND i = '0' THEN
            next_state <= 0;
            o <= '0';
        ELSIF state = 2 AND i = '1' THEN
            next_state <= 0;
            o <= '1';
        END IF;
    END PROCESS;

END ARCHITECTURE;