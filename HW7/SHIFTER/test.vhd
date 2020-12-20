--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:21:49 08/19/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/ALU/shifter/test.vhd
-- Project Name:  shifter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shifter
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
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shifter
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         sw : IN  std_logic;
         rorl : IN  std_logic;
         outshift : OUT  std_logic_vector(15 downto 0);
         inshift : IN  std_logic_vector(15 downto 0);
         hmshift : IN  integer
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal sw : std_logic := '0';
   signal rorl : std_logic := '0';
   signal inshift : std_logic_vector(15 downto 0) := (others => '0');
   signal hmshift : integer:= 0;

 	--Outputs
   signal outshift : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shifter PORT MAP (
          clock => clock,
          reset => reset,
          sw => sw,
          rorl => rorl,
          outshift => outshift,
          inshift => inshift,
          hmshift => hmshift
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
		reset <= '1';
		inshift <= x"0a54";
		hmshift <= 5;
		wait for 10 ns;
		reset <= '0';
		sw <= '0';
		rorl <= '0';
      wait for 60 ns;
		reset <= '1';
		inshift <= x"0a54";
		hmshift <= 5;
		wait for 10 ns;
		reset <= '0';
		sw <= '0';
		rorl <= '1';
      wait for 60 ns;
		reset <= '1';
		inshift <= x"0a54";
		hmshift <= 5;
		wait for 10 ns;
		reset <= '0';
		sw <= '1';
		rorl <= '0';
		wait for 60 ns;
		reset <= '1';
		inshift <= x"0a54";
		hmshift <= 5;
		wait for 10 ns;
		reset <= '0';
		sw <= '1';
		rorl <= '1';
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
