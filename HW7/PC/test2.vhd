--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:57:42 08/20/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/homework7/program_counter/test2.vhd
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
 
ENTITY test2 IS
END test2;
 
ARCHITECTURE behavior OF test2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         disp : IN  std_logic_vector(7 downto 0);
         clock : IN  std_logic;
         reset : IN  std_logic;
         br : IN  std_logic;
         jal : IN  std_logic;
         jmp : IN  std_logic;
         rtn : IN  std_logic;
         en_out : OUT  std_logic_vector(7 downto 0);
         seven_out : OUT  std_logic_vector(6 downto 0)
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

 	--Outputs
   signal en_out : std_logic_vector(7 downto 0);
   signal seven_out : std_logic_vector(6 downto 0);

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
          rtn => rtn,
          en_out => en_out,
          seven_out => seven_out
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
      wait for 10 ns;
		reset <= '0';
		--disp <= "10110110";
		rtn <= '0';
		br <= '0';
		jmp <= '0';
		jal <= '0';
		wait for 1000 ns;
		jmp <= '1';
		wait for 5000 ns;
      jmp <= '0';
		wait for 5000 ns;
		rtn <= '0';
		br <= '0';
		jmp <= '0';
		jal <= '1';
		wait for 1500 ns;
		jal <= '0';
		wait for 5000 ns;
		rtn <= '0';
		br <= '1';
		jmp <= '0';
		jal <= '0';
		wait for 1500 ns;
		br <= '0';
		wait for 5000 ns;
		rtn <= '1';
		br <= '0';
		jmp <= '0';
		jal <= '0';
		wait for 1500 ns;
		rtn <= '0';
		wait for 5000 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
