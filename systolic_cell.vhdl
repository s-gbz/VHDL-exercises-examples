LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY systolic_cell IS
    PORT (
        clk : IN std_logic;
        reset_n : IN std_logic;
        i_top : IN signed(7 DOWNTO 0);
        i_left : IN signed(7 DOWNTO 0);
        o_right : OUT signed(7 DOWNTO 0);
        o_bottom : OUT signed(7 DOWNTO 0);
        cell_out : OUT signed(15 DOWNTO 0)
    );
END systolic_cell;

ARCHITECTURE pipelined OF systolic_cell IS
    SIGNAL store : signed(15 DOWNTO 0);
BEGIN
    P1 : PROCESS (clk, reset_n)
    BEGIN
        IF (reset_n = '1') THEN -- now implementing asynchronous reset
            IF (clk'event AND clk = '1') THEN
                store <= store + i_left * i_top;
                o_right <= i_left;
                o_bottom <= i_top;
            END IF;
        ELSE
            o_right <= "00000000";
            o_bottom <= "00000000";
            cell_out <= "0000000000000000";
            store <= "0000000000000000";
        END IF;
        cell_out <= store;
    END PROCESS P1;
END pipelined;