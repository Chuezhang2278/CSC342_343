library IEEE;
use IEEE.std_logic_1164.all;

entity Zhang_register_N_VHDL is
	generic (N: integer := 32);
	port (
		zhang_clk : in std_logic;
		zhang_wren: in std_logic;
		zhang_rden: in std_logic;
		zhang_chen: in std_logic;
		zhang_data: in std_logic_vector(N-1 downto 0);
		zhang_q: out std_logic_vector(N-1 downto 0));
end Zhang_register_N_VHDL;

architecture arch of Zhang_register_N_VHDL is 
	
	signal zhang_storage : std_logic_vector(N-1 downto 0);
	
	begin
		process (zhang_clk)
		begin
			if (rising_edge(zhang_clk) and zhang_wren = '1')
				then zhang_storage <= zhang_data;
			end if;
		end process;
		process (zhang_rden, zhang_chen, zhang_storage)
		begin
			if (zhang_rden = '1' and zhang_chen = '1')
				then zhang_q <= zhang_storage;
			elsif (zhang_chen = '0')
				then zhang_q <= (others => 'Z');
			end if;
		end process;
end arch;