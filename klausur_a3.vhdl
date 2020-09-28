LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY klausur_3a IS
    PORT (
        clk : IN std_logic;
        din : IN std_logic;
        rst : IN std_logic;
        dout : OUT std_logic
    );
END klausur_3a;

ARCHITECTURE Behavioral OF klausur_3a IS
    SIGNAL state, next_state : INTEGER;

BEGIN
    clk_process : PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            state <= 0;
        ELSIF rising_edge(clk) THEN
            state <= next_state;
        END IF;
    END PROCESS;

    transition_process : PROCESS (din, state)
    BEGIN
        next_state <= state;

        IF state = 0 AND din = '0' THEN
            next_state <= 0;
        ELSIF state = 0 AND din = '1' THEN
            next_state <= 1;
        ELSIF state = 1 AND din = '0' THEN
            next_state <= 0;
        ELSIF state = 1 AND din = '1' THEN
            next_state <= 2;
        ELSIF state = 2 AND din = '0' THEN
            next_state <= 0;
        ELSIF state = 2 AND din = '1' THEN
            next_state <= 1;
        END IF;
    END PROCESS;

    output_process : PROCESS (state)
    BEGIN
        IF state = 0 THEN
            dout <= 0;
        ELSIF state = 1 THEN
            dout <= 0;
        ELSIF state = 2 THEN
            dout <= 1;
        END IF;
    END PROCESS;
END ARCHITECTURE;