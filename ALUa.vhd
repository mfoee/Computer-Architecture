LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ALUa IS PORT( 
a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
op : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
tresult: BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
temp: BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
cout : OUT STD_LOGIC;
zero : OUT STD_LOGIC);
END ALUa;
ARCHITECTURE description OF ALUa IS
BEGIN
	process(a,b,op)
	begin
		case OP is
			when "000" =>
				tresult <= a AND b;
				result <= tresult;
				temp(0) <= (a(0) AND b(0)) OR (op(2) AND a(0)) OR (op(2) AND b(0));
				for i in 1 to 31 loop
					temp(i) <= (a(i) AND b(i)) OR (temp(i-1) AND a(i)) OR (temp(i-1) AND b(i));
				end loop;
					cout <= temp(31);
				if (tresult = "00000000000000000000000000000000" ) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				
			when "001" =>
				tresult <= a OR b;
				result <= tresult;
				temp(0) <= (a(0) AND b(0)) OR (op(2) AND a(0)) OR (op(2) AND b(0));
				for i in 1 to 31 loop
					temp(i) <= (a(i) AND b(i)) OR (temp(i-1) AND a(i)) OR (temp(i-1) AND b(i));
				end loop;
					cout <= temp(31);
				if (tresult = "00000000000000000000000000000000" ) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				
			when "010" =>
				tresult(0) <= a(0) XOR (b(0) XOR op(2));
				result(0) <= tresult(0);
				temp(0) <= (a(0) AND b(0)) OR (op(2) AND a(0)) OR (op(2) AND b(0));
				for i in 1 to 31 loop			
					tresult(i) <= a(i) XOR (b(i) XOR temp(i-1));
					result(i) <= tresult(i);
					temp(i) <= (a(i) AND b(i)) OR (temp(i-1) AND a(i)) OR (temp(i-1) AND b(i));
				end loop;
					cout <= temp(31);
				if (tresult = "00000000000000000000000000000000" ) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				
			when "011" =>
				if(a=b) then
					zero <= '1';
					result <= (others => '0');
				else
					zero <= '0';
				end if;
				temp(0) <= (a(0) AND b(0)) OR (op(2) AND a(0)) OR (op(2) AND b(0));
				for i in 1 to 31 loop			
					tresult(i) <= a(i) XOR (b(i) XOR temp(i-1));
					result(i) <= tresult(i);
					temp(i) <= (a(i) AND b(i)) OR (temp(i-1) AND a(i)) OR (temp(i-1) AND b(i));
				end loop;
					cout <= temp(31);
				
			when "110" =>
					tresult(0) <= a(0) XOR (NOT b(0) XOR op(2));
					result(0) <= tresult(0);
					temp(0) <= (a(0) AND NOT b(0)) OR (op(2) AND a(0)) OR (op(2) AND NOT b(0));	
				for i in 1 to 31 loop				
					tresult(i) <= a(i) XOR (NOT b(i) XOR temp(i-1));
					result(i) <= tresult(i);
					temp(i) <= (a(i) AND NOT b(i)) OR (temp(i-1) AND a(i)) OR (temp(i-1) AND NOT b(i));
				end loop;
					cout <= temp(31);
				if (tresult = "00000000000000000000000000000000" ) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				
			when "111" =>
				cout <= '1';
				if (tresult = "00000000000000000000000000000000" ) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				
			when "100" =>
				tresult <= a(30 DOWNTO 0) & '0';
				result <= tresult;
				temp(0) <= (a(0) AND NOT b(0)) OR (op(2) AND a(0)) OR (op(2) AND NOT b(0));	
				for i in 1 to 31 loop				
					temp(i) <= (a(i) AND NOT b(i)) OR (temp(i-1) AND a(i)) OR (temp(i-1) AND NOT b(i));
				end loop;
					cout <= temp(31);
				if (tresult = "00000000000000000000000000000000" ) then
					zero <= '1';
				else
					zero <= '0';
				end if;
					
			when "101" =>
				tresult <= '0' & a(31 DOWNTO 1);
				result <= tresult;
				temp(0) <= (a(0) AND NOT b(0)) OR (op(2) AND a(0)) OR (op(2) AND NOT b(0));	
				for i in 1 to 31 loop				
					temp(i) <= (a(i) AND NOT b(i)) OR (temp(i-1) AND a(i)) OR (temp(i-1) AND NOT b(i));
				end loop;
					cout <= temp(31);
				if (tresult = "00000000000000000000000000000000" ) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				
		end case;
	end process;
END description;