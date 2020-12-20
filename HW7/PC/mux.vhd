----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:01:43 08/14/2020 
-- Design Name: 
-- Module Name:    mux4to1 - Behavioral 
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

entity mux is
    Port ( rst : in STD_LOGIC;
	        mux_in_a : in  STD_LOGIC_VECTOR (15 downto 0);
	        mux_in_b : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end mux;

architecture Behavioral of mux is
signal wire :  STD_LOGIC_VECTOR (15 downto 0);
begin
    process(rst,mux_in_b,mux_in_a,mux_sel)
	 begin
	      if (rst = '1') then
			    wire <= x"0000";
			else	 
				if (mux_sel = '0') then
					wire <= mux_in_a;
				elsif (mux_sel = '1') then
					wire <= mux_in_b;
				end if;
			end if;	
    end process;
    output <= wire;	 

end Behavioral;

