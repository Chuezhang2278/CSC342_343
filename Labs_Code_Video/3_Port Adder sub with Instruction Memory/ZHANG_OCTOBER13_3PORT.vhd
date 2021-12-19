LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ZHANG_3PORT is
	PORT
		(
			ZHANG_clock		: IN STD_LOGIC  := '1';
			ZHANG_data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			ZHANG_rdaddress1		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			ZHANG_rdaddress2		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			ZHANG_wraddress		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			ZHANG_wren		: IN STD_LOGIC  := '0';
			ZHANG_q1		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			ZHANG_q2		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
end ZHANG_3PORT;

architecture ZHANG_arch of ZHANG_3PORT is
	component zhang_32x4_2port
		PORT
			(
				clock		: IN STD_LOGIC  := '1';
				data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
				rdaddress		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
				wraddress		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
				wren		: IN STD_LOGIC  := '0';
				q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
		end component;

		begin
		
		ZHANG_RAM1: zhang_32x4_2port port map (ZHANG_clock, ZHANG_data, ZHANG_rdaddress1, ZHANG_wraddress, ZHANG_wren, ZHANG_q1);
		ZHANG_RAM2: zhang_32x4_2port port map (ZHANG_clock, ZHANG_data, ZHANG_rdaddress2, ZHANG_wraddress, ZHANG_wren, ZHANG_q2);
		
end ZHANG_arch;