library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity timer_v1 is
    port (
        clk : in std_logic;
        clear : in std_logic;
        run : in std_logic;
        
        count : out std_logic_vector(7 downto 0);
        is_60 : out std_logic
    );
end entity;
architecture rtl of timer_v1 is
    constant FREQ_IN  : natural := 50_000_000; -- Hz
    constant FREQ_OUT : natural := 1; -- Hz
    constant DIVIDER_COUNT : natural := (FREQ_IN/FREQ_OUT) - 1;
    constant COUNT_MAX : natural := 60;
    
    signal sclk: std_logic;
    signal count_reg: unsigned(7 downto 0);
    
begin
    process(clk)
        variable i : natural;
    begin
        -- count process
        if rising_edge(clk) then
            if run = '1' then
                if i = DIVIDER_COUNT then
                    i := 0;
                    sclk <= '1';
                else
                    i := i + 1;
                    sclk <= '0';
                end if;
            end if;
        end if;
        
    end process;
    
    process(sclk, clear)
    begin
        if clear = '1' then
            count_reg <= (others => '0');
        elsif rising_edge(sclk) then
            if count_reg < COUNT_MAX then
                count_reg <= count_reg + 1;
            end if;
        end if;
    end process;
	 
	 process(sclk)
	 begin
		if rising_edge(sclk) then
			if count_reg = 60 then 
				is_60 <= '1';
			else
				is_60 <= '0';
			end if;
		end if;
	 end process;
    
    count <= std_logic_vector(count_reg);
end rtl;
