----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:16:28 03/11/2016 
-- Design Name: 
-- Module Name:    shift2 - Behavioral 
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

entity shift2 is
	PORT(
	inp : in std_logic_vector(23 downto 0);
	oup : out std_logic_vector(31 downto 0)
	);
end shift2;

architecture Behavioral of shift2 is

begin
	process begin
	oup (1 downto 0) <= (others => '0');
	oup (31 downto 25) <= (others => inp(23) );
	oup (25 downto 2 ) <= inp (23 downto 0);
end process;


end Behavioral;


