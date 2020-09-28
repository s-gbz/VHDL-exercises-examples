
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity systolic_array_tb is
end systolic_array_tb;

architecture test of systolic_array_tb is
    component systolic_array
    port
    (
       clk: in std_logic;
       reset_n: in std_logic;
       a0,a1,a2,b0,b1,b2 : in signed (7 downto 0);
       c00, c01, c02, c10, c11, c12, c20, c21, c22: out signed(15 downto 0)
    );
    end component;
    signal clk, reset_n : std_logic;
    signal a0,a1,a2,b0,b1,b2: signed(7 downto 0);
    signal c00,c01,c02,c10,c11,c12,c20,c21,c22: signed(15 downto 0);

begin
    uut: systolic_array port map (clk => clk, reset_n => reset_n, a0 => a0, a1 => a1, a2 => a2, b0 => b0, b1 => b1, b2 => b2,c00=>c00,c01=>c01,c02=>c02,c10=>c10,c11=>c11,c12=>c12,c20=>c20,c21=>c21,c22=>c22);
    process
    begin
	   clk <= '0';
	   reset_n <= '1';
	   a0 <= "00000000";
	   a1 <= "00000000";
	   a2 <= "00000000";
	   b0 <= "00000000";
	   b1 <= "00000000";
	   b2 <= "00000000";
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns;
	   clk <= '0';
	   reset_n <= '0';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '0';
	   wait for 10 ns;
	   clk <= '0';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '0';
	   wait for 10 ns;
	   clk <= '0';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '0';
	   wait for 10 ns;
	   clk <= '0';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '0';
	   wait for 10 ns;
	   clk <= '0';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '0';
	   wait for 10 ns;
	   clk <= '0';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '0';
	   wait for 10 ns;
	   clk <= '0';
	   reset_n <= '0';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '0';
	   wait for 10 ns; 
	   clk <= '0';
	   reset_n <= '1';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns; 
	   clk <= '0';
	   reset_n <= '1';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns; 
	   clk <= '0';
	   reset_n <= '1';
	   a0 <= "00000001"; -- a00 ist 1
	   a1 <= "00000000";
	   a2 <= "00000000";
	   b0 <= "00001000"; -- b00 ist 8
	   b1 <= "00000000";
	   b2 <= "00000000";
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns; 
	   clk <= '0';
	   reset_n <= '1';
	   a0 <= "00000010"; -- a01 ist 2
	   a1 <= "00000100"; -- a10 ist 4
	   a2 <= "00000000";
	   b0 <= "00000101"; -- b10 ist 5
	   b1 <= "00000111"; -- b01 ist 7
	   b2 <= "00000000";
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns; 
	   clk <= '0';
	   reset_n <= '1';
	   a0 <= "00000011"; -- a02 ist 3
	   a1 <= "00000101"; -- a11 ist 5
	   a2 <= "00000111"; -- a20 ist 7
	   b0 <= "00000010"; -- b20 ist 2
	   b1 <= "00000100"; -- b11 ist 4
	   b2 <= "00000110"; -- b02 ist 6
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns; 
	   clk <= '0';
	   reset_n <= '1';
	   a0 <= "00000000"; -- 0 
	   a1 <= "00000110"; -- a12 ist 6
	   a2 <= "00001000"; -- a21 ist 8
	   b0 <= "00000000"; -- 0
	   b1 <= "00000001"; -- b21 ist 1
	   b2 <= "00000011"; -- b12 ist 3
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns; 
	   clk <= '0';
	   reset_n <= '1';
	   a0 <= "00000000"; -- 0 
	   a1 <= "00000000"; -- 0
	   a2 <= "00001001"; -- a22 ist 9
	   b0 <= "00000000"; -- 0
	   b1 <= "00000000"; -- 0
	   b2 <= "00000001"; -- b22 ist 1 
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns;
	   clk <= '0';
	   reset_n <= '1';
	   a0 <= "00000000"; -- 0 
	   a1 <= "00000000"; -- 0
	   a2 <= "00000000"; -- 0
	   b0 <= "00000000"; -- 0
	   b1 <= "00000000"; -- 0
	   b2 <= "00000000"; -- 0
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns;
	   clk <= '0';
	   reset_n <= '1';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns;
	   clk <= '0';
	   reset_n <= '1';
	   wait for 10 ns;
	   clk <= '1';
	   reset_n <= '1';
	   wait for 10 ns;
    end process;
end test;

