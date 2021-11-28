library ieee;
use ieee.std_logic_1164.all;

entity ZHANG_SEPTEMBER19_N_Bit_AddSub_Flag is
	 generic ( n : integer:= 32); -- we can set this to whatever we want to test, for example 32
    Port ( ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic_vector(n-1 downto 0);
           ZHANG_SEPTEMBER19_OP : in std_logic;
           ZHANG_SEPTEMBER19_S  : out std_logic_vector(n-1 downto 0);
           ZHANG_SEPTEMBER19_Cout : out std_logic;
		     ZHANG_SEPTEMBER19_Overflow, ZHANG_SEPTEMBER19_Zero, ZHANG_SEPTEMBER19_Negative: out std_logic);
			  
end ZHANG_SEPTEMBER19_N_Bit_AddSub_Flag;

architecture ZHANG_SEPTEMBER19_behav of ZHANG_SEPTEMBER19_N_Bit_AddSub_Flag is

	signal ZHANG_SEPTEMBER19_C, ZHANG_SEPTEMBER19_SUM_BUFFER, ZHANG_SEPTEMBER19_bxor, ZHANG_SEPTEMBER19_zeroes : std_logic_vector(n-1 downto 0);
	begin
		
		ZHANG_SEPTEMBER19_bxor_allocate: for i in 0 to n-1 generate -- OP xor Y, this to determine if we subtracting or not
			ZHANG_SEPTEMBER19_bxor(i) <= ZHANG_SEPTEMBER19_OP xor ZHANG_SEPTEMBER19_Y(i);
		end generate;
		
		ZHANG_SEPTEMBER19_zero_allocate: for i in 0 to n-1 generate -- for zero flag, generates 'N' number of 0's 
			ZHANG_SEPTEMBER19_zeroes(i) <= '0';
		end generate;
		
		process (ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_bxor, ZHANG_SEPTEMBER19_SUM_BUFFER, ZHANG_SEPTEMBER19_OP, ZHANG_SEPTEMBER19_C)
			begin
				
				ZHANG_SEPTEMBER19_SUM_BUFFER(0) <= ZHANG_SEPTEMBER19_X(0) xor ZHANG_SEPTEMBER19_bxor(0) xor ZHANG_SEPTEMBER19_OP;
				ZHANG_SEPTEMBER19_C(0) <=  (ZHANG_SEPTEMBER19_X(0) and  ZHANG_SEPTEMBER19_bxor(0)) or (( ZHANG_SEPTEMBER19_X(0) xor  ZHANG_SEPTEMBER19_bxor(0)) and  ZHANG_SEPTEMBER19_OP);
			
				for i in 1 to n-1 loop
					ZHANG_SEPTEMBER19_SUM_BUFFER(i) <= ZHANG_SEPTEMBER19_X(i) xor ZHANG_SEPTEMBER19_bxor(i) xor ZHANG_SEPTEMBER19_C(i-1);
					ZHANG_SEPTEMBER19_C(i) <= (ZHANG_SEPTEMBER19_X(i) and  ZHANG_SEPTEMBER19_bxor(i)) or ((ZHANG_SEPTEMBER19_X(i) xor ZHANG_SEPTEMBER19_bxor(i)) and  ZHANG_SEPTEMBER19_C(i-1));
				end loop;
				

		end process;
		
		ZHANG_SEPTEMBER19_Cout <= ZHANG_SEPTEMBER19_C(n-1);
		ZHANG_SEPTEMBER19_S <= ZHANG_SEPTEMBER19_SUM_BUFFER;
		ZHANG_SEPTEMBER19_Overflow <= ZHANG_SEPTEMBER19_C(n-1) xor ZHANG_SEPTEMBER19_C(n-2);
		--ZHANG_SEPTEMBER19_Zero <= '1' when ZHANG_SEPTEMBER19_SUM_BUFFER = ZHANG_SEPTEMBER19_zeroes else '0'; -- if sum == only zeroes, 1 else 0
		ZHANG_SEPTEMBER19_Zero <= '1';
		ZHANG_SEPTEMBER19_Negative <= ZHANG_SEPTEMBER19_SUM_BUFFER(n-1); -- left most bit determins if it is negative or not
		
end ZHANG_SEPTEMBER19_behav;