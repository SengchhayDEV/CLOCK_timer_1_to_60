library ieee;
use ieee.std_logic_1164.all;

entity BCD_to_7seg is
	port(
		bcd : in std_logic_vector(3 downto 0);
		seg : out std_logic_vector(6 downto 0)
	);
end entity;

architecture lut of BCD_to_7seg is
	signal r : std_logic_vector(7 downto 0);
begin
	with bcd select
		r <= 	x"3F" when x"0",
				x"06" when x"1",
				x"5B" when x"2",
				x"4F" when x"3",
				x"66" when x"4",
				x"6D" when x"5",
				x"7D" when x"6",
				x"07" when x"7",
				x"7F" when x"8",
				x"6F" when x"9",
				(others => '0') when others;
	seg <= r (6 downto 0);
end lut;
