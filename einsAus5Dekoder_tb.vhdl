library ieee;
use ieee.std_logic_1164.all;

entity einsAus5Dekoder_tb is
end einsAus5Dekoder_tb;

architecture test of einsAus5Dekoder_tb is
    component einsAus5
        port
	(
	    Ein: in std_logic_vector(2 downto 0);
	    Aus: out std_logic_vector(4 downto 0)
	);
    end component;

    signal Ein : std_logic_vector(2 downto 0) := "000";
    signal Aus : std_logic_vector(4 downto 0);

begin
    eins_Aus5: einsAus5 port map (Ein => Ein, Aus => Aus);

    process begin
        Ein <= "000";
	wait for 1 ns;
	Ein <= "001";
	wait for 1 ns;
	Ein <= "010";
	wait for 1 ns;
	Ein <= "011";
	wait for 1 ns;
	Ein <= "100";
	wait for 1 ns;

	assert false report "Reached end of test";
	wait;
    end process;
end test;
