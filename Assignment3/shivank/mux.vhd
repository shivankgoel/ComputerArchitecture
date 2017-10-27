----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:35:21 03/11/2016 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux is
	PORT(
	a : in std_logic_vector(31 downto 0);
	b : in std_logic_vector(31 downto 0);
	ans : out std_logic_vector(31 downto 0);
	sel : in std_logic
	);
end mux;

architecture Behavioral of mux is
	
begin
	process begin
	if (sel = '0') then
		ans <= a;
	else
		ans <= b;
	end if;
end process;


end Behavioral;

