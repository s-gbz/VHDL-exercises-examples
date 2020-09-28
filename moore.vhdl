LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY moore IS
    PORT (
        clk, reset, enable : IN std_logic;
        i : IN std_logic;
        o : OUT std_logic_vector(1 DOWNTO 0);
        s : OUT std_logic_vector(3 DOWNTO 0)
    );
END moore;

ARCHITECTURE behaviour OF moore IS
    TYPE moore_states IS
    (S00, S10, S20, S21, S30, S31, S40, S41, S42, S50);
    SIGNAL state, next_state : moore_states;

BEGIN
    transition : PROCESS (state, i)
    BEGIN
        -- avoid latching
        next_state <= state;

        CASE(state) IS
            WHEN S00 =>
            IF i = '0' THEN
                next_state <= S40;
            ELSIF i = '1' THEN
                next_state <= S10;
            END IF;

            WHEN S10 =>
            IF i = '0' THEN
                next_state <= S20;
            ELSIF i = '1' THEN
                next_state <= S30;
            END IF;

            WHEN S20 =>
            IF i = '0' THEN
                next_state <= S42;
            END IF;

            WHEN S21 =>
            IF i = '0' THEN
                next_state <= S42;
            END IF;

            WHEN S30 =>
            IF i = '0' THEN
                next_state <= S00;
            ELSIF i = '1' THEN
                next_state <= S31;
            END IF;

            WHEN S31 =>
            IF i = '0' THEN
                next_state <= S00;
            END IF;

            WHEN S40 =>
            IF i = '0' THEN
                next_state <= S41;
            ELSIF i = '1' THEN
                next_state <= S50;
            END IF;

            WHEN S41 =>
            IF i = '1' THEN
                next_state <= S50;
            END IF;

            WHEN S42 =>
            IF i = '1' THEN
                next_state <= S50;
            END IF;

            WHEN S50 =>
            IF i = '0' THEN
                next_state <= S21;
            ELSIF i = '1' THEN
                next_state <= S00;
            END IF;

            WHEN OTHERS =>
            next_state <= S00;
        END CASE;
    END PROCESS;

    state_memory : PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            state <= S00;
        ELSIF rising_edge(clk) THEN
            IF enable = '1' THEN
                state <= next_state;
            END IF;
        END IF;
    END PROCESS;

    output : PROCESS (state)
    BEGIN
        IF state = S00 THEN
            o <= "00";
            s <= "0000";
        ELSIF state = S10 THEN
            o <= "10";
            s <= "0001";
        ELSIF state = S20 THEN
            o <= "00";
            s <= "0010";
        ELSIF state = S21 THEN
            o <= "01";
            s <= "0011";
        ELSIF state = S30 THEN
            o <= "00";
            s <= "0100";
        ELSIF state = S31 THEN
            o <= "01";
            s <= "0101";
        ELSIF state = S40 THEN
            o <= "00";
            s <= "0110";
        ELSIF state = S41 THEN
            o <= "01";
            s <= "0111";
        ELSIF state = S42 THEN
            o <= "10";
            s <= "1000";
        ELSIF state = S50 THEN
            o <= "00";
            s <= "1001";
        END IF;
    END PROCESS;

END ARCHITECTURE;