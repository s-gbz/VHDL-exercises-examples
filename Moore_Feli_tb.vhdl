library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Moore_Feli_tb is
end entity;

architecture verhalten_tb of Moore_Feli_tb is 
-- Abschnitt 1: Deklaration der Signale

constant clkPeriod : time := 20 ns; 

signal eintb : std_logic;
signal austb : std_logic_vector(1 downto 0);
signal zustand : std_logic_vector(3 downto 0);

signal clk : std_logic := '1';
signal nRst : std_logic :='0';

-- Abschnitt 2: Zuordnung der Signale zu den Modellsignalen mit Generic Map und Port Map
begin 
UUT: entity work.Moore_Feli(verhalten)
generic map
(
    clkPeriod => clkPeriod
)

port map(
    ein => eintb,
    aus => austb,
    zustand => zustand,

    clk => clk,
    nRst => nRst
);

-- Abschnitt 3: Stimuli
clk <= not clk after clkPeriod / 2 ; 

process
begin
    wait until rising_edge(clk); 
    nRst <= '1';
    wait;
end process;

process(clk) 
variable counter : integer := 1; 
begin
    if rising_edge(clk) then
        if counter = 1 or counter = 3 or counter = 4 or counter = 5 or counter = 7 or counter = 8 or counter = 9 or counter = 10 or counter = 12 or counter = 17 or counter = 19 or counter = 22 or counter = 25 or counter = 26 or counter = 28 then
            eintb <= '1';
            counter := counter + 1;
        elsif counter = 2 or counter = 6 or  counter = 11 or counter = 1 or counter = 4 or counter = 13 or counter = 14 or counter = 15 or counter = 16 or counter = 18 or counter = 20 or counter = 21 or counter = 23 or counter = 24 or counter = 27 then
            eintb <= '0';
            counter := counter + 1;
        end if;
    end if;   
end process;
end architecture;
