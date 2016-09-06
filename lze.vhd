LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity lze is port(
a: in std_logic_vector(31 downto 0);
b: out std_logic_vector(31 downto 0));
end lze;

architecture description of lze is
begin
	process(a)
begin
	b(31 downto 16) <= (others => '0');
	b(15 downto 0) <= a(15 downto 0);
end process;
end description;