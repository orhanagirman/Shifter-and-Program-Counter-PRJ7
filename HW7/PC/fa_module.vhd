----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:18 08/19/2020 
-- Design Name: 
-- Module Name:    fa_module - Behavioral 
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

entity fa_module is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
			  s_out : out STD_LOGIC_VECTOR (15 downto 0);
			  z : in  STD_LOGIC );
end fa_module;

architecture Behavioral of fa_module is

component fulladder
    Port ( a : in  STD_LOGIC;
           b : in   STD_LOGIC;
           cin : in  STD_LOGIC;
			  cout : out STD_LOGIC;
           s : out  STD_LOGIC);
end component;

signal s_port : STD_LOGIC_VECTOR (15 downto 0);
signal c_port : STD_LOGIC_VECTOR (15 downto 0);

begin

fa : fulladder port map (a=> x(0), b=> y(0), cin => z, s=>s_port(0), cout => c_port(0));
           loop1 : for n in 1 to 15 generate
	             fa1: fulladder port map ( a=> x(n), b=> y(n), cin => c_port(n-1), s => s_port(n), cout => c_port(n));
				end generate loop1;
            s_out <=	s_port;	
end Behavioral;

