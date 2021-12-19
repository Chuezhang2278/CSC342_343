library ieee;
use ieee.std_logic_1164.all;

entity ZHANG_SEPTEMBER19_N_Bit_AddSub is
	 generic ( n : integer:= 16); -- we can set this to whatever we want to test, for example 32
    Port ( ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic_vector(n-1 downto 0);
           ZHANG_SEPTEMBER19_OP : in std_logic;
           ZHANG_SEPTEMBER19_S  : out std_logic_vector(n-1 downto 0);
           ZHANG_SEPTEMBER19_Cout : out std_logic);
end ZHANG_SEPTEMBER19_N_Bit_AddSub;

architecture ZHANG_SEPTEMBER19_behav of ZHANG_SEPTEMBER19_N_Bit_AddSub is

	signal ZHANG_SEPTEMBER19_C, ZHANG_SEPTEMBER19_bxor : std_logic_vector(n-1 downto 0);
	begin
		
		ZHANG_SEPTEMBER19_bxor_allocate: for i in 0 to n-1 generate
			ZHANG_SEPTEMBER19_bxor(i) <= ZHANG_SEPTEMBER19_OP xor ZHANG_SEPTEMBER19_Y(i);
		end generate;
		
		process (ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_bxor, ZHANG_SEPTEMBER19_OP, ZHANG_SEPTEMBER19_C)
			begin
				
				ZHANG_SEPTEMBER19_S(0) <= ZHANG_SEPTEMBER19_X(0) xor ZHANG_SEPTEMBER19_bxor(0) xor ZHANG_SEPTEMBER19_OP;
				ZHANG_SEPTEMBER19_C(0) <=  (ZHANG_SEPTEMBER19_X(0) and  ZHANG_SEPTEMBER19_bxor(0)) or (( ZHANG_SEPTEMBER19_X(0) xor  ZHANG_SEPTEMBER19_bxor(0)) and  ZHANG_SEPTEMBER19_OP);
			
				for i in 1 to n-1 loop
					ZHANG_SEPTEMBER19_S(i) <= ZHANG_SEPTEMBER19_X(i) xor ZHANG_SEPTEMBER19_bxor(i) xor ZHANG_SEPTEMBER19_C(i-1);
					ZHANG_SEPTEMBER19_C(i) <= (ZHANG_SEPTEMBER19_X(i) and  ZHANG_SEPTEMBER19_bxor(i)) or ((ZHANG_SEPTEMBER19_X(i) xor ZHANG_SEPTEMBER19_bxor(i)) and  ZHANG_SEPTEMBER19_C(i-1));
				end loop;
				

		end process;
		ZHANG_SEPTEMBER19_Cout <= ZHANG_SEPTEMBER19_C(n-1);
end ZHANG_SEPTEMBER19_behav;