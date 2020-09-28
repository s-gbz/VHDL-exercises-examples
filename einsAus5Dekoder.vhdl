-- Aufgabe 2: Eins-Aus-5-Dekoder
-- Decoder fuer 1aus5 bei ADU nach Parallelverfahren 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY einsAus5 IS
	PORT (
		Ein : IN std_logic_vector(2 DOWNTO 0);
		Aus : OUT std_logic_vector(4 DOWNTO 0));
END einsAus5;

ARCHITECTURE Verhalten OF einsAus5 IS
BEGIN
	WITH Ein SELECT
		Aus <= "00001" WHEN "000",
		"00010" WHEN "001",
		"00100" WHEN "010",
		"01000" WHEN "011",
		"10000" WHEN "100",
		"00000" WHEN OTHERS;
END Verhalten;