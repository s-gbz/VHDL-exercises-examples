LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ampel_tb IS
END ampel_tb;

ARCHITECTURE test OF ampel_tb IS
    COMPONENT ampel IS
        PORT (
            clk : IN std_logic;
            nReset : IN std_logic;
            rot_haupt, gelb_haupt, gruen_haupt : OUT std_logic;
            rot_neben, gelb_neben, gruen_neben : OUT std_logic
        );
    END COMPONENT;

    SIGNAL clk, nReset : std_logic;
    SIGNAL rot_haupt, gelb_haupt, gruen_haupt : std_logic;
    SIGNAL rot_neben, gelb_neben, gruen_neben : std_logic;

BEGIN
    ampel_pr : ampel PORT MAP(
        clk => clk, nReset => nReset
        rot_haupt => rot_haupt, gelb_haupt => gelb_haupt, gruen_haupt => gruen_haupt,
        rot_neben => rot_neben, gelb_neben => gelb_neben, gruen_neben => gruen_neben
    );

    -- counter_process : PROCESS (clk, nReset)
    -- BEGIN
    --     -- Der invertierte Reset wird getriggert sobald der Counter 1111 entspricht
    --     IF nReset = '0' THEN
    --         counter <= "0000";
    --     ELSIF rising_edge(clk) THEN
    --         -- increment counter on rising_edge
    --         counter <= counter + 1;
    --     END IF;
    -- END PROCESS;

    PROCESS BEGIN
        clk <= '0';
        r_neg <= '0';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '0';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '1';
        r_neg <= '1';
        WAIT FOR 1000 ms;
        clk <= '0';
        r_neg <= '1';
        WAIT;
    END PROCESS; -- identifier

END test;