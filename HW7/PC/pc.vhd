----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:14 08/19/2020 
-- Design Name: 
-- Module Name:    pc - Behavioral 
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

entity pc is
    Port ( disp : in  STD_LOGIC_VECTOR (7 downto 0);
           clock : in  STD_LOGIC;
			  reset : in STD_LOGIC; 
			  br : in STD_LOGIC;
			  jal : in STD_LOGIC;
			  jmp : in STD_LOGIC;
			  rtn : in STD_LOGIC;
			  en_out : out STD_LOGIC_VECTOR (7 downto 0);
			  seven_out : out STD_LOGIC_VECTOR (6 downto 0));
end pc;

architecture Behavioral of pc is

component mux
    Port ( rst : in STD_LOGIC;
	        mux_in_a : in  STD_LOGIC_VECTOR (15 downto 0);
	        mux_in_b : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component fa_module
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
			  s_out : out STD_LOGIC_VECTOR (15 downto 0);
			  z : in  STD_LOGIC );
end component;

component register16
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (15 downto 0);
           q : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component se
    Port ( rst : in STD_LOGIC;
	        se_in : in  STD_LOGIC_VECTOR (7 downto 0);
           se_jmp : out  STD_LOGIC_VECTOR (15 downto 0);
           se_br : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component debouncer
    generic (
	          sr_depth : integer:=16
	 ); 
    Port ( clk : in  STD_LOGIC;
	        clk2 : STD_LOGIC;
           rst : in  STD_LOGIC;
			  button_in : in  STD_LOGIC;
			  tmp_out : out STD_LOGIC);
end component;

component clock_divider
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  value: in integer;
           output : out  STD_LOGIC);
end component;

component bcd_segment
    Port ( led_bcd : in  STD_LOGIC_VECTOR (3 downto 0);
	        led_out : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

signal se_jmp_port : STD_LOGIC_VECTOR (15 downto 0);
signal se_br_port : STD_LOGIC_VECTOR (15 downto 0);
signal fa_in1 : STD_LOGIC_VECTOR (15 downto 0);
signal fa_in2 : STD_LOGIC_VECTOR (15 downto 0);
signal mx2_in : STD_LOGIC_VECTOR (15 downto 0);
signal rg1_in : STD_LOGIC_VECTOR (15 downto 0);
signal mx1_in1 : STD_LOGIC_VECTOR (15 downto 0);
signal mx1_in2 : STD_LOGIC_VECTOR (15 downto 0);

signal s_port : STD_LOGIC_VECTOR (15 downto 0);
signal temp1 : STD_LOGIC;
signal temp2 : STD_LOGIC;
signal temp3 : STD_LOGIC;
signal temp4 : STD_LOGIC;
signal tempx : STD_LOGIC;
signal araport1 : STD_LOGIC;
signal araport2 : STD_LOGIC;

signal ledport1 : STD_LOGIC_VECTOR (6 downto 0);
signal ledport2 : STD_LOGIC_VECTOR (6 downto 0);
signal ledport3 : STD_LOGIC_VECTOR (6 downto 0);
signal ledport4 : STD_LOGIC_VECTOR (6 downto 0);
signal ledport5 : STD_LOGIC_VECTOR (6 downto 0);
signal ledport6 : STD_LOGIC_VECTOR (6 downto 0);
signal ledport7 : STD_LOGIC_VECTOR (6 downto 0);
signal ledport8 : STD_LOGIC_VECTOR (6 downto 0);
signal en : STD_LOGIC_VECTOR (7 downto 0):="11111111";
signal count : STD_LOGIC_VECTOR (2 downto 0):="000";
signal seven_port :  STD_LOGIC_VECTOR (6 downto 0);

begin

se1 : se port map (rst => reset, se_in => disp, se_jmp => se_jmp_port, se_br => se_br_port);
mx3 : mux port map (rst => reset,mux_in_a => x"0001", mux_in_b => se_br_port, mux_sel => temp2, output => fa_in2);
mx2 : mux port map (rst => reset,mux_in_a => mx2_in, mux_in_b => se_jmp_port, mux_sel => tempx, output => rg1_in);
mx1 : mux port map (rst => reset,mux_in_a => s_port, mux_in_b => mx1_in2, mux_sel => temp3, output => mx2_in);
fam : fa_module port map (x => fa_in1, y => fa_in2, z => '0', s_out => s_port);
rg1 : register16 port map (clk => araport1, rst => reset, en => '1', d => rg1_in, q => fa_in1);
rg2 : register16 port map (clk => araport1, rst => reset, en => temp4, d => s_port, q => mx1_in2);

DB1 : debouncer port map (clk => clock, clk2 => araport1,rst => reset, button_in => jmp, tmp_out => temp1);
DB2 : debouncer port map (clk => clock, clk2 => araport1,rst => reset, button_in => br, tmp_out => temp2);
DB3 : debouncer port map (clk => clock, clk2 => araport1,rst => reset, button_in => rtn, tmp_out => temp3);
DB4 : debouncer port map (clk => clock, clk2 => araport1,rst => reset, button_in => jal, tmp_out => temp4);     
CLK1 : clock_divider port map (clk => clock, rst => reset, value => 100, output => araport1);
CLK2 : clock_divider port map (clk => clock, rst => reset, value => 1000, output => araport2);

s1 : bcd_segment port map (led_bcd => fa_in1(3 downto 0), led_out => ledport1);
s2 : bcd_segment port map (led_bcd => fa_in1(7 downto 4), led_out => ledport2);
s3 : bcd_segment port map (led_bcd => fa_in1(11 downto 8), led_out => ledport3);
s4 : bcd_segment port map (led_bcd => fa_in1(15 downto 12), led_out => ledport4);
s5 : bcd_segment port map (led_bcd => disp(3 downto 0), led_out => ledport5);
s6 : bcd_segment port map (led_bcd => disp(7 downto 4), led_out => ledport6);
s7 : bcd_segment port map (led_bcd => mx1_in2(3 downto 0), led_out => ledport7);
s8 : bcd_segment port map (led_bcd => mx1_in2(7 downto 4), led_out => ledport8);

process(temp1,temp4)
begin
     if (temp4 = '1') and (temp1 = '0') then
         tempx <= temp4;
	  else 
         tempx <= temp1;	  
     end if;	 
end process;


process(araport2)
begin
if rising_edge(araport2) then
     if (count = "000") then
	     seven_port <= ledport1;
		  en <="11111110";
	  elsif (count = "001") then
	     seven_port <= ledport2;
		  en <="11111101";
	  elsif (count = "010") then
	     seven_port <= ledport3;
		  en <="11111011";
	  elsif (count = "011") then
	     seven_port <= ledport4;
		  en <="11110111";
	  elsif (count = "100") then
	     seven_port <= ledport5;
		  en <="11101111";
	  elsif (count = "101") then
	     seven_port <= ledport6;
		  en <="11011111";
	  elsif (count = "110") then
	     seven_port <= ledport7;
		  en <="10111111";
	  elsif (count = "111") then
	     seven_port <= ledport8;
		  en <="01111111";
     end if;
	  
	   
	  count <= count + 1;
end if;	  
end process;
     en_out <= en;	  
	  seven_out <= seven_port;
end Behavioral; 
