-------------------------------------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY DPandMMD IS
PORT( -- clock Signal
Clk, mClk : IN STD_LOGIC;
--Memory Signals
WEN, EN : IN STD_LOGIC;
-- Register Control Signals (CLR and LD).
Clr_A , Ld_A : IN STD_LOGIC;
Clr_B , Ld_B : IN STD_LOGIC;
Clr_C , Ld_C : IN STD_LOGIC;
Clr_Z , Ld_Z : IN STD_LOGIC;
Clr_PC , Ld_PC : IN STD_LOGIC;
Clr_IR , Ld_IR : IN STD_LOGIC;
-- Register outputs (Some needed to feed back to control unit. Others pulled out for testing.
Out_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
Out_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
Out_C : OUT STD_LOGIC;
Out_Z : OUT STD_LOGIC;
Out_PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
Out_IR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
-- Special inputs to PC.
Inc_PC : IN STD_LOGIC;
-- Address and Data Bus.
ADDR_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
DATA_IN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
DATA_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
-- Various MUX controls.
DATA_Mux: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
REG_Mux : IN STD_LOGIC;
PC_Mux : IN STD_LOGIC;
IM_MUX1 : IN STD_LOGIC;
IM_MUX2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
-- ALU Operations.
ALU_Op : IN STD_LOGIC_VECTOR(2 DOWNTO 0));
END DPandMMD;
---------------------------------------------------------------------------------------------------------------------------
ARCHITECTURE description OF DPandMMD IS

component memory IS
PORT(
clk : IN STD_LOGIC;
addr : IN UNSIGNED(7 DOWNTO 0); 
data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
wen : IN STD_LOGIC;
en : IN STD_LOGIC;
data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)); 
END component;

component register32 is 
port(
	d : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- input.
	ld : IN STD_LOGIC; -- load/enable.
	clr : IN STD_LOGIC; -- async. clear.
	clk : IN STD_LOGIC; -- clock.
	Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)); -- output.
end component register32;

component pc is
port(
clr : IN STD_LOGIC;
clk : IN STD_LOGIC;
ld : IN STD_LOGIC;
inc : IN STD_LOGIC;
d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
q : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0));
END component pc;

component ALUa is
PORT( 
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
op : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
cout : OUT STD_LOGIC;
zero : OUT STD_LOGIC);
END component ALUa;

component twoto1Mux is 
port(
a,b: in std_logic_vector(31 downto 0);
c: out std_logic_vector(31 downto 0);
op: in std_logic);
end component twoto1Mux;

component reducer is 
port(
a: in std_logic_vector(31 downto 0);
b: inout std_logic_vector(7 downto 0));
end component reducer;

component lze is 
port(
a: in std_logic_vector(31 downto 0);
b: out std_logic_vector(31 downto 0));
end component lze;

component uze is 
port(
a: in std_logic_vector(31 downto 0);
b: out std_logic_vector(31 downto 0));
end component uze;

component threeto1mux is 
port(
a,b,c: in std_logic_vector(31 downto 0);
d: out std_logic_vector(31 downto 0);
op: in std_logic_vector(1 downto 0));
end component threeto1mux;

signal allie : std_logic_vector(31 downto 0);
signal ben : std_logic_vector(31 downto 0);
signal coleen: std_logic_vector(7 downto 0);
signal derek : std_logic_vector(31 downto 0);
signal erin : std_logic_vector(31 downto 0);
signal frank : std_logic_vector(31 downto 0);
signal garen : std_logic_vector(31 downto 0);
signal hubert : std_logic_vector(31 downto 0);
signal irene : std_logic_vector(31 downto 0);
signal jack : std_logic_vector(31 downto 0);
signal kevin : std_logic_vector(31 downto 0);
signal luke : std_logic_vector(31 downto 0);
signal michael : std_logic_vector(31 downto 0);
signal nancy : std_logic_vector(31 downto 0);
signal olivia : std_logic_vector(31 downto 0);
signal pamela : std_logic;
signal quin : std_logic;



-- Component instantiations -- you figure this out
-- Internal signals -- you decide what you need
BEGIN
--portmap

	datamem: memory port map(
			wen => WEN,
			en => EN,
			clk => Clk,
			addr => unsigned(coleen),
			data_in => ben,
			data_out => allie);
			
	regmux: twoto1Mux port map(
			a => derek,
			b => erin,
			c => ben,
			op => REG_Mux);
			
	reducer1: reducer port map(
			a => frank,
			b => coleen);
			
	dapc: pc port map(
			clr => Clr_PC,
			clk => Clk,
			ld => Ld_PC,
			inc => Inc_PC,
			d => garen,
			q => hubert);
			
	lze1: lze port map(
			a => frank,
			b => irene);
			
	pcmux: twoto1Mux port map(
			a => irene,
			b => hubert,
			c => garen,
			op => PC_Mux);
			
	datamux: threeto1mux port map(
			a => DATA_IN,
			b => allie,
			c => jack,
			d => kevin,
			op => DATA_Mux);
			
	aluman: ALUa port map(
			a => luke,
			b => michael,
			op => ALU_Op,
			result => jack,
			cout => pamela,
			zero => quin);
			
	immux1: twoto1Mux port map(
			a => derek,
			b => nancy,
			c => luke,
			op => IM_MUX1);
			
	immux2: threeto1mux port map(
			a => erin,
			b => olivia,
			c => (Others => '1'),
			d => michael,
			op => IM_MUX2);
			
	lze2: lze port map(
			a => frank,
			b => olivia);
			
	uze1: uze port map(
			a => frank,
			b => nancy);
			
			


Out_A <= frank;
Out_B <= erin;
Out_C <= pamela;
Out_Z <= quin;
Out_PC <= hubert;
Out_IR <= frank;
ADDR_OUT <= hubert;		
DATA_OUT <= allie;
	
	
--process()
--begin

-- you fill in the details
END description;
-------------------------------------------------------------------------------------------------------------------------





