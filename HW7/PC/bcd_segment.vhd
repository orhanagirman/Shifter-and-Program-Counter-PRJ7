----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:32:31 08/20/2020 
-- Design Name: 
-- Module Name:    bcd_segment - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_segment is
    Port ( led_bcd : in  STD_LOGIC_VECTOR (3 downto 0);
	        led_out : out  STD_LOGIC_VECTOR (6 downto 0));
end bcd_segment;

architecture Behavioral of bcd_segment is

begin
     process(led_bcd)
	  begin
	       case led_bcd is
			 when "0000" => led_out <= "0000001";
			 when "0001" => led_out <= "1001111";
			 when "0010" => led_out <= "0010010";
			 when "0011" => led_out <= "0000110";
			 when "0100" => led_out <= "1001100";
			 when "0101" => led_out <= "0100100";
			 when "0110" => led_out <= "0100000";
			 when "0111" => led_out <= "0001111";
			 when "1000" => led_out <= "0000000";
			 when "1001" => led_out <= "0000100";
			 when "1010" => led_out <= "0000010";
			 when "1011" => led_out <= "1100000";
			 when "1100" => led_out <= "0110001";
			 when "1101" => led_out <= "1000010";
			 when "1110" => led_out <= "0110000";
			 when "1111" => led_out <= "0111000";
			 when others => led_out <= "0000001";
			 end case;
		end process;	 
end Behavioral;

