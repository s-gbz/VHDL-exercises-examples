library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity systolic_cell_tb is
end systolic_cell_tb;

architecture test of systolic_cell_tb is
    component systolic_cell
    port
    (clk: in std_logic;
     reset_n: in std_logic;
     i_top: in signed(7 downto 0);
     i_left: in signed(7 downto 0);
     o_right: out signed(7 downto 0);
     o_bottom: out signed(7 downto 0);
     cell_out: out signed(15 downto 0)
    );
    end component;
    signal clk, reset_n : std_logic;
    signal i_top,i_left,o_right,o_bottom: signed(7 downto 0);
    signal cell_out: signed(15 downto 0);

begin
    uut: systolic_cell port map (clk => clk, reset_n => reset_n, i_top => i_top, i_left => i_left, o_right => o_right, o_bottom => o_bottom, cell_out => cell_out);
    process
    begin
	   clk <= '0';
	   reset_n <= '0';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '0';
	   wait for 10 ns; 
	   clk <= '0';
	   reset_n <= '1';
	   i_left <= "00000010";
	   i_top <= "00000011";
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   i_left <= "00000010";
	   i_top <= "00000011";
	   wait for 10 ns; 
	   clk <= '0';
	   reset_n <= '1';
	   i_left <= "00000010";
	   i_top <= "00000011";
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   i_left <= "00000010";
	   i_top <= "00000011";
	   wait for 10 ns; 
	   clk <= '0';
	   reset_n <= '1';
	   i_left <= "00000010";
	   i_top <= "00000011";
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   i_left <= "00000010";
	   i_top <= "00000011";
	   wait for 10 ns; 
    end process;
end test;

