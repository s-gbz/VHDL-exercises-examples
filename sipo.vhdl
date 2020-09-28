library ieee;
use ieee.std_logic_1164.all;
 
entity sipo is
 port(
 clk, clear : in std_logic;
 Input_Data: in std_logic;
 Q: out std_logic_vector(3 downto 0) );
end sipo;
 
architecture arch of sipo is

signal shift_reg : std_logic_vector(3 downto 0) := "0000";
 
begin
 
 process (clk)
 begin
 if clear = '1' then
     shift_reg <= "0000";
     Q <= shift_reg;
 elsif (CLK'event and CLK='1') then
     shift_reg(3 downto 1) <= shift_reg(2 downto 0);
     shift_reg(0) <= Input_Data;
     Q <= shift_reg;
 end if;
 end process;
end arch;
