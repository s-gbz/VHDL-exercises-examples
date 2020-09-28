LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sys_matrix_3x3_tb IS
END ENTITY;

ARCHITECTURE test OF sys_matrix_3x3_tb IS
    COMPONENT sys_matrix_3x3 IS PORT (
        clk, reset : IN std_logic;
        -- Eingabe ist SKALAR!
        -- Kein Array als Eingabe sondern
        -- EIN Input Pro Reihe
        a1, a2, a3, b1, b2, b3 : IN INTEGER;

        -- Ergebnismatrix wird mit je einem Feld definiert
        c11, c12, c13 : OUT INTEGER;
        c21, c22, c23 : OUT INTEGER;
        c31, c32, c33 : OUT INTEGER
        );
    END COMPONENT;

    SIGNAL clk, reset : std_logic;
    SIGNAL a1, a2, a3, b1, b2, b3 : INTEGER := 0;

BEGIN
    sys_matrix_3x3_test : sys_matrix_3x3 PORT MAP(
        clk => clk, reset => reset,
        a1 => a1, a2 => a2, a3 => a3,
        b1 => b1, b2 => b2, b3 => b3
    );
    PROCESS BEGIN
        clk <= '0';
        reset <= '1';
        WAIT FOR 10 fs;

        -- clk 1
        reset <= '0';
        clk <= '1';
        a1 <= 1;
        a2 <= 0;
        a3 <= 0;

        b1 <= 8;
        b2 <= 0;
        b3 <= 0;
        WAIT FOR 10 fs;

        clk <= '0';
        a1 <= 0;
        a2 <= 0;
        a3 <= 0;
        b1 <= 0;
        b2 <= 0;
        b3 <= 0;
        WAIT FOR 10 fs;

        -- clk 2
        clk <= '1';
        a1 <= 2;
        a2 <= 4;
        a3 <= 0;

        b1 <= 5;
        b2 <= 7;
        b3 <= 0;
        WAIT FOR 10 fs;

        clk <= '0';
        a1 <= 0;
        a2 <= 0;
        a3 <= 0;

        b1 <= 0;
        b2 <= 0;
        b3 <= 0;
        WAIT FOR 10 fs;

        clk <= '1';
        a1 <= 3;
        a2 <= 5;
        a3 <= 7;

        b1 <= 2;
        b2 <= 4;
        b3 <= 6;
        WAIT FOR 10 fs;

        clk <= '0';
        a1 <= 0;
        a2 <= 0;
        a3 <= 0;

        b1 <= 0;
        b2 <= 0;
        b3 <= 0;
        WAIT FOR 10 fs;

        clk <= '1';
        a1 <= 0;
        a2 <= 6;
        a3 <= 8;

        b1 <= 0;
        b2 <= 1;
        b3 <= 3;
        WAIT FOR 10 fs;

        clk <= '0';
        a1 <= 0;
        a2 <= 0;
        a3 <= 0;

        b1 <= 0;
        b2 <= 0;
        b3 <= 0;
        WAIT FOR 10 fs;

        clk <= '1';
        a1 <= 0;
        a2 <= 0;
        a3 <= 9;

        b1 <= 0;
        b2 <= 0;
        b3 <= 0;
        WAIT FOR 10 fs;

        clk <= '0';
        a1 <= 0;
        a2 <= 0;
        a3 <= 0;

        b1 <= 0;
        b2 <= 0;
        b3 <= 0;
        WAIT FOR 10 fs;

        clk <= '1';
        a1 <= 0;
        a2 <= 0;
        a3 <= 0;

        b1 <= 0;
        b2 <= 0;
        b3 <= 0;
        WAIT FOR 10 fs;

        clk <= '0';
        a1 <= 0;
        a2 <= 0;
        a3 <= 0;

        b1 <= 0;
        b2 <= 0;
        b3 <= 0;
        WAIT FOR 10 fs;
        wait;
    END PROCESS;

END ARCHITECTURE;