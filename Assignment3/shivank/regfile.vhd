----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:39:27 03/11/2016 
-- Design Name: 
-- Module Name:    regfile - Behavioral 
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

entity regfile is
	PORT(
		clock : in std_logic;
		readadd1 : in std_logic_vector(3 downto 0);
		readadd2 : in std_logic_vector(3 downto 0);
		writeadd : in std_logic_vector(3 downto 0);
		inpdata : in std_logic_vector(31 downto 0);
		rw : in std_logic;
		out1 :out std_logic_vector(31 downto 0);
		out2 :out std_logic_vector(31 downto 0)
	);
end regfile;

architecture Behavioral of regfile is
type reg is array (15 downto 0) of std_logic_vector(31 downto 0);
signal r : reg:=(others=>"00000000000000000000000000000000");
begin
process(clock)
begin
if clock'event and clock='1' then
	if(rw = '1') then
	         if(writeadd = "0000")	then r(0) <= inpdata; 
				elsif(writeadd = "0001")	then r(1) <= inpdata; 
				elsif(writeadd = "0010")	then r(2) <= inpdata; 
				elsif(writeadd = "0011")	then r(3) <= inpdata; 
				elsif(writeadd = "0100")	then r(4) <= inpdata; 
				elsif(writeadd = "0101")	then r(5) <= inpdata; 
				elsif(writeadd = "0110")	then r(6) <= inpdata; 
				elsif(writeadd = "0111")	then r(7) <= inpdata; 
				elsif(writeadd = "1000")	then r(8) <= inpdata; 
				elsif(writeadd = "1001")	then r(9) <= inpdata; 
				elsif(writeadd = "1010")	then r(10) <= inpdata; 
				elsif(writeadd = "1011")	then r(11) <= inpdata; 
				elsif(writeadd = "1100")	then r(12) <= inpdata; 
				elsif(writeadd = "1101")	then r(13) <= inpdata; 
				elsif(writeadd = "1110")	then r(14) <= inpdata;
				elsif(writeadd = "1111")	then r(15) <= inpdata; 	
				end if;	
	 
	 else
	 
	         if(readadd1 = "0000")	then out1 <= r(0); 
				elsif(readadd1 = "0001")	then out1 <= r(1); 
				elsif(readadd1 = "0010")	then out1 <= r(2); 
				elsif(readadd1 = "0011")	then out1 <= r(3); 
				elsif(readadd1 = "0100")	then out1 <= r(4); 
				elsif(readadd1 = "0101")	then out1 <= r(5); 
				elsif(readadd1 = "0110")	then out1 <= r(6); 
				elsif(readadd1 = "0111")	then out1 <= r(7); 
				elsif(readadd1 = "1000")	then out1 <= r(8); 
				elsif(readadd1 = "1001")	then out1 <= r(9); 
				elsif(readadd1 = "1010")	then out1 <= r(10); 
				elsif(readadd1 = "1011")	then out1 <= r(11); 
				elsif(readadd1 = "1100")	then out1 <= r(12); 
				elsif(readadd1 = "1101")	then out1 <= r(13); 
				elsif(readadd1 = "1110")	then out1 <= r(14);
				elsif(readadd1 = "1111")	then out1 <= r(15); 	
				end if;	
				
				if(readadd2 = "0000")	then out2 <= r(0); 
				elsif(readadd2 = "0001")	then out2 <= r(1); 
				elsif(readadd2 = "0010")	then out2 <= r(2); 
				elsif(readadd2 = "0011")	then out2 <= r(3); 
				elsif(readadd2 = "0100")	then out2 <= r(4); 
				elsif(readadd2 = "0101")	then out2 <= r(5); 
				elsif(readadd2 = "0110")	then out2 <= r(6); 
				elsif(readadd2 = "0111")	then out2 <= r(7); 
				elsif(readadd2 = "1000")	then out2 <= r(8); 
				elsif(readadd2 = "1001")	then out2 <= r(9); 
				elsif(readadd2 = "1010")	then out2 <= r(10); 
				elsif(readadd2 = "1011")	then out2 <= r(11); 
				elsif(readadd2 = "1100")	then out2 <= r(12); 
				elsif(readadd2 = "1101")	then out2 <= r(13); 
				elsif(readadd2 = "1110")	then out2 <= r(14);
				elsif(readadd2 = "1111")	then out2 <= r(15); 	
				end if;	
				
		end if;
	
end if;
end process;

end Behavioral;

