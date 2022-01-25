library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity Display_interface is
	port (
		Bin : in std_logic_vector (7 downto 0);
		
		seg0 : out std_logic_vector(6 downto 0);
		seg1 : out std_logic_vector(6 downto 0);
		seg2 : out std_logic_vector(6 downto 0)
	);

end entity;

architecture structure of Display_Interface is
	signal bcd0 : std_logic_vector(3 downto 0);
	signal bcd1 : std_logic_vector(3 downto 0);
	signal bcd2 : std_logic_vector(3 downto 0);
begin
	u0 : work.Bin_to_BCD_8_Bits port map(Bin => BIN,
													bcd0 => BCD0,
													bcd1 => BCD1,
													bcd2 => BCD2);
	u1 : work.BCD_to_7seg port map (bcd => bcd0,
												seg => seg0);
	u2 : work.BCD_to_7seg port map (bcd => bcd1,
												seg => seg1);
	u3 : work.BCD_to_7seg port map (bcd => bcd2,
												seg => seg2);
end architecture;
