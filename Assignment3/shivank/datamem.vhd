----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:59:30 03/11/2016 
-- Design Name: 
-- Module Name:    datamem - Behavioral 
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

entity datamem is
	PORT(
		clock : in std_logic;
		addr : in std_logic_vector(31 downto 0);
		outp : out std_logic_vector(31 downto 0);
		mw : in std_logic;
		mr : in std_logic;
		writedata : in std_logic_vector(31 downto 0)	
	);
end datamem;

architecture Behavioral of datamem is
	
	component bram1
		PORT (
       clka  : IN STD_LOGIC;
       wea   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
       addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
       dina  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
   end component;
	signal extractedaddr : std_logic_vector(9 downto 0) := (others => '0');
	signal rw : std_logic_vector(0 downto 0) := (others => '0') ;
begin
	extractedaddr <= addr(9 downto 0);
	
	p1 : bram1 PORT MAP (clka => clock , wea => rw , dina => writedata, addra => extractedaddr, douta => outp);
	process(clock)
	begin
	if clock'event and clock='1' then
		if(mw = '1') then rw(0) <= '1';
		elsif(mr = '1') then rw(0) <= '0';
		end if;
	end if;
	end process;


end Behavioral;

