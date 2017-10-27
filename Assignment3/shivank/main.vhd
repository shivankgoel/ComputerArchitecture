----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:36:39 03/11/2016 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
	PORT(
	clk :in std_logic
	);
end main;

architecture Behavioral of main is
	
component mux is
	PORT(
	a : in std_logic_vector(31 downto 0);
	b : in std_logic_vector(31 downto 0);
	ans : out std_logic_vector(31 downto 0);
	sel : in std_logic
	);
end component;

component add2four is
	PORT(
	a : in std_logic_vector(31 downto 0);
	b : in std_logic_vector(31 downto 0);
	ans : out std_logic_vector(31 downto 0)
	);
end component;

component add1four is
	PORT(
	a : in std_logic_vector(31 downto 0);
	ans : out std_logic_vector(31 downto 0)
	);
end component;

component progcount is
	PORT(
	clock :in std_logic;
	inp : in std_logic_vector (31 downto 0);
	oup : out std_logic_vector (31 downto 0)
	);
end component;

component shift2 is
	PORT(
	inp : in std_logic_vector(23 downto 0);
	oup : out std_logic_vector(31 downto 0)
	);
end component;

component bitextender is
	PORT(
	inp : in std_logic_vector(11 downto 0);
	oup : out std_logic_vector(31 downto 0)
	);
end component;

component instmem is
	PORT(
	clock : in std_logic;
	addr : in std_logic_vector(31 downto 0);
	outp1: out std_logic_vector(31 downto 0)
	);
end component;

component datamem is
	PORT(
		clock : in std_logic;
		addr : in std_logic_vector(31 downto 0);
		outp : out std_logic_vector(31 downto 0);
		mw : in std_logic;
		mr : in std_logic;
		writedata : in std_logic_vector(31 downto 0)	
	);
end component;

component regfile is
	PORT(
		clock : in std_logic;
		readadd1 : in std_logic_vector(3 downto 0);
		readadd2 : in std_logic_vector(3 downto 0);
		writeadd : in std_logic_vector(3 downto 0);
		inpdata : in std_logic_vector(31 downto 0);
		rw : in std_logic;
		out1 :out std_logic_vector(31 downto 0);
		out2 :out std_logic_vector(31 downto 0)
	);
end component;


component alucombine is
	PORT(
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		cin : in std_logic;
		sbit : in std_logic;
		mul : in std_logic;
		oper : in std_logic_vector(3 downto 0);
		outans : out std_logic_vector(31 downto 0);
		nzcv : out std_logic_vector(3 downto 0)
		);
end component;


component mux4bit is
	PORT(
	a : in std_logic_vector(3 downto 0);
	b : in std_logic_vector(3 downto 0);
	ans : out std_logic_vector(3 downto 0);
	sel : in std_logic
	);
end component;

component Actrl is
	PORT(
	inp : in std_logic_vector(5 downto 0);
	oup: out std_logic_vector(3 downto 0)
	);
end component;

component mainctrl is
	PORT(
		input: in std_logic_vector(31 downto 0);
		p :in std_logic;
		Rsrc : out std_logic;
		RW : out std_logic;
		MW : out std_logic;
		MR : out std_logic;
		Psrc : out std_logic;
		alumul : out std_logic;
		Fset : out std_logic;
		samt : out std_logic_vector(4 downto 0);
		stype : out std_logic_vector(1 downto 0)
	);
end component;

component bctrl is
	PORT(
		inpb : in std_logic_vector(3 downto 0);
		nzcvf : in std_logic_vector(3 downto 0);
		pans : out std_logic
	);
end component;


component rotateshift is
	PORT(
	rsinp : in std_logic_vector(31 downto 0);
	rsoup : out std_logic_vector(31 downto 0);  
	rstype : in std_logic_vector(1 downto 0); 
	amount : in std_logic_vector(4 downto 0)
	);
end component;

signal rsout,pcout,add4aout,add4bout,s2out,muxpout,imout,rfout1,rfout2,exout,amuxout,aluout,dmout,muxm2rout : std_logic_vector(31 downto 0) := (others => '0');
signal mux4out,aluop,aluflags : std_logic_vector(3 downto 0) := (others => '0');
signal bout,rw,mw1,mr1,rsrc,psrc , flagset , alumul1 : std_logic := '0';
signal shiftamt : std_logic_vector(4 downto 0) := (others => '0');
signal shifttype : std_logic_vector(1 downto 0) := (others => '0');
begin
mainctrlp : mainctrl PORT MAP (input=>imout,p=>bout,Rsrc=>rsrc,RW=>rw,MW=>mw1,MR=>mr1,Psrc=>psrc,alumul => alumul1,Fset=>flagset, samt => shiftamt , stype => shifttype);
p1 : progcount PORT MAP (clock=>clk,inp=>muxpout,oup=>pcout);
p2 : add1four PORT MAP (a=>pcout,ans=>add4aout);
p3 : add2four PORT MAP (a=>add4aout,b=>s2out,ans=>add4bout);
p4 : mux PORT MAP (a=>add4aout,b=>add4bout,ans=>muxpout,sel=>psrc);
p5 : instmem PORT MAP (clock=>clk,addr=>pcout,outp1=>imout);
p6 : mux4bit PORT MAP (a=>imout(3 downto 0),b=>imout(15 downto 12),ans=>mux4out,sel=>rsrc);
p7 : shift2 PORT MAP (inp=>imout(23 downto 0),oup=>s2out);
p8 : regfile PORT MAP (clock=>clk,readadd1=>imout(19 downto 16),readadd2=>mux4out,writeadd=>imout(15 downto 12),inpdata=>muxm2rout,rw=>rw,out1=>rfout1,out2=>rfout2);
p9 : mux PORT MAP (a=>exout,b=>rfout2,ans=>amuxout,sel=>rsrc);
p10 : bitextender PORT MAP (inp=>imout(11 downto 0),oup=>exout);
p11 : alucombine PORT MAP(a=>rfout1 , b =>rsout , cin =>aluflags(1) , sbit => flagset , mul => alumul1 , oper => aluop, outans=> aluout , nzcv=>aluflags );
p12 : datamem PORT MAP (clock=>clk , addr=>aluout , outp=>dmout , mw=>mw1, mr=>mr1 , writedata=>rfout2 );
p13 : mux PORT MAP (a=>aluout,b=>dmout,ans=>muxm2rout,sel=>rsrc);
actrlp: Actrl PORT MAP (inp => imout(26 downto 21 ), oup =>aluop);
bctrlp : bctrl PORT MAP (inpb => imout(24 downto 21),nzcvf => aluflags ,pans => bout );
rotsif: rotateshift PORT MAP(rsinp=>amuxout,rsoup=>rsout,rstype=>shifttype,amount=>shiftamt);

process begin
wait until clk'event and clk='1';

end process;
end Behavioral;

