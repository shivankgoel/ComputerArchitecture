----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:10:46 03/11/2016 
-- Design Name: 
-- Module Name:    bitextender - Behavioral 
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

entity bitextender is
	PORT(
	inp : in std_logic_vector(11 downto 0);
	oup : out std_logic_vector(31 downto 0)
	);
end bitextender;

architecture Behavioral of bitextender is
begin
	process begin
	oup (31 downto 12) <= (others => '0');
	oup (11 downto 0 ) <= inp (11 downto 0);
end process;

end Behavioral;

