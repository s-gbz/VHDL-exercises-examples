LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
  
ENTITY alu_tb IS
END alu_tb;
  
ARCHITECTURE behavior OF alu_tb IS
  
 -- Component Declaration for the Unit Under Test (UUT)
  
 COMPONENT alu
 PORT(
 inp_a : IN signed(3 downto 0);
 inp_b : IN signed(3 downto 0);
 sel : IN std_logic_vector(2 downto 0);
 out_alu : OUT signed(3 downto 0)
 );
 END COMPONENT;
  
 
 --Inputs
 signal inp_a : signed(3 downto 0) := (others => '0');
 signal inp_b : signed(3 downto 0) := (others => '0');
 signal sel : std_logic_vector(2 downto 0) := (others => '0');
 
 --Outputs
 signal out_alu : signed(3 downto 0);
  
BEGIN
  
 -- Instantiate the Unit Under Test (UUT)
 uut: alu PORT MAP (
 inp_a => inp_a,
 inp_b => inp_b,
 sel => sel,
 out_alu => out_alu
 );
 
 -- Stimulus process
 stim_proc: process
 begin
 -- hold reset state for 100 ns.
 wait for 100 ns; 
 
 -- insert stimulus here 
 
 inp_a <= "1001";
 inp_b <= "1111";
  
 sel <= "000";
 wait for 100 ns;
 sel <= "001";
 wait for 100 ns;
 sel <= "010";
 wait for 100 ns;
 sel <= "011";
 wait for 100 ns;
 sel <= "100";
 wait for 100 ns;
 sel <= "101";
 wait for 100 ns;
 sel <= "110";
 wait for 100 ns;
 sel <= "111";
 wait for 100 ns;
 assert false report "Reached end of test";
 wait;
 end process;
 
END;
