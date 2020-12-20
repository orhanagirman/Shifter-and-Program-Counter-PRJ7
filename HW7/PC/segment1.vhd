----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:24 08/20/2020 
-- Design Name: 
-- Module Name:    segment1 - Behavioral 
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

entity segment1 is
    Port ( segment_in : in  STD_LOGIC_VECTOR (3 downto 0);
           segment_out : out  STD_LOGIC_VECTOR (6 downto 0);
           en : in  STD_LOGIC);
end segment1;

architecture Behavioral of segment1 is

begin


end Behavioral;

