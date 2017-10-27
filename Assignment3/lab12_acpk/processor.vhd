library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity processor is
	PORT (
		clk : in std_logic ;
		output : out std_logic_vector(7 downto 0)
	);
end processor;

architecture Behavioral of processor is
component IR
port(clk : in std_logic;
		enable : in std_logic;
		input : in std_logic_vector (15 downto 0);
		output : out std_logic_vector (15 downto 0)
		);
end component;

component PC
port(clk : in std_logic;
		enable : in std_logic;
		input : in std_logic_vector (7 downto 0);
		output : out std_logic_vector (7 downto 0)

);
end component;

component registerFile
port(clk : in std_logic;
		input: in  std_logic_vector(7 downto 0);
		addr : in std_logic_vector( 3 downto 0);
		enable : in std_logic;
		reset : in std_logic;
		output : out std_logic_vector(7 downto 0)
 
);
end component;

component BRAM
		PORT (
       clka  : IN STD_LOGIC;
       wea   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
       addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       dina  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
end component;

	signal T : std_logic_vector(2 downto 0):= (others => '0');
	signal RAM_input : std_logic_vector (15 downto 0):= (others => '0');
	signal RAM_addr : std_logic_vector (7 downto 0):= (others => '0');
	signal RAM_output : std_logic_vector (15 downto 0):= (others => '0');
	--signal RAM_input : std_logic_vector (15 downto 0);
	signal IR_input : std_logic_vector (15 downto 0):= (others => '0');
	signal IR_output:std_logic_vector (15 downto 0):= (others => '0');
	signal RAM_e:STD_LOGIC_VECTOR(0 DOWNTO 0):= (others => '0');
  
	signal PC_e:std_logic:=  '0';
	signal PC_input:std_logic_vector (7 downto 0):= (others => '0');
	signal PC_output:std_logic_vector (7 downto 0):= (others => '0');
--	signal IR_output:std_logic_vector (15 downto 0):= (others => '0');
	signal REG_input : std_logic_vector (7 downto 0):= (others => '0');
	signal REG_output:std_logic_vector (7 downto 0):= (others => '0');
	signal REG_addr:std_logic_vector (3 downto 0):= (others => '0');
	signal REG_e:std_logic:= '0';
	signal REG_reset:std_logic:= '0';
	
	signal OPC : std_logic_vector(2 downto 0) := (others => '0');
	signal temp1 : std_logic_vector(3 downto 0):= (others => '0');
	signal temp2 : std_logic_vector(3 downto 0):= (others => '0');
	signal PC_temp : std_logic_vector(7 downto 0):= (others => '0');
	signal BNE_temp : std_logic_vector(7 downto 0):= (others => '0');
	signal chnge_adr : std_logic_vector(4 downto 0):= (others => '0');
	signal add1 : std_logic_vector(7 downto 0):= (others => '0'); ---check
	signal mul1 : std_logic_vector(7 downto 0):= (others => '0');	
	signal mul2 : std_logic_vector(15 downto 0):= (others => '0');	
	shared variable temp : std_logic_vector(4 downto 0);
begin
RAM_t : BRAM PORT MAP (clka => not(clk), dina => RAM_input, addra => RAM_addr, wea => RAM_e, douta => RAM_output);
IR_t : IR PORT MAP (clk => not(clk), enable => IR_e, input => IR_input, output => IR_output);
PC_t : PC PORT MAP (clk => not(clk), enable => PC_e, input => PC_input, output => PC_output);
REG : registerFile PORT MAP (clk => not(clk), input => REG_input, addr => REG_addr, enable => REG_e, reset => REG_reset, output => REG_output);

OPC <= IR_output(15 downto 13);

--output<=Ram_output(7 downto 0);
process(clk) begin
if(rising_edge(clk)) then
	if(T = "000") then 										--000
		RAM_e <= "0";
		PC_e <= '0';
		PC_temp <= PC_output;
		IR_e <= '1';
		REG_e <= '0';
		T <= T + 1;
		RAM_addr <= PC_output;		
	elsif(T = "001") then									--1
		IR_input <= RAM_output;
		T <= T + 1;
	elsif(T = "010") then									--2
		T <= T + 1;
		IR_e <= '1';
	elsif(T = "011") then									--3
		T <= T + 1;
		IR_E <= '0';
		PC_input <= PC_temp + 1;
		PC_e <= '1';
		if(OPC = "000") then --LOAD
			REG_addr <= IR_output(8 downto 5);				---look here
		elsif(OPC = "001") then	--STORE
			REG_addr <= IR_output(12 downto 9);
		elsif(OPC = "010") then --MOVE
			REG_addr <= IR_output(12 downto 9);
			REG_e <= '1';
			REG_input <= IR_output(8 downto 1);
		elsif(OPC = "011") then --ADD
			REG_addr<=IR_output(8 downto 5);
		elsif(OPC = "100") then --MUL
			REG_addr<=IR_output(8 downto 5);
		elsif(OPC = "101") then --JMP
			PC_e <= '1';
		elsif(OPC = "110") then --BNE
			REG_addr <= IR_output(12 downto 9);
		elsif(OPC = "111") then --STOP
			RAM_addr <= "11111111";
			RAM_e <= "0";
			output <= ram_output(7 downto 0);
		end if;
		  
	elsif(T = "100") then									--4
		T <= T + 1;
		if(OPC = "000") then --LOAD
			RAM_addr <= REG_output;
			REG_e <= '1';
		elsif(OPC = "001") then	--DTORE
			RAM_addr <= REG_output;
		elsif(OPC = "010") then --MOVE
			REG_e <= '1';
		elsif(OPC = "011") then --ADD
			add1<=REG_output;
			REG_ADDR<=IR_output(4 DOWNTO 1);
		elsif(OPC = "100") then --MUL
			mul1 <= REG_output;
			REG_ADDR <= IR_output(4 DOWNTO 1);
		elsif(OPC = "101") then --JMP
			PC_input <= IR_output(12 downto 5);
		elsif(OPC = "110") then --BNE
			BNE_temp <= REG_output;
		elsif(OPC = "111") then --STOP*
			RAM_addr <= "11111111";
			RAM_e <= "0";
			output <= ram_output(7 downto 0);
		end if;
		
	elsif(T = "101") then										--5
		T <= T + 1;
		if(OPC = "000") then --LOAD
			REG_e <= '1';
			REG_addr <= IR_output(12 downto 9);
			REG_input <= RAM_output (7 downto 0);
		elsif(OPC = "001") then	--DTORE
			REG_addr <= IR_output(8 downto 5);
			RAM_e<= "1";
			--RAM_input <= "00000000" & REG_output;							--CHECK HERE
		elsif(OPC = "010") then --MOVE
			REG_e <= '0'; 
		elsif(OPC = "011") then --ADD
			add1<=add1+REG_output;
			--	REg_e<='1';																--check immediately after
		elsif(OPC = "100") then --MUL
			mul2 <= mul1 * REG_output; --(7 downto 0);
			REG_e<='1';																
		elsif(OPC = "101") then --JMP
		elsif(OPC = "110") then --BNE
			REG_addr <= IR_output(8 downto 5);
			--PC_temp <= PC_output;
			if IR_output(4)='0' then
				chnge_adr<=(0=>IR_output(0),1=>IR_output(1),2=>IR_output(2),3=>IR_output(3),4=>IR_output(4),others=>'0');
			else
				temp:=IR_output(4 downto 0);
				temp:=temp-1;
				chnge_adr<=(0=>not temp(0),1=>not temp(1),2=>not temp(2),3=>not temp(3),4=>not temp(4),others=>'0');
			end if;		
			elsif(OPC = "111") then --STOP
		end if;
		
	elsif(T = "110") then										--6
		T <= "000";
		if(OPC = "000") then --LOAD
		elsif(OPC = "001") then	--DTORE
			RAM_input <= "00000000" & REG_output;							--CHECK HERE
		elsif(OPC = "010") then --MOVE
		elsif(OPC = "011") then --ADD
			Reg_e<='1';
			Reg_addr<=IR_output(12 downto 9);
			Reg_input<=add1;
		elsif(OPC = "100") then --MUL
			Reg_addr<=IR_output(12 downto 9);
			Reg_input<=mul2(7 downto 0);
		elsif(OPC = "101") then --JMP
		elsif(OPC = "110") then --BNE
			PC_e <= '1';
			if(REG_output /= BNE_temp) then
				if(IR_output(4) = '0') then PC_input <= PC_output + chnge_adr - 1;
				else	PC_input <= PC_output - chnge_adr - 1;
				end if;
			end if;
		elsif(OPC = "111") then --STOP
			T <= "111";
		end if;
	elsif(T = "111") then
		RAM_addr <= "11111111";									--xx
		RAM_e <= "0";												--xx
		output <= ram_output(7 downto 0);					--xx
	end if;
end if;
end process;
end Behavioral;