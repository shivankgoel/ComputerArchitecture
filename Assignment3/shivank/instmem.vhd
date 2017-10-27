----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:58:38 03/11/2016 
-- Design Name: 
-- Module Name:    instmem - Behavioral 
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

entity instmem is
	PORT(
	clock : in std_logic;
	addr : in std_logic_vector(31 downto 0);
	outp1: out std_logic_vector(31 downto 0)
	);
end instmem;

architecture Behavioral of instmem is
	
	component bram2
		PORT (
       clka  : IN STD_LOGIC;
       wea   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
       addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
       dina  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
   end component;
	signal extaddr : std_logic_vector(9 downto 0) := (others => '0');
	signal writedata : std_logic_vector(31 downto 0) := (others => '0');
begin
	extaddr <= addr(9 downto 0);
	p1 : bram2 PORT MAP (clka => clock , wea => "0" , dina => writedata, addra => extaddr, douta => outp1);
	
	process begin
	wait until clock'event and clock='1';
	end process;
end Behavioral;

