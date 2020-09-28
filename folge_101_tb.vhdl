LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY folge_101_tb IS
END ENTITY;

ARCHITECTURE test OF folge_101_tb IS
    COMPONENT folge_101 IS PORT (
        clk, reset, enable, i : IN std_logic;
        o : OUT std_logic
        );
    END COMPONENT;

    SIGNAL clk, reset, enable, i : std_logic;
BEGIN
    folge_101_test : folge_101 PORT MAP(
        clk => clk, reset => reset, enable => enable, i => i
    );

    PROCESS BEGIN
        reset <= '1';
        clk <= '0';
        enable <= '0';
        i <= '0';
        WAIT FOR 10 fs;

        -- 1
        reset <= '0';
        clk <= '1';
        enable <= '1';
        i <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- 1
        clk <= '1';
        i <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- 1
        clk <= '1';
        i <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- 0
        clk <= '1';
        i <= '0';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- 1
        clk <= '1';
        i <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- 1
        -- clk <= '1';
        -- i <= '1';
        -- WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- 0
        clk <= '1';
        i <= '0';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- 1
        clk <= '1';
        i <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        WAIT;
    END PROCESS;
END ARCHITECTURE;