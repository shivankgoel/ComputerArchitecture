----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:47:56 03/11/2016 
-- Design Name: 
-- Module Name:    add1four - Behavioral 
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add1four is
	PORT(
	a : in std_logic_vector(31 downto 0);
	ans : out std_logic_vector(31 downto 0)
	);
end add1four;

architecture Behavioral of add1four is
	signal four : std_logic_vector(31 downto 0) := (others => '0');
begin
process begin
			four(2) <= '1'; 
			ans <= std_logic_vector( signed( a ) + signed(four));
end process;
end Behavioral;

