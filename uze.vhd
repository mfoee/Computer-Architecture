LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity uze is port(
a: in std_logic_vector(31 downto 0);
b: out std_logic_vector(31 downto 0));
end uze;

architecture description of uze is
begin
	process(a)
begin
	b(31 downto 16) <= a(15 downto 0);
	b(15 downto 0) <= (others => '0');
end process;
end description;