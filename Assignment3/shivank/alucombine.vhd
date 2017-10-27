----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:19:10 03/11/2016 
-- Design Name: 
-- Module Name:    alucombine - Behavioral 
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alucombine is
	PORT(
		tempclk: in std_logic;
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		cin : in std_logic;
		sbit : in std_logic;
		mul : in std_logic;
		oper : in std_logic_vector(3 downto 0);
		outans : out std_logic_vector(31 downto 0);
		nzcv : out std_logic_vector(3 downto 0)
		);
end alucombine;

architecture Behavioral of alucombine is
signal temp1:	signed(32 downto 0):= (others => '0');
signal temp2:	std_logic_vector(33 downto 0):= (others => '0');
signal one:	std_logic_vector(31 downto 0):= (others => '0');
signal ca:	std_logic_vector(0 downto 0):= (others => '0');
signal fnzcv: std_logic_vector(3 downto 0) := (others => '0');
signal sout: std_logic_vector(32 downto 0) := (others => '0');
signal a31: std_logic_vector(31 downto 0) := (others => '0');
signal b31: std_logic_vector(31 downto 0) := (others => '0');
signal sum31: std_logic_vector(31 downto 0) := (others => '0');
signal ain :  std_logic_vector(32 downto 0) := (others => '0');
signal bin :  std_logic_vector(32 downto 0) := (others => '0');
begin

process begin

			wait until tempclk'event and tempclk='1';
			
			one(0) <= '1';
			ca(0) <= cin;
			ain(31 downto 0) <= a;
			bin(31 downto 0) <= b;
			ain(32) <= '0';
			bin(32) <= '0';
			
if (mul = '0') then 
			
			if(oper = "0000") then  --and
			sout <= ain and bin;
			
				--C flag will be set to the carry out from the barrel shifter (or preserved when there is no shift)			
				if(sbit = '1') then
				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1'; end if;
				fnzcv(3) <= sout(31);
				end if;
			
			elsif(oper = "0001") then   --eor
			sout <= ain xor bin;
			
								
				if(sbit = '1') then
				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1'; end if;
				fnzcv(3) <= sout(31);
				end if;
			
			elsif(oper = "0010") then    --sub
			temp1 <= signed( ain ) + signed(not bin);
			sout <= std_logic_vector( temp1 + signed(one));
			
					
			if(sbit = '1') then
 
				fnzcv(3) <= sout(31);

				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;

				if(sout(32) = '1' ) then fnzcv(1) <= '1'; end if;

				a31(30 downto 0) <= ain(30 downto 0);  a31(31) <= '0';
				b31(30 downto 0) <= bin(30 downto 0);  b31(31) <= '0';
				sum31 <= std_logic_vector(  signed(a31)  + signed(not b31) + signed(one));
				if( sout(32) /= sum31(31) ) then fnzcv(0) <= '1'; end if;

			end if;
			
			elsif(oper = "0011") then     --rsb
			temp1 <= signed( not ain) + signed( bin );
			sout <= std_logic_vector( temp1 + signed(one) );
			
					
			if(sbit = '1') then
 
				fnzcv(3) <= sout(31);

				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;

				if(sout(32) = '1' ) then fnzcv(1) <= '1'; end if;

				a31(30 downto 0) <= ain(30 downto 0);  a31(31) <= '0';
				b31(30 downto 0) <= bin(30 downto 0);  b31(31) <= '0';
				sum31 <= std_logic_vector(  (signed(a31)  + signed(b31)) + signed(one));
				if( sout(32) /= sum31(31) ) then fnzcv(0) <= '1'; end if;

			end if;
			
			elsif(oper = "0100") then     --add
			sout <= std_logic_vector(signed( ain ) + signed(bin));
			
			if(sbit = '1') then
 
				fnzcv(3) <= sout(31);

				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;

				if(sout(32) = '1' ) then fnzcv(1) <= '1'; end if;

				a31(30 downto 0) <= ain(30 downto 0);  a31(31) <= '0';
				b31(30 downto 0) <= bin(30 downto 0);  b31(31) <= '0';
				sum31 <= std_logic_vector(  signed(a31)  + signed(b31));
				if( sout(32) /= sum31(31) ) then fnzcv(0) <= '1'; end if;

			end if;
			
			elsif(oper = "0101") then     --adc
			temp1 <= signed( ain) + signed(bin);
			sout <= std_logic_vector( temp1  + signed(ca));
			
						
			if(sbit = '1') then
 
				fnzcv(3) <= sout(31);

				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;

				if(sout(32) = '1' ) then fnzcv(1) <= '1'; end if;

				a31(30 downto 0) <= ain(30 downto 0);  a31(31) <= '0';
				b31(30 downto 0) <= bin(30 downto 0);  b31(31) <= '0';
				sum31 <= std_logic_vector(  (signed(a31)  + signed(b31)) + signed(ca) );
				if( sout(32) /= sum31(31) ) then fnzcv(0) <= '1'; end if;

			end if;
			
			
			elsif(oper = "0110") then		--sbc
			temp1 <= signed( ain) + signed( not bin);
			sout <= std_logic_vector(  temp1  + signed(ca));
			
					
			if(sbit = '1') then
 
				fnzcv(3) <= sout(31);

				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;

				if(sout(32) = '1' ) then fnzcv(1) <= '1'; end if;

				a31(30 downto 0) <= ain(30 downto 0);  a31(31) <= '0';
				b31(30 downto 0) <= bin(30 downto 0);  b31(31) <= '0';
				sum31 <= std_logic_vector(  (signed(a31)  + signed( not b31)) + signed(ca));
				if( sout(32) /= sum31(31) ) then fnzcv(0) <= '1'; end if;

			end if;
			
			elsif(oper = "0111") then		--rsc
			temp1 <= signed(not ain) + signed(bin);
			sout <= std_logic_vector(  temp1  + signed(ca));
			
					
			if(sbit = '1') then
 
				fnzcv(3) <= sout(31);

				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;

				if(sout(32) = '1' ) then fnzcv(1) <= '1'; end if;

				a31(30 downto 0) <= ain(30 downto 0);  a31(31) <= '0';
				b31(30 downto 0) <= bin(30 downto 0);  b31(31) <= '0';
				sum31 <= std_logic_vector(  (signed(not a31)  + signed(b31)) + signed(ca) );
				if( sout(32) /= sum31(31) ) then fnzcv(0) <= '1'; end if;

			end if;
			
			elsif(oper = "1000") then 		--tst
			sout <= ain and bin;
					if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1'; end if;
               fnzcv(3) <= sout(31);

			
			
			elsif(oper = "1001") then		--teq
			sout <= ain xor bin;
					if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1'; end if;
               fnzcv(3) <= sout(31);

			
			elsif(oper = "1010") then		--cmp
			temp1 <= signed( ain) + signed( not bin );
			sout <= std_logic_vector(  temp1 + signed(one));
			
 
				fnzcv(3) <= sout(31);

				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;

				if(sout(32) = '1' ) then fnzcv(1) <= '1'; end if;

				a31(30 downto 0) <= ain(30 downto 0);  a31(31) <='0';
				b31(30 downto 0) <= bin(30 downto 0);  b31(31) <='0';
				sum31 <= std_logic_vector(  (signed(a31)  + signed(b31)) + signed(one));
				if( sout(32) /= sum31(31) ) then fnzcv(0) <= '1'; end if;

			
			
			elsif(oper = "1011") then		--cmn
			sout <= std_logic_vector(signed(  ain ) + signed(bin));
			
				
				fnzcv(3) <= sout(31);

				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;

				if(sout(32) = '1' ) then fnzcv(1) <= '1'; end if;

				a31(30 downto 0) <= ain(30 downto 0);  a31(31) <='0';
				b31(30 downto 0) <= bin(30 downto 0);  b31(31) <='0';
				sum31 <= std_logic_vector(  (signed(a31)  + signed(b31)) );
				if( sout(32) /= sum31(31) ) then fnzcv(0) <= '1'; end if;
				
				
			
			elsif(oper = "1100") then		--orr
			sout <= ain or bin;
								
				if(sbit = '1') then
				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;
				fnzcv(3) <= sout(31);
				end if;
			
			elsif(oper = "1101") then		--mov
			sout(31 downto 0) <= b;
								
				if(sbit = '1') then
				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;
				fnzcv(3) <= sout(31);
				end if;
			
			elsif(oper = "1110") then		--bic
			sout <= ain and ( not bin) ;
			
								
				if(sbit = '1') then
				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;
				fnzcv(3) <= sout(31);
				end if;
			
			elsif(oper = "1111") then		--mvn
			sout <= not bin;
								
				if(sbit = '1') then
				if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1';  end if;
				fnzcv(3) <= sout(31);
				end if;
			
			end if;
			
else 

			temp1 <= signed(not ain) + signed(bin);
			temp2 <= std_logic_vector(  temp1  * signed(ca));
			sout <= temp2(32 downto 0);
										
					if(sbit = '1') then
					if (sout(31 downto 0) = "00000000000000000000000000000000") then fnzcv(2) <= '1'; end if;
					fnzcv(3) <= sout(31);
					--carry bit set to arbitrary value
					end if;
end if;

nzcv <= fnzcv;
outans(31 downto 0) <= sout(31 downto 0);

			
end process ;

end Behavioral;

