LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY moore_tb IS
END moore_tb;

ARCHITECTURE test OF moore_tb IS
    COMPONENT moore IS
        PORT (
            clk, reset, enable : IN std_logic;
            i : IN std_logic;
            o : OUT std_logic_vector(1 DOWNTO 0);
            s : OUT std_logic_vector(3 DOWNTO 0)
        );
    END COMPONENT;

    TYPE moore_states IS
    (S00, S10, S20, S21, S30, S31, S40, S41, S42, S50);
    SIGNAL state, next_state : moore_states;
    SIGNAL clk, reset, enable, i : std_logic;
    SIGNAL o : std_logic_vector(1 DOWNTO 0);
    SIGNAL s : std_logic_vector(3 DOWNTO 0);
BEGIN
    moore_test : moore PORT MAP
    (
        clk => clk, reset => reset, enable => enable,
        i => i, o => o, s => s);

    PROCESS BEGIN
        -- initial initialization - set reset to 0 after
        -- state 00
        reset <= '1';
        reset <= '0';
        clk <= '0';
        enable <= '0';
        i <= '0'; -- must be initialized to transition properly!
        i <= '1';
        WAIT FOR 10 fs;

        -- perma enable clock and  - doesn't work?!
        -- state 10
        clk <= '1';
        enable <= '1';
        i <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- state 30
        clk <= '1';
        i <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- state 31
        clk <= '1';
        i <= '0';
        WAIT FOR 50 fs;

        -- clk <= '1';
        i <= '1';
        WAIT FOR 50 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- state 00
        clk <= '1';
        WAIT FOR 10 fs;
        
        WAIT;

    END PROCESS;
END ARCHITECTURE;