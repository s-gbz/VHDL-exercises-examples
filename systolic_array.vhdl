library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity systolic_array is
    port
    (clk: in std_logic;
     reset_n: in std_logic;
     a0 : in signed (7 downto 0);
     a1 : in signed (7 downto 0);
     a2 : in signed (7 downto 0);
     b0 : in signed (7 downto 0);
     b1 : in signed (7 downto 0);
     b2 : in signed (7 downto 0);
     c00 : out signed (15 downto 0);
     c01 : out signed (15 downto 0);
     c02 : out signed (15 downto 0);
     c10 : out signed (15 downto 0);
     c11 : out signed (15 downto 0);
     c12 : out signed (15 downto 0);
     c20 : out signed (15 downto 0);
     c21 : out signed (15 downto 0);
     c22 : out signed (15 downto 0)
    );
end systolic_array;

architecture pipelined of systolic_array is

component systolic_cell is
port (
    clk: in std_logic;
    reset_n: in std_logic;
    i_top : in signed (7 downto 0);
    i_left: in signed (7 downto 0);
    o_right: out signed (7 downto 0);
    o_bottom: out signed (7 downto 0);
    cell_out: out signed (15 downto 0)
     );
end component;

signal c00right,c00bottom,c01right,c01bottom,c02right,c02bottom : signed(7 downto 0);
signal c10right,c10bottom,c11right,c11bottom,c12right,c12bottom : signed(7 downto 0);
signal c20right,c20bottom,c21right,c21bottom,c22right,c22bottom : signed(7 downto 0);

begin
	-- 1. Instanz der Zelle
	cell00: systolic_cell
	port map(
	clk,
	reset_n,
	b0,
	a0,
	c00right,
	c00bottom,
	c00
	);

	-- 2. Instanz der Zelle
	cell01: systolic_cell
	port map(
	clk,
	reset_n,
	b1,
	c00right,
	c01right,
	c01bottom,
	c01
	);

	-- 3. Instanz der Zelle
	cell02: systolic_cell
	port map(
	clk,
	reset_n,
	b2,
	c01right,
	c02right,
	c02bottom,
	c02
	);

	-- 4. Instanz der Zelle
	cell10: systolic_cell
	port map(
	clk,
	reset_n,
	c00bottom,
	a1,
	c10right,
	c10bottom,
	c10
	);

	-- 5. Instanz der Zelle
	cell11: systolic_cell
	port map(
	clk,
	reset_n,
	c01bottom,
	c10right,
	c11right,
	c11bottom,
	c11
	);

	-- 6. Instanz der Zelle
	cell12: systolic_cell
	port map(
	clk,
	reset_n,
	c02bottom,
	c11right,
	c12right,
	c12bottom,
	c12
	);

	-- 7. Instanz der Zelle
	cell20: systolic_cell
	port map(
	clk,
	reset_n,
	c10bottom,
	a2,
	c20right,
	c20bottom,
	c20
	);

	-- 8. Instanz der Zelle
	cell21: systolic_cell
	port map(
	clk,
	reset_n,
	c11bottom,
	c20right,
	c21right,
	c21bottom,
	c21
	);

	-- 9. Instanz der Zelle
	cell22: systolic_cell
	port map(
	clk,
	reset_n,
	c12bottom,
	c21right,
	c22right,
	c22bottom,
	c22
	);
end pipelined;
