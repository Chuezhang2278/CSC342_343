library ieee;
use ieee.std_logic_1164.all;

entity ZHANG_SEPTEMBER19_FullAdder is
	port (ZHANG_SEPTEMBER19_A, ZHANG_SEPTEMBER19_B, ZHANG_SEPTEMBER19_Cin : in std_logic;
			ZHANG_SEPTEMBER19_Sum, ZHANG_SEPTEMBER19_Cout : out std_logic);
end ZHANG_SEPTEMBER19_FullAdder;

architecture ZHANG_SEPTEMBER19_arch of ZHANG_SEPTEMBER19_FullAdder is
	component ZHANG_SEPTEMBER19_HalfAdder
		port(ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic;
			  ZHANG_SEPTEMBER19_S, ZHANG_SEPTEMBER19_C : out std_logic);
	end component;

	signal ZHANG_SEPTEMBER19_int1, ZHANG_SEPTEMBER19_int2, ZHANG_SEPTEMBER19_int3 : std_logic;
	
	begin
		ZHANG_SEPTEMBER19_HA1 : ZHANG_SEPTEMBER19_HalfAdder port map ( ZHANG_SEPTEMBER19_A, 
																						   ZHANG_SEPTEMBER19_B,
																						   ZHANG_SEPTEMBER19_int1,
																						   ZHANG_SEPTEMBER19_int2);
																						  
		ZHANG_SEPTEMBER19_HA2 : ZHANG_SEPTEMBER19_HalfAdder port map ( ZHANG_SEPTEMBER19_int1,
																							ZHANG_SEPTEMBER19_Cin,
																							ZHANG_SEPTEMBER19_Sum,
																							ZHANG_SEPTEMBER19_int3);
																							
		ZHANG_SEPTEMBER19_Cout <= ZHANG_SEPTEMBER19_int3 or ZHANG_SEPTEMBER19_int2;

end ZHANG_SEPTEMBER19_arch;