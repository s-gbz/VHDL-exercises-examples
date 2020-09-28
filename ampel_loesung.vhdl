LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ampel IS PORT (
    clk, r_neg : IN std_logic; -- r_neg = reset nicht
    gruen_h, rot_h, gelb_h, gruen_n, rot_n, gelb_n : OUT std_logic);
END ampel;

ARCHITECTURE verhalten OF ampel IS -- Architektur mit 2 Prozessen
    SIGNAL zaehl : unsigned(3 DOWNTO 0); -- interner Zaehler
BEGIN
    zaehler : PROCESS (r_neg, clk) -- Prozess zur Modellierung des Zaehlers
    BEGIN
        IF r_neg = '0' THEN
            zaehl <= "0000"; -- asynchroner Reset
        ELSIF (clk'event AND clk = '1') THEN
            zaehl <= zaehl + 1;
        END IF;
    END PROCESS zaehler;

    ausgabe : PROCESS (zaehl) -- Prozess fuer die Ausgabe
    BEGIN
        IF (zaehl < "0111") THEN
            gruen_h <= '1';
            rot_h <= '0';
            gelb_h <= '0';
            gruen_n <= '0';
            rot_n <= '1';
            gelb_n <= '0';
        ELSIF (zaehl = "0111") THEN
            gruen_h <= '0';
            rot_h <= '0';
            gelb_h <= '1';
            gruen_n <= '0';
            rot_n <= '1';
            gelb_n <= '0';
        ELSIF (zaehl = "1000") THEN
            gruen_h <= '0';
            rot_h <= '1';
            gelb_h <= '0';
            gruen_n <= '0';
            rot_n <= '1';
            gelb_n <= '0';
        ELSIF (zaehl = "1001") THEN
            gruen_h <= '0';
            rot_h <= '1';
            gelb_h <= '0';
            gruen_n <= '0';
            rot_n <= '1';
            gelb_n <= '1';
        ELSIF (zaehl > "1001" AND zaehl < "1101") THEN
            gruen_h <= '0';
            rot_h <= '1';
            gelb_h <= '0';
            gruen_n <= '1';
            rot_n <= '0';
            gelb_n <= '0';
        ELSIF (zaehl = "1101") THEN
            gruen_h <= '0';
            rot_h <= '1';
            gelb_h <= '0';
            gruen_n <= '0';
            rot_n <= '0';
            gelb_n <= '1';
        ELSIF (zaehl = "1110") THEN
            gruen_h <= '0';
            rot_h <= '1';
            gelb_h <= '0';
            gruen_n <= '0';
            rot_n <= '1';
            gelb_n <= '0';
        ELSIF (zaehl = "1111") THEN
            gruen_h <= '0';
            rot_h <= '1';
            gelb_h <= '1';
            gruen_n <= '0';
            rot_n <= '1';
            gelb_n <= '0';
        END IF;
    END PROCESS ausgabe;
END verhalten;