LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sys_zelle_tb IS
END ENTITY;

ARCHITECTURE test OF sys_zelle_tb IS
    COMPONENT sys_zelle IS PORT (
        clk, reset : IN std_logic;
        links_in, oben_in : IN INTEGER;
        unten_out, rechts_out, ergebnis_out : OUT INTEGER
        );
    END COMPONENT;

    SIGNAL clk, reset : std_logic;
    SIGNAL links_in, oben_in : INTEGER;

BEGIN
    sys_zelle_1 : sys_zelle PORT MAP(
        clk => clk, reset => reset, links_in => links_in, oben_in => oben_in
    );

    PROCESS BEGIN
    clk <= '0';
    reset <= '1';
    wait for 10 fs;

    reset <= '0';
    clk <= '1';
    links_in <= 2;
    oben_in <= 2;
    wait for 10 fs;

    clk <= '0';
    wait for 10 fs;

    clk <= '1';
    wait for 10 fs;

    clk <= '0';
    wait for 10 fs;

    wait;
    END PROCESS;
END ARCHITECTURE;