----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:06:49 03/15/2016 
-- Design Name: 
-- Module Name:    Actrl - Behavioral 
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

entity Actrl is
	PORT(
	inp : in std_logic_vector(5 downto 0);  --26 downto 21  -- 25 not being used -- 26 diff between dp and dt 
	oup: out std_logic_vector(3 downto 0)   --24 downto 21
	);
end Actrl;

architecture Behavioral of Actrl is 
begin
process begin
if(inp(5) = '1') then
	if(inp(2) = '1') then
		oup <= "0100";
	else
		oup <= "0010";
	end if;
else
oup(3 downto 0) <= inp(3 downto 0);
end if;

end process;
end Behavioral;

