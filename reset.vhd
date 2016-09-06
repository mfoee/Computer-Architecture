LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY reset IS
PORT
(
reset : IN STD_LOGIC;
clk : IN STD_LOGIC;
Enable_PD : OUT STD_LOGIC;
Clr_PC : OUT STD_LOGIC
);
END reset;
ARCHITECTURE description OF reset IS
signal count: integer:=0;
-- you fill in what goes here.

BEGIN
	process(reset,clk,count)
	begin	
	
		if(clk'event and clk = '1') then
			case reset is
			when '1' =>
				Enable_PD <= '0';
				Clr_PC <= '1';
				count <= 1;
			when '0'=>
				if(count = 0) then
					Enable_PD <= '1';
					Clr_PC <= '0';
				end if;
				if(count >= 1 and count <=3) then
					count <= count + 1;
				end if;
				if(count = 4) then
					Enable_PD <= '1';
					Clr_PC <= '0';
					count <= 0;
				end if;
			end case;
		end if;
	end process;
end description;