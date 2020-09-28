LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY mealy_tb IS
END mealy_tb;

ARCHITECTURE test OF mealy_tb IS
    COMPONENT mealy IS PORT (
        clk, reset, enable : IN std_logic;
        i : IN INTEGER;
        o : OUT std_logic_vector(1 DOWNTO 0));
    END COMPONENT;

    SIGNAL clk, reset, enable : std_logic;
    SIGNAL o : std_logic_vector(1 DOWNTO 0);
    -- SIGNAL i, state, next_state : INTEGER;
    SIGNAL i : INTEGER;

BEGIN
    mealy_test : mealy PORT MAP(
        clk => clk, reset => reset, enable => enable, o => o, i => i
    );
    -- state => state, next_state => next_state NICHT NOETIG, weil nicht Teil des Interfaces
    -- Ist auch klar. Der State soll durch die Maschine bestimmt werden
    PROCESS BEGIN
        -- initialization
        -- state 0 -- o: 00
        clk <= '0';
        enable <= '0';
        reset <= '1';
        i <= 1;
        WAIT FOR 10 fs;

        -- state 1 -- o: 00
        reset <= '0';
        clk <= '1';
        enable <= '1';
        i <= 0;
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- state 2 -- o: 00
        clk <= '1';
        i <= 0;
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- state 4 -- o: 10
        clk <= '1';
        i <= 0;
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- state 4 -- o: 01
        clk <= '1';
        i <= 1;
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- state 5 -- o: 00
        clk <= '1';
        i <= 1;
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- state 0 -- o: 00
        clk <= '1';
        WAIT FOR 10 fs;

        WAIT;
    END PROCESS;
END test;