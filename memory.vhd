LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY memory IS
PORT(
clk : IN STD_LOGIC;
addr : IN UNSIGNED(7 DOWNTO 0); 
data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
wen : IN STD_LOGIC;
en : IN STD_LOGIC;
data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)); 
END memory;
ARCHITECTURE Description OF memory IS
type darray is array(0 to 255) of integer;
signal thearray: darray;
signal temp : integer;

BEGIN
	process(en,clk,data_in,wen,addr)
-- define array type and signal to store data 

BEGIN
temp <= to_integer(addr);
	if (clk'event and clk = '0') then
		if(en = '1') then
			if(wen = '1') then
					--thearray(temp) <= to_integer(unsigned(data_in));
				
			else
					--data_out <= std_logic_vector((to_unsigned(thearray(temp), 32))) ;
			end if;
		end if;
	end if;
end process;
--Make it work!
END Description;