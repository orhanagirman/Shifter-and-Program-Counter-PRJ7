----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:04 08/09/2020 
-- Design Name: 
-- Module Name:    debouncer - Behavioral 
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

entity debouncer is
    generic (
	          sr_depth : integer:=16
	 ); 
    Port ( clk : in  STD_LOGIC;
	        clk2 : STD_LOGIC;
           rst : in  STD_LOGIC;
			  button_in : in  STD_LOGIC;
			  tmp_out : out STD_LOGIC);

end debouncer;

architecture Behavioral of debouncer is

signal wire_port: STD_LOGIC;
signal tmp: STD_LOGIC;
signal wire: STD_LOGIC:='0';
signal sr : STD_LOGIC_VECTOR(sr_depth - 2 downto 0);
signal counter : STD_LOGIC_VECTOR(1 downto 0):="00";

begin
     process(clk,rst,sr)
     begin 	
          if (rst = '1') then
			      sr<= "000000000000000";
					wire_port <='0';
		
			 elsif rising_edge (clk) then
					sr <= sr(sr'high - 1 downto sr'low) & button_in;
			 end if;
			 wire_port <= (sr(0) and sr(1) and sr(2) and sr(3) and sr(4) and sr(5) and sr(6) and sr(7) and sr(8) and sr(9) and sr(10) and sr(11) and sr(12) and sr(13) and sr(14));

     end process;	
	  
	  process(wire_port,rst,clk2)
	  begin
			 if (rst = '1') then
			     tmp<='0';
			 end if;
			 if (wire_port = '1') then
			     wire <= '1';
				  tmp <= '1';
			 elsif (wire_port = '0') then	
              	   counter <= "00";		 
			 end if;
          if (counter /= "01") then
			     if (wire = '1') then
				      --tmp <= '1';
				      if rising_edge(clk2) then
				         counter <= counter + 1;
				      end if;
               end if;				      
			 elsif (counter = "01") then
			        tmp <= '0';
					  wire <= '0';
			 end if;		  


						
--			 if (counter /= "01") then
--			     if (wire_port = '1') then
--			         tmp <= '1';			  
--				      if rising_edge(clk2) then
--				         counter <= counter + 1;
--				      end if;	
--				  end if;		
--			
--			 elsif (counter = "01") then
--			     counter <= "00";
--              tmp <= '0';
--              --wire <= '0';				  
--			 end if;
     end process;
	  tmp_out <= tmp;


end Behavioral;

