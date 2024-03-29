--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:24:30 08/19/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/homework7/program_counter/test_se.vhd
-- Project Name:  program_counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pc
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_se IS
END test_se;
 
ARCHITECTURE behavior OF test_se IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         disp : IN  std_logic_vector(7 downto 0);
         clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal disp : std_logic_vector(7 downto 0) := (others => '0');
   signal clock : std_logic := '0';

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          disp => disp,
          clock => clock
        );

   -- Clock process definitions
--   clock_process :process
--   begin
--		clock <= '0';
--		wait for clock_period/2;
--		clock <= '1';
--		wait for clock_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
