----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:55:48 03/15/2016 
-- Design Name: 
-- Module Name:    mainctrl - Behavioral 
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

entity mainctrl is
	PORT(
		input: in std_logic_vector(31 downto 0);  -- 31 to 20
		p :in std_logic;
		Rsrc : out std_logic;
		RW : out std_logic;
		MW : out std_logic;
		MR : out std_logic;
		Psrc : out std_logic;
		Fset : out std_logic;
		alumul : out std_logic;
		samt : out std_logic_vector(4 downto 0);
		stype : out std_logic_vector(1 downto 0)
	);
end mainctrl;


architecture Behavioral of mainctrl is
signal inp : std_logic_vector(4 downto 0) := (others=>'0'); 
begin
inp(4 downto 3) <= input(27 downto 26);
inp(2 downto 1) <= input(24 downto 23);
inp(0) <= input(20);
process begin

	if(inp = "00000") then
	   Rsrc <= '0';
		RW <= p;
		MW  <= '0';
		MR <= '0';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp = "00010") then
		 Rsrc <= '0';
		RW <= p;
		MW  <= '0';
		MR <= '0';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp = "00001") then
		 Rsrc <= '0';
		RW <= p;
		MW  <= '0';
		MR <= '0';
		Psrc <= '0';
		Fset <= p;
	elsif(inp = "00011") then
		 Rsrc <= '0';
		RW <= p;
		MW  <= '0';
		MR <= '0';
		Psrc <= '0';
		Fset <= p;
	elsif(inp = "00110") then
		 Rsrc <= '0';
		RW <= p;
		MW  <= '0';
		MR <= '0';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp = "00111") then
		 Rsrc <= '0';
		RW <= p;
		MW  <= '0';
		MR <= '0';
		Psrc <= '0';
		Fset <= p;
	elsif(inp = "00100") then
		 Rsrc <= '0';
		RW <= '0';
		MW  <= '0';
		MR <= '0';
		Psrc <= '0';
		Fset <= p;
	elsif(inp = "00101") then
		Rsrc <= '0';
		RW <= '0';
		MW  <= '0';
		MR <= '0';
		Psrc <= '0';
		Fset <= p;
	elsif(inp = "01000") then
		Rsrc <= '1';
		RW <= '0';
		MW  <= p;
		MR <= '0';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp = "01010") then
		Rsrc <= '1';
		RW <= '0';
		MW  <= p;
		MR <= '0';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp = "01100") then
		Rsrc <= '1';
		RW <= '0';
		MW  <= p;
		MR <= '0';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp = "01110") then
		Rsrc <= '1';
		RW <= '0';
		MW  <= p;
		MR <= '0';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp = "01001") then
		Rsrc <= '1';
		RW <= p;
		MW  <= '0';
		MR <= '1';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp = "01011") then
		Rsrc <= '1';
		RW <= p;
		MW  <= '0';
		MR <= '1';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp = "01101") then
		Rsrc <= '1';
		RW <= p;
		MW  <= '0';
		MR <= '1';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp = "01111") then
		Rsrc <= '1';
		RW <= p;
		MW  <= '0';
		MR <= '1';
		Psrc <= '0';
		Fset <= '0';
	elsif(inp(4 downto 3) = "10") then
		--Rsrc <= '1';  dont care
		Rsrc <= '0';
		RW <= '0';
		MW  <= '0';
		MR <= '0';
		Psrc <= p;
		Fset <= '0';
	end if;
	
	if(input(27 downto 21)="0000000")then
		if(input(7 downto 4)="1001") then
		alumul <= '1';
		samt <= "00000";
		end if;
	else
	alumul <= '0';
	end if;
	
	if(input(27 downto 25)="000") then 
		if(input(7 downto 4) /= "1001") then
		samt <= input(11 downto 7);
		stype <= input(6 downto 5);
		end if;
	elsif(input(27 downto 25)="001") then
	samt <= "00000";
	samt(3 downto 0)<= input(11 downto 8);
	stype <= "11";
	else
	samt <= "00000";
	stype <= "00";
	end if;
	
	
	-- main ctrl sets following Rsrc,Rw,mw,mr,psrc,fset and alumul,samt,stype
	
end process;


end Behavioral;

