----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:39:24 03/11/2016 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
	PORT(
	    a : in std_logic;
		 b : in std_logic;
		 cin : in std_logic;
		 cout : out std_logic;
		 input : in std_logic;
		 control : in std_logic;
		 operation : in std_logic_vector( 1 downto 0);
		 s : out std_logic
	);
end alu;

architecture Behavioral of alu is
	signal a1:std_logic:= '0';
	signal b1:std_logic:= '0';
begin

process begin
	if(input = '1' ) then 
	a1 <= a;
	elsif (input = '0') then
	a1 <= '0';
	end if;
	
	
	if(control = '1' ) then 
	b1 <= NOT b;
	elsif (control = '0') then
	b1 <= b;
	end if;
	
	if(operation = "00") then
	s <= a1 and b1;
	elsif (operation = "01") then
	s <= a1 or b1;
	elsif(operation = "10") then
	s <= a1 xor b1;
	elsif(operation = "11") then
	s <= (a1 xor b1) xor cin ;
	end if;
	
	cout <= (((a1 and b1) or (a1 and cin)) or (b1 and cin) );

end process;

end Behavioral;

