----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:21 11/26/2015 
-- Design Name: 
-- Module Name:    IR - Behavioral 
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


entity IR is
	port(
		clk : in std_logic;
		enable : in std_logic;
		input : in std_logic_vector (15 downto 0);
		output : out std_logic_vector (15 downto 0)
	);
end IR;

architecture Behavioral of IR is
	signal data : std_logic_vector (15 downto 0):=(others=>'0');
begin
	process(clk) begin 
		if(rising_edge(clk)) then
			if (enable = '1') then data <= input; end if;
		end if;
	end process;
	output <= data;
end Behavioral;
