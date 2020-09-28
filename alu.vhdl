LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY alu IS
    PORT (
        inp_a : IN signed(3 DOWNTO 0);
        inp_b : IN signed(3 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        out_alu : OUT signed(3 DOWNTO 0));
END alu;

ARCHITECTURE Behavioral OF alu IS
BEGIN
    PROCESS (inp_a, inp_b, sel)
    BEGIN
        CASE sel IS
            WHEN "000" =>
                out_alu <= inp_a + inp_b; --addition 
            WHEN "001" =>
                out_alu <= inp_a - inp_b; --subtraction 
            WHEN "010" =>
                out_alu <= inp_a - 1; --sub 1 
            WHEN "011" =>
                out_alu <= inp_a + 1; --add 1 
            WHEN "100" =>
                out_alu <= inp_a AND inp_b; --AND gate 
            WHEN "101" =>
                out_alu <= inp_a OR inp_b; --OR gate 
            WHEN "110" =>
                out_alu <= NOT inp_a; --NOT gate 
            WHEN "111" =>
                out_alu <= inp_a XOR inp_b; --XOR gate 
            WHEN OTHERS =>
                NULL;
        END CASE;

    END PROCESS;

END Behavioral;