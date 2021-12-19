library ieee;
use ieee.std_logic_1164.all;

entity ZHANG_SEPTEMBER19_Four_Bit_AddSub is 
	port (ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic_vector(3 downto 0);
			ZHANG_SEPTEMBER19_OP : in std_logic; 
			ZHANG_SEPTEMBER19_S : out std_logic_vector(3 downto 0);
			ZHANG_SEPTEMBER19_Cout : out std_logic);
end ZHANG_SEPTEMBER19_Four_Bit_AddSub;

architecture ZHANG_SEPTEMBER19_arch of ZHANG_SEPTEMBER19_Four_Bit_AddSub is

	component ZHANG_SEPTEMBER19_FullAdder
		port (ZHANG_SEPTEMBER19_A, ZHANG_SEPTEMBER19_B, ZHANG_SEPTEMBER19_Cin : in std_logic;
				ZHANG_SEPTEMBER19_Sum, ZHANG_SEPTEMBER19_Cout : out std_logic);
	end component;
	
	signal ZHANG_SEPTEMBER19_c1,ZHANG_SEPTEMBER19_c2,ZHANG_SEPTEMBER19_c3, ZHANG_SEPTEMBER19_c4 : std_logic;
	
	signal ZHANG_SEPTEMBER19_bxor : std_logic_vector(3 downto 0);
	begin 
	
	ZHANG_SEPTEMBER19_bxor_allocate: for i in 0 to 3 generate
		ZHANG_SEPTEMBER19_bxor(i) <= ZHANG_SEPTEMBER19_OP xor ZHANG_SEPTEMBER19_Y(i);
	end generate;
	
	FA1: ZHANG_SEPTEMBER19_FullAdder port map ( ZHANG_SEPTEMBER19_X(0),
															  ZHANG_SEPTEMBER19_bxor(0),
															  ZHANG_SEPTEMBER19_OP,
															  ZHANG_SEPTEMBER19_S(0),
															  ZHANG_SEPTEMBER19_c1);
															  
	FA2: ZHANG_SEPTEMBER19_FullAdder port map ( ZHANG_SEPTEMBER19_X(1),
															  ZHANG_SEPTEMBER19_bxor(1),
															  ZHANG_SEPTEMBER19_c1,
															  ZHANG_SEPTEMBER19_S(1),
															  ZHANG_SEPTEMBER19_c2);
															  
	FA3: ZHANG_SEPTEMBER19_FullAdder port map ( ZHANG_SEPTEMBER19_X(2),
															  ZHANG_SEPTEMBER19_bxor(2),
															  ZHANG_SEPTEMBER19_c2,
															  ZHANG_SEPTEMBER19_S(2),
															  ZHANG_SEPTEMBER19_c3);
	
															  
	FA4: ZHANG_SEPTEMBER19_FullAdder port map ( ZHANG_SEPTEMBER19_X(3),
															  ZHANG_SEPTEMBER19_bxor(3),
															  ZHANG_SEPTEMBER19_c3,
															  ZHANG_SEPTEMBER19_S(3),
															  ZHANG_SEPTEMBER19_Cout);

end ZHANG_SEPTEMBER19_arch;