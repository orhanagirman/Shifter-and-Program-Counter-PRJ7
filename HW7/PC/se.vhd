----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:29:18 08/19/2020 
-- Design Name: 
-- Module Name:    se - Behavioral 
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

entity se is
    Port ( rst : in STD_LOGIC;
	        se_in : in  STD_LOGIC_VECTOR (7 downto 0);
           se_jmp : out  STD_LOGIC_VECTOR (15 downto 0);
           se_br : out  STD_LOGIC_VECTOR (15 downto 0));
end se;

architecture Behavioral of se is

signal msb : STD_LOGIC;
signal sr_jmp : STD_LOGIC_VECTOR(15 downto 0);
signal sr_br : STD_LOGIC_VECTOR(15 downto 0);
begin
     msb <= se_in(7);
     process(rst)
	  begin 
	       if (rst = '1') then
			     sr_jmp <= x"0000";
              sr_br <= 	x"0000";
				  
          else
				  sr_jmp <= x"00" & se_in;
				  if(msb = '1') then 
				     sr_br <= x"FF" & se_in ;
				  elsif (msb = '0') then
                 sr_br <= x"00" & se_in;
              end if;					  
			 end if;
     end process;
     se_jmp <= sr_jmp;
     se_br <= sr_br;	  
end Behavioral;

