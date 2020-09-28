LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ampel_tb IS
END ampel_tb;

ARCHITECTURE test OF ampel_tb IS
	COMPONENT ampel
		PORT (
			clk, r_neg : IN std_logic;
			gruen_h, rot_h, gelb_h, gruen_n, rot_n, gelb_n : OUT std_logic
		);
	END COMPONENT;

	SIGNAL clk, r_neg, gruen_h, rot_h, gelb_h, gruen_n, rot_n, gelb_n : std_logic;

BEGIN
	ampel_steuer : ampel PORT MAP(clk => clk, r_neg => r_neg, gruen_h => gruen_h, rot_h => rot_h, gelb_h => gelb_h, gruen_n => gruen_n, rot_n => rot_n, gelb_n => gelb_n);

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
		ASSERT false REPORT "Reached end of test";
		WAIT;
	END PROCESS;
END test;