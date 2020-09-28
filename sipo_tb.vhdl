library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sipo_tb is
end sipo_tb;

architecture behave of sipo_tb is

component sipo
port (
    clk, clear : in std_logic;
    input_data: in std_logic;
    q : out std_logic_vector(3 downto 0)
);
end component;

-- inputs
signal clk,clear,input_data : std_logic; 

-- outputs
signal q : std_logic_vector(3 downto 0);


begin
-- Instantiate the unit
uut: sipo port map (
    q => q,
    clk => clk,
    clear => clear,
    input_data => input_data
);

-- stimulus process
stim_process: process
begin
clk <= '0';
clear <= '1';
input_data <= '0';
wait for 100 ns;
clk <= '1';
clear <= '1';
input_data <= '0';
wait for 100 ns;
clk <= '0';
clear <= '0';
input_data <= '0';
wait for 100 ns;
clk <= '1';
clear <= '0';
input_data <= '0';
wait for 100 ns;
clk <= '0';
input_data <= '1';
wait for 100 ns;
clk <= '1';
input_data <= '1';
wait for 100 ns;
clk <= '0';
input_data <= '0';
wait for 100 ns;
clk <= '1';
input_data <= '0';
wait for 100 ns;
clk <= '0';
input_data <= '0';
wait for 100 ns;
clk <= '1';
input_data <= '0';
wait for 100 ns;
clk <= '0';
input_data <= '0';
wait for 100 ns;
clk <= '1';
input_data <= '0';
wait for 100 ns;
clk <= '0';
input_data <= '0';
wait for 100 ns;
clk <= '1';
input_data <= '0';
wait for 100 ns;
wait;
end process;
end;
