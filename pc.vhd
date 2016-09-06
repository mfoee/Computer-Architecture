LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY pc IS
PORT(
clr : IN STD_LOGIC;
clk : IN STD_LOGIC;
ld : IN STD_LOGIC;
inc : IN STD_LOGIC;
d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
q : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0));
END pc;
ARCHITECTURE description OF pc IS
BEGIN
	process(clk,d,ld,clr,inc)
	begin
		if clr = '1' then
			q <= (others =>'0');
		elsif (clk'event and clk = '1') then
		if (ld = '1') then
		if (inc = '0') then
			q <= d;
		elsif (inc = '1') then
			q <= q + 1;
		end if;
		end if;
		end if;
	end process;
-- you fill in what goes here!!!
END description;