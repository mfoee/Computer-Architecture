LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity reducer is port(
a: in std_logic_vector(31 downto 0);
b: out std_logic_vector(7 downto 0));
end reducer;

architecture description of reducer is
begin
	process(a)
begin
	b <= a(7 downto 0);
end process;
end description;