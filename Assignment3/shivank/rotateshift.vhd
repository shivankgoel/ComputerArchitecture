----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:07 03/16/2016 
-- Design Name: 
-- Module Name:    rotateshift - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rotateshift is
	PORT(
	rsinp : in std_logic_vector(31 downto 0);
	rsoup : out std_logic_vector(31 downto 0);  
	rstype : in std_logic_vector(1 downto 0); 
	amount : in std_logic_vector(4 downto 0)
	);
end rotateshift;

architecture Behavioral of rotateshift is
signal rotamt  : std_logic_vector(3 downto 0) := (others => '0');

begin
rotamt <= amount(3 downto 0);
process begin
		if(rstype="11") then
		rsoup <=   std_logic_vector(unsigned(rsinp) ror to_integer(unsigned(rotamt)));
		elsif(rstype="01") then
		rsoup <=   std_logic_vector(unsigned(rsinp) srl to_integer(unsigned(amount)));
		elsif(rstype="00") then
		rsoup <=   std_logic_vector(unsigned(rsinp) sll to_integer(unsigned(amount)));
		elsif(rstype="10") then
		rsoup <=   to_stdlogicvector(to_bitvector(rsinp) sra to_integer(unsigned(amount)));
		end if;
end process;

end Behavioral;

