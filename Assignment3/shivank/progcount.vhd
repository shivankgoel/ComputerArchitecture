----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:22:45 03/11/2016 
-- Design Name: 
-- Module Name:    progcount - Behavioral 
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

entity progcount is
	PORT(
	clock :in std_logic;
	inp : in std_logic_vector (31 downto 0);
	oup : out std_logic_vector (31 downto 0)
	);
end progcount;

architecture Behavioral of progcount is

begin
process begin
	if clock'event and clock='1' then
	oup <= inp;
	end if;
end process;
end Behavioral;

