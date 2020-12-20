----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:54:42 08/19/2020 
-- Design Name: 
-- Module Name:    shifter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifter is
    generic (
	          sr_depth : integer:=17
	 ); 
    Port ( clock : in STD_LOGIC;
	        reset : in STD_LOGIC;
	        sw : in  STD_LOGIC;
			  rorl : in STD_LOGIC;
           outshift : out  STD_LOGIC_VECTOR (15 downto 0);
           inshift : in  STD_LOGIC_VECTOR (15 downto 0);
           hmshift : in  integer);
end shifter;

architecture Behavioral of shifter is

signal sr : STD_LOGIC_VECTOR(sr_depth - 2 downto 0);
signal hms : integer;
signal msb : STD_LOGIC;
begin

     process(clock,reset)
	  begin
	       if (reset = '1') then
	           hms <= hmshift;
			 	  sr <= inshift;
				  msb <= sr(15);				  
	       else
         	 if rising_edge(clock) then
			       if (sw = '0') then --logical
					    if (rorl = '0') then --right
						    if (hms /= 0) then
						         sr <=  '0' & sr(sr'high downto sr'low + 1);
								   hms <= hms - 1;
							  end if;
                   elsif (rorl = '1') then --left	
 						     if (hms /= 0) then
						         sr <=  sr(sr'high-1 downto sr'low) & '0' ;
								   hms <= hms - 1;
							  end if;
						 end if;
                elsif (sw = '1') then --arithmetic
					    if (rorl = '0') then --right    
						    if (hms /= 0) then
						         sr <=  msb & sr(sr'high downto sr'low + 1);
								   hms <= hms - 1;
							  end if;
                   elsif (rorl = '1') then --left	
 						     if (hms /= 0) then
						         sr <=  sr(sr'high-1 downto sr'low ) & '0' ;
								   hms <= hms - 1;
							  end if;
						 end if;
				     end if;
				 end if;
           end if;
        end process;	
        outshift <= sr;	  


end Behavioral;

