--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:32:40 03/15/2016
-- Design Name:   
-- Module Name:   E:/4th Sem/comp-arch/assignment3/shivank/alutestbench.vhd
-- Project Name:  shivank
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alucombine
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alutestbench IS
END alutestbench;
 
ARCHITECTURE behavior OF alutestbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alucombine
    PORT(
         tempclk : IN  std_logic;
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         cin : IN  std_logic;
         sbit : IN  std_logic;
         mul : IN  std_logic;
         oper : IN  std_logic_vector(3 downto 0);
         outans : OUT  std_logic_vector(31 downto 0);
         nzcv : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal tempclk : std_logic := '0';
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal cin : std_logic := '0';
   signal sbit : std_logic := '0';
   signal mul : std_logic := '0';
   signal oper : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal outans : std_logic_vector(31 downto 0);
   signal nzcv : std_logic_vector(3 downto 0);
   signal cout : std_logic;

   -- Clock period definitions
   constant tempclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alucombine PORT MAP (
          tempclk => tempclk,
          a => a,
          b => b,
          cin => cin,
          sbit => sbit,
          mul => mul,
          oper => oper,
          outans => outans,
          nzcv => nzcv,
          cout => cout
        );

   -- Clock process definitions
   tempclk_process :process
   begin
		tempclk <= '0';
		wait for tempclk_period/2;
		tempclk <= '1';
		wait for tempclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for tempclk_period*10;

      -- insert stimulus here 
		    a <= "00000000000000000000000000000001";
          b <= "00000000000000000000000000000010";
          cin <= '0';
          sbit <= '0';
          mul <= '0';
          oper <= "0100";

      wait;
   end process;

END;
