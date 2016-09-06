LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY register32 IS
PORT(
d : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- input.
ld : IN STD_LOGIC; -- load/enable.
clr : IN STD_LOGIC; -- async. clear.
clk : IN STD_LOGIC; -- clock.
Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)); -- output.
END register32;
ARCHITECTURE description OF register32 IS
BEGIN
	process(clr,ld,d,clk)
	begin
		if (clr='1') then
			Q <= (others =>'0');
		elsif (clk'event and clk = '1') then
		if (ld='1') then
			Q <= d;
		end if;
		end if;
		end process;
-- You fill in what goes here!!!!
END description;