LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY bcd_7segment IS
    PORT (
        BCDin : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Seven_Segment : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END bcd_7segment;

ARCHITECTURE Behavioral OF bcd_7segment IS
BEGIN
    PROCESS (BCDin)
    BEGIN
        IF BCDin = "0000" THEN
            Seven_Segment <= "0000000";
        ELSIF BCDin = "0001" THEN
            Seven_Segment <= "0000110";
        ELSIF BCDin = "0010" THEN
            Seven_Segment <= "1011011";
        ELSIF BCDin = "0011" THEN
            Seven_Segment <= "1001111";
        ELSIF BCDin = "0100" THEN
            Seven_Segment <= "1100110";
        ELSIF BCDin = "0101" THEN
            Seven_Segment <= "1101101";
        ELSIF BCDin = "0110" THEN
            Seven_Segment <= "1111101";
        ELSIF BCDin = "0111" THEN
            Seven_Segment <= "0000111";
        ELSIF BCDin = "1000" THEN
            Seven_Segment <= "1111111";
        ELSIF BCDin = "1001" THEN
            Seven_Segment <= "1101111";
        ELSIF BCDin = "1010" THEN
            Seven_Segment <= "1110111";
        ELSIF BCDin = "1011" THEN
            Seven_Segment <= "0111000";
        ELSIF BCDin = "1100" THEN
            Seven_Segment <= "1011000";
        ELSIF BCDin = "1101" THEN
            Seven_Segment <= "1011110";
        ELSIF BCDin = "1110" THEN
            Seven_Segment <= "1111001";
        ELSIF BCDin = "1111" THEN
            Seven_Segment <= "1110001";
        END IF;
    END PROCESS;
END ARCHITECTURE;