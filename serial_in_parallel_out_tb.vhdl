LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY serial_in_parallel_out_tb IS
END ENTITY;

ARCHITECTURE test OF serial_in_parallel_out_tb IS
    COMPONENT serial_in_parallel_out IS
        PORT (
            -- "port can't be assigned" ->
            -- aus diesem grund ist enable (= i) ein einzelnes bit
            clk, reset : IN std_logic;
            i : IN std_logic;
            o : OUT std_logic_vector(3 DOWNTO 0) -- to angebracht?
        );
    END COMPONENT;
    SIGNAL clk, reset, i : std_logic := '0';
    SIGNAL o : std_logic_vector(3 DOWNTO 0);
BEGIN
    sipo_test : serial_in_parallel_out PORT MAP(
        clk => clk, reset => reset,
        i => i, o => o
    );

    PROCESS BEGIN
        reset <= '1';
        clk <= '0';
        i <= '0';
        WAIT FOR 10 fs;
        -- sequentialEnable: 1000
        -- o: 0000
        reset <= '0';
        clk <= '1';
        i <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        i <= '0';
        WAIT FOR 10 fs;

        -- sequentialEnable: 0100
        -- o: 1000
        clk <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- sequentialEnable: 0010
        -- o: 0100
        clk <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- sequentialEnable: 0001
        -- o: 0010
        clk <= '1';
        WAIT FOR 10 fs;

        clk <= '0';
        WAIT FOR 10 fs;

        -- sequentialEnable: 0000
        -- o: 0001
        clk <= '1';
        WAIT FOR 10 fs;

        -- o: ????
        clk <= '0';
        WAIT FOR 10 fs;

        WAIT;
    END PROCESS;
END ARCHITECTURE;