LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY prioDecoder_tb IS
END prioDecoder_tb;

ARCHITECTURE test OF prioDecoder_tb IS
	COMPONENT prioDecoder
		PORT (
			Ein : IN std_logic_vector(6 DOWNTO 0);
			Aus : OUT std_logic_vector(2 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL Ein : std_logic_vector(6 DOWNTO 0) := "0000000";
	SIGNAL Aus : std_logic_vector(2 DOWNTO 0);

BEGIN
	prio_decoder : prioDecoder PORT MAP(Ein => Ein, Aus => Aus);

	PROCESS BEGIN
		Ein <= "0000000";
		WAIT FOR 1 ns;
		Ein <= "0000001";
		WAIT FOR 1 ns;
		Ein <= "0000011";
		WAIT FOR 1 ns;
		Ein <= "0000111";
		WAIT FOR 1 ns;
		Ein <= "0001111";
		WAIT FOR 1 ns;
		Ein <= "0011111";
		WAIT FOR 1 ns;
		Ein <= "0111111";
		WAIT FOR 1 ns;
		Ein <= "1111111";
		WAIT FOR 1 ns;

		ASSERT false REPORT "Reached end of test";
		WAIT;
	END PROCESS;
END test;