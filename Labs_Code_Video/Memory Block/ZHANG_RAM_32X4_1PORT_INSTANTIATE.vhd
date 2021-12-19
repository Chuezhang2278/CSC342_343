LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ZHANG_RAM_32X4_1PORT_INSTANTIATE is 
	PORT
	(
		ZHANG_address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		ZHANG_clock		: IN STD_LOGIC  := '1';
		ZHANG_data		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		ZHANG_wren		: IN STD_LOGIC ;
		ZHANG_q		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
end ZHANG_RAM_32X4_1PORT_INSTANTIATE;

architecture ZHANG_arch of ZHANG_RAM_32X4_1PORT_INSTANTIATE is
	component ZHANG_RAM_32x4
		port
		(
			address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
		);
	end component;
	
	begin
		ZHANG_RAM1: ZHANG_RAM_32X4 port map (ZHANG_address, ZHANG_clock, ZHANG_data, ZHANG_wren, ZHANG_q);
	
end ZHANG_arch;
