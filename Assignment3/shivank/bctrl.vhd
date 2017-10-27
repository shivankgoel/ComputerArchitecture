----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:43:52 03/15/2016 
-- Design Name: 
-- Module Name:    bctrl - Behavioral 
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

entity bctrl is
	PORT(
		inpb : in std_logic_vector(3 downto 0);   -- 31 downto 28 cond field
		nzcvf : in std_logic_vector(3 downto 0);  -- flags from alu out
		pans : out std_logic
	);
end bctrl;

architecture Behavioral of bctrl is
signal p : std_logic := '0';
begin
process begin
	if(inpb = "0000") then 
		if(nzcvf(2) = '1') then 
		p <= '1';
		end if;
	elsif(inpb = "0001") then 
		if(nzcvf(2) = '0') then 
		p <= '1';
		end if;
	elsif(inpb = "0010") then 
		if(nzcvf(1) = '1') then 
		p <= '1';
		end if;
	elsif(inpb = "0011") then 
		if(nzcvf(1) = '0') then 
		p <= '1';
		end if;
	elsif(inpb = "0100") then 
		if(nzcvf(3) = '1') then 
		p <= '1';
		end if;
	elsif(inpb = "0101") then 
		if(nzcvf(3) = '0') then 
		p <= '1';
		end if;
	elsif(inpb = "0110") then 
		if(nzcvf(0) = '1') then 
		p <= '1';
		end if;
	elsif(inpb = "0111") then 
		if(nzcvf(0) = '0') then 
		p <= '1';
		end if;
	elsif(inpb = "1000") then 
		if(nzcvf(1) = '1') then
				if(nzcvf(2) = '0') then
		      p <= '1';
				end if;
		end if;
	elsif(inpb = "1001") then 
		if(nzcvf(1) = '0') then 
		p <= '1';
		end if;
	   if(nzcvf(2) = '1') then
		p <= '1';
		end if;
	elsif(inpb = "1010") then 
		if(nzcvf(0) = nzcvf(3)) then 
		p <= '1';
		end if;
	elsif(inpb = "1011") then 
		if(nzcvf(0) /= nzcvf(3)) then 
		p <= '1';
		end if;
	elsif(inpb = "1100") then 
		if(nzcvf(2) = '0') then 
		if(nzcvf(0) = nzcvf(3)) then 
		p <= '1';
		end if;
		end if;
	elsif(inpb = "1101") then 
		if(nzcvf(2) = '1') then 
		p <= '1';
		end if;
		if(nzcvf(0) /= nzcvf(3)) then 
		p <= '1';
		end if;
	elsif(inpb = "1110") then 
		p <= '1';
	else 
		p <= '0';
	end if;	
	
pans <= p;
end process;
end Behavioral;

