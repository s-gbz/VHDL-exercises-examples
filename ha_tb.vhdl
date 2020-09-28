LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ha_tb IS
END ha_tb;

ARCHITECTURE test OF ha_tb IS
	COMPONENT ha
		PORT (
			a : IN std_ulogic;
			b : IN std_ulogic;
			o : OUT std_ulogic;
			c : OUT std_ulogic
		);
	END COMPONENT;

	SIGNAL a, b, o, c : std_ulogic;
BEGIN
	half_adder : ha PORT MAP
		(a => a, b => b, o => o, c => c);

	PROCESS BEGIN
		a <= 'X';
		b <= 'X';
		WAIT FOR 1 ns;
		a <= '0';
		b <= '0';
		WAIT FOR 1 ns;
		a <= '0';
		b <= '1';
		WAIT FOR 1 ns;
		a <= '1';
		b <= '0';
		WAIT FOR 1 ns;
		a <= '1';
		b <= '1';
		WAIT FOR 1 ns;

		ASSERT false REPORT "Reached end of test";
		WAIT;
	END PROCESS;
END test;