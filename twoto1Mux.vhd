LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity twoto1Mux is port(
a,b: in std_logic_vector(31 downto 0);
c: out std_logic_vector(31 downto 0);
op: in std_logic);
end twoto1Mux;

architecture description of twoto1Mux is
begin
	process(a,b,op)
begin
	case op is
		when '0' => c <= a;
		when '1' => c <= b;
	end case;
end process;

end description;