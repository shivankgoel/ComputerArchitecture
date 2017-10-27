----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:59:46 11/26/2015 
-- Design Name: 
-- Module Name:    registerFile - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registerFile is

	PORT (
		clk : in std_logic;
		input: in  std_logic_vector(7 downto 0);
		addr : in std_logic_vector( 3 downto 0);
		enable : in std_logic;
		reset : in std_logic;
		output : out std_logic_vector(7 downto 0)
	);
end registerFile;


architecture Behavioral of registerFile is

type ar is array (15 downto 0) of std_logic_vector(7 downto 0);
signal reg : ar:=(others=>"00000000");

begin
	process(clk) begin 
		if(falling_edge(clk)) then
		if(reset = '1') then
			for i in  0 to 15 loop 
			reg(i) <= "00000000";
		end loop;
			elsif(enable = '1') then
				if(addr = "0000")	then reg(0) <= input; 
				elsif(addr = "0001")	then reg(1) <= input; 
				elsif(addr = "0010")	then reg(2) <= input; 
				elsif(addr = "0011")	then reg(3) <= input; 
				elsif(addr = "0100")	then reg(4) <= input; 
				elsif(addr = "0101")	then reg(5) <= input; 
				elsif(addr = "0110")	then reg(6) <= input; 
				elsif(addr = "0111")	then reg(7) <= input; 
				elsif(addr = "1000")	then reg(8) <= input; 
				elsif(addr = "1001")	then reg(9) <= input; 
				elsif(addr = "1010")	then reg(10) <= input; 
				elsif(addr = "1011")	then reg(11) <= input; 
				elsif(addr = "1100")	then reg(12) <= input; 
				elsif(addr = "1101")	then reg(13) <= input; 
				elsif(addr = "1110")	then reg(14) <= input ;
				elsif(addr = "1111")	then reg(15) <= input; 	
				end if;				
			end if;
		end if;
	end process;
	
	output <= reg(0) when  (addr="0000") else
				 reg(1) when  (addr="0001") else
				 reg(2) when  (addr="0010") else
				 reg(3) when  (addr="0011") else
				 reg(4) when  (addr="0100") else
				 reg(5) when  (addr="0101") else
				 reg(6) when  (addr="0110") else
				 reg(7) when  (addr="0111") else
				 reg(8) when  (addr="1000") else
				 reg(9) when  (addr="1001") else
				 reg(10) when (addr="1010") else
				 reg(11) when (addr="1011") else
				 reg(12) when (addr="1100") else
				 reg(13) when (addr="1101") else
				 reg(14) when (addr="1110") else
				 reg(15) when (addr="1111");
end Behavioral;

