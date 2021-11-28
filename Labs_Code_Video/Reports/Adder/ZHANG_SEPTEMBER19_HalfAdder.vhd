library ieee;
use ieee.std_logic_1164.all;

entity ZHANG_SEPTEMBER19_HalfAdder is
	port (ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic;
			ZHANG_SEPTEMBER19_S, ZHANG_SEPTEMBER19_C : out std_logic);

end ZHANG_SEPTEMBER19_HalfAdder;

architecture ZHANG_SEPTEMBER19_arch of ZHANG_SEPTEMBER19_HalfAdder is 
	begin
	
		P1: process (ZHANG_SEPTEMBER19_X,ZHANG_SEPTEMBER19_Y)
			begin
				ZHANG_SEPTEMBER19_S <= ZHANG_SEPTEMBER19_X xor ZHANG_SEPTEMBER19_Y;
			end process;
			
		P2: process (ZHANG_SEPTEMBER19_X,ZHANG_SEPTEMBER19_Y)
			begin
				ZHANG_SEPTEMBER19_C <= ZHANG_SEPTEMBER19_X and ZHANG_SEPTEMBER19_Y;
			end process;
		

end ZHANG_SEPTEMBER19_arch;