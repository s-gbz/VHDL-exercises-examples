library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Moore_Feli is 
generic (    clkPeriod : time);
port (
    ein : in std_logic;
    aus : out std_logic_vector(1 downto 0);
    zustand : out std_logic_vector(3 downto 0);
    
    clk : in std_logic;
    nRst: in std_logic);
end entity;

architecture verhalten of Moore_Feli is 

type t_state is (Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7, Z8, Z9); 
signal state: t_state;
begin 

process (clk) 
    begin
        if rising_edge(clk) then
            if nRst = '0' then
                zustand <= "0000";
                aus <= "00";
            else 
                if state = Z0 then
                    aus <= "00";
                    if ein = '0' then 
                        state <= Z6;
                        zustand <= "0110";
                    elsif ein = '1' then
                        state <= Z1;
                        zustand <= "0001";
                    end if;

                elsif state = Z1 then
                    aus <= "00";
                    if ein = '0' then
                        state <= Z2;
                        zustand <= "0010";
                    elsif ein = '1' then
                        state <= Z4;
                        zustand <= "0100";
                    end if;

                elsif state = Z2 then
                    aus <= "00";
                    if ein = '0' then
                        state <= Z8;
                        zustand <= "1000";
                    elsif ein = '1' then
                        state <= Z0;
                        zustand <= "0000";
                    end if;

                elsif state = Z3 then
                    aus <= "01";
                    if ein = '0' then
                        state <= Z8;
                        zustand <= "1000";
                    elsif ein = '1' then
                        state <= Z0;
                        zustand <= "0000";
                    end if;

                elsif state = Z4 then
                    aus <= "00";
                    if ein = '0' then
                        state <= Z0;
                        zustand <= "0000";
                    elsif ein = '1' then
                        state <= Z5;
                        zustand <= "0101";
                    end if;

                elsif state = Z5 then
                    aus <= "01";
                    if ein = '0' then 
                        state <= Z0;
                        zustand <= "0000";
                    elsif ein = '1' then
                        state <= Z5;
                        zustand <= "0101";
                    end if;

                elsif state = Z6 then
                    aus <= "00";
                    if ein = '0' then
                        state <= Z7;
                        zustand <= "0111";
                    elsif ein = '1' then
                        state <= Z9;
                        zustand <= "1001";
                    end if;

                elsif state = Z7 then
                    aus <= "01";
                    if ein = '0' then 
                        state <= Z7;
                        zustand <= "0111"; 
                    elsif ein = '1' then
                        state <= Z9;
                        zustand <= "1001";
                    end if;

                elsif state = Z8 then
                    aus <= "10";
                    if ein = '0' then 
                        state <= Z7;
                        zustand <= "0111";
                    elsif ein = '1' then
                        state <= Z9;
                        zustand <= "1001";
                    end if;

                elsif state = Z9 then
                    aus <= "00";
                    if ein = '0' then
                        state <= Z3;
                        zustand <= "0011";
                    elsif ein = '1' then
                        state <= Z0;
                        zustand <= "0000";
                    end if;

                else aus <= "XX";
                end if;
            end if;
        end if;
    end process;
end architecture;
