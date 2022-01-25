library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity timerdisplay is
	port(
		SW : in std_logic_vector(9 downto 0);
		CLOCK_50_B5B : in std_logic;
		LEDR : out std_logic_vector(9 downto 0);
		HEX0 : out std_logic_vector(6 downto 0);
		HEX1 : out std_logic_vector(6 downto 0)
	);
end entity;

architecture rtl of timerdisplay is
	signal x : std_logic_vector(7 downto 0);
	signal seg0: std_logic_vector(6 downto 0);
	signal seg1: std_logic_vector(6 downto 0);
	signal seg2: std_logic_vector(6 downto 0);
begin
	u1: work.timer_v1 port map (
		run 	=> SW(0),
		clear	=> SW(1),
		clk	=> CLOCK_50_B5B,
		is_60 => LEDR(0),
		count => x);
	u2: work.Display_interface port map(
		bin	=> x,
		seg0	=> seg0,
		seg1	=> seg1,
		seg2	=> open);
	HEX0 <= not seg0;
	HEX1 <= not seg1;
end rtl;
