LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY sys_matrix_3x3 IS
    PORT (
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
END ENTITY;

ARCHITECTURE behaviour OF sys_matrix_3x3 IS
    -- Diese Definition ist NICHT nur auf Testbenches beschränkt
    COMPONENT sys_zelle IS PORT (
        clk, reset : IN std_logic;
        links_in, oben_in : IN INTEGER;
        unten_out, rechts_out, ergebnis_out : OUT INTEGER
        );
    END COMPONENT;

        -- Ausgang jeder Zelle wird als Signal definiert
SIGNAL c11rechts, c11unten, c12rechts, c12unten, c13rechts, c13unten : integer := 0;
SIGNAL c21rechts, c21unten, c22rechts, c22unten, c23rechts, c23unten : integer := 0;
SIGNAL c31rechts, c31unten, c32rechts, c32unten, c33rechts, c33unten : integer := 0;

BEGIN
    sys_zelle_11 : sys_zelle PORT MAP(
        clk => clk, reset => reset,
        links_in => a1, oben_in => b1,
        unten_out => c11unten, rechts_out => c11rechts, 
        ergebnis_out => c11
    );

    sys_zelle_12 : sys_zelle PORT MAP(
        clk => clk, reset => reset,
        links_in => c11rechts, oben_in => b2,
        unten_out => c12unten, rechts_out => c12rechts, 
        ergebnis_out => c12
    );

    sys_zelle_13 : sys_zelle PORT MAP(
        clk => clk, reset => reset,
        links_in => c12rechts, oben_in => b3,
        unten_out => c13unten, rechts_out => c13rechts, 
        ergebnis_out => c13
    );

    sys_zelle_21 : sys_zelle PORT MAP(
        clk => clk, reset => reset,
        links_in => a2, oben_in => c11unten,
        unten_out => c21unten, rechts_out => c21rechts, 
        ergebnis_out => c21
    );

    sys_zelle_22 : sys_zelle PORT MAP(
        clk => clk, reset => reset,
        links_in => c21rechts, oben_in => c12unten,
        unten_out => c22unten, rechts_out => c22rechts, 
        ergebnis_out => c22
    );

    sys_zelle_23 : sys_zelle PORT MAP(
        clk => clk, reset => reset,
        links_in => c22rechts, oben_in => c13unten,
        unten_out => c23unten, rechts_out => c23rechts, 
        ergebnis_out => c23
    );

    sys_zelle_31 : sys_zelle PORT MAP(
        clk => clk, reset => reset,
        links_in => a3, oben_in => c21unten,
        unten_out => c31unten, rechts_out => c31rechts, 
        ergebnis_out => c31
    );

    sys_zelle_32 : sys_zelle PORT MAP(
        clk => clk, reset => reset,
        links_in => c31rechts, oben_in => c22unten,
        unten_out => c32unten, rechts_out => c32rechts, 
        ergebnis_out => c32
    );

    sys_zelle_33 : sys_zelle PORT MAP(
        clk => clk, reset => reset,
        links_in => c32rechts, oben_in => c23unten,
        unten_out => c33unten, rechts_out => c33rechts, 
        ergebnis_out => c33
    );
END ARCHITECTURE;