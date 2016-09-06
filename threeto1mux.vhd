LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity threeto1mux is port(
a,b,c: in std_logic_vector(31 downto 0);
d: out std_logic_vector(31 downto 0);
op: in std_logic_vector(1 downto 0));
end threeto1mux;

architecture sigh of threeto1mux is
begin
	process(a,b,c,op)
begin
	case op is
		when "00" => d <= a;
		when "01" => d <= b;
		when "10" => d <= c;
		when "11" => d <= a;
	end case;
end process;
end sigh;