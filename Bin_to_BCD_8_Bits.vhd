library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Bin_to_BCD_8_Bits is
	port(
	BIN : in std_logic_vector(7 downto 0);
	BCD2: out std_logic_vector(3 downto 0);
	BCD1:	out std_logic_vector(3 downto 0);
	BCD0: out std_logic_vector(3 downto 0)
	);
end entity;

architecture rtl of Bin_to_BCD_8_Bits is
	signal u0 : unsigned (3 downto 0);
	signal u1 : unsigned (3 downto 0);
	signal u2 : unsigned (3 downto 0);
	signal u3 : unsigned (3 downto 0);
	signal u4 : unsigned (3 downto 0);
	signal u5 : unsigned (3 downto 0);
	signal u6 : unsigned (3 downto 0);
	signal s0 : unsigned (3 downto 0);
	signal s1 : unsigned (3 downto 0);
	signal s2 : unsigned (3 downto 0);
	signal s3 : unsigned (3 downto 0);
	signal s4 : unsigned (3 downto 0);
	signal s5 : unsigned (3 downto 0);
	signal s6 : unsigned (3 downto 0);
begin
	
	s0 <= unsigned('0' & BIN(7 downto 5));
	u0 <= s0 + 3 when s0 > 4 else
	s0;
	s1 <= u0(2 downto 0) & BIN(4);
	u1 <= s1 + 3 when s1 > 4 else
	s1;
	s2 <= u1(2 downto 0) & BIN(3);
	u2 <= s2 + 3 when s2 > 4 else
	s2;
	s3 <= u2(2 downto 0) & BIN(2);
	u3 <= s3 + 3 when s3 > 4 else
	s3;
	s4 <= u3(2 downto 0) & BIN(1);
	u4 <= s4 + 3 when s4 > 4 else
	s4;
	s5 <= '0' & u0(3) & u1(3) & u2(3);
	u5 <= s5 + 3 when s5 > 4 else
	s5;
	s6 <= u5(2 downto 0) & u3(3);
	u6 <= s6 + 3 when s6 > 4 else
	s6;
	BCD2 <= "00" & u5(3) & u6(3);
	BCD1 <= std_logic_vector(u6(2 downto 0) & u4(3));
	BCD0 <= std_logic_vector(u4(2 downto 0) & BIN(0));

end architecture;
