----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:48:13 03/11/2016 
-- Design Name: 
-- Module Name:    add2four - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add2four is
	PORT(
	a : in std_logic_vector(31 downto 0);
	b : in std_logic_vector(31 downto 0);
	ans : out std_logic_vector(31 downto 0)
	);
end add2four;

architecture Behavioral of add2four is
	signal four : std_logic_vector(31 downto 0) := (others => '0');
begin
process begin
			four(2) <= '1'; 
			ans <= std_logic_vector( (signed( a ) + signed(b))+signed(four));
end process;
end Behavioral;

