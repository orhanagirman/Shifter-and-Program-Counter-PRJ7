--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:59:09 08/20/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/homework7/program_counter/test1.vhd
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
 
ENTITY test1 IS
END test1;
 
ARCHITECTURE behavior OF test1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         disp : IN  std_logic_vector(7 downto 0);
         clock : IN  std_logic;
         reset : IN  std_logic;
         br : IN  std_logic;
         jal : IN  std_logic;
         jmp : IN  std_logic;
         rtn : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal disp : std_logic_vector(7 downto 0) := (others => '0');
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal br : std_logic := '0';
   signal jal : std_logic := '0';
   signal jmp : std_logic := '0';
   signal rtn : std_logic := '0';

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          disp => disp,
          clock => clock,
          reset => reset,
          br => br,
          jal => jal,
          jmp => jmp,
          rtn => rtn
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     	disp <= "10110110";
		reset <= '1';
      wait for 10 ms;
		reset <= '0';
		--disp <= "10110110";
		rtn <= '0';
		br <= '0';
		jmp <= '0';
		jal <= '0';
		wait for 10 ms;
		jmp <= '1';
		wait for 8 ms;
      jmp <= '0';
		wait for 200 ms;
		rtn <= '0';
		br <= '0';
		jmp <= '0';
		jal <= '1';
		wait for 8 ms;
		jal <= '0';
		wait for 200 ms;
		rtn <= '0';
		br <= '1';
		jmp <= '0';
		jal <= '0';
		wait for 8 ms;
		br <= '0';
		wait for 200 ms;
		rtn <= '1';
		br <= '0';
		jmp <= '0';
		jal <= '0';
		wait for 8 ms;
		rtn <= '0';
		wait for 200 ms;
		
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
