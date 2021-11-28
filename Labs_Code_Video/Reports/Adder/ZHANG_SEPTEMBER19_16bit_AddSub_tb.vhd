library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity ZHANG_SEPTEMBER19_16bit_AddSub_tb is
	generic ( n : integer:= 16);
end ZHANG_SEPTEMBER19_16bit_AddSub_tb;

architecture ZHANG_SEPTEMBER19_arch of ZHANG_SEPTEMBER19_16bit_AddSub_tb is
	component ZHANG_SEPTEMBER19_N_Bit_AddSub_Flag
		port(ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic_vector(n-1 downto 0);
			  ZHANG_SEPTEMBER19_OP : in std_logic;
			  ZHANG_SEPTEMBER19_S  : out std_logic_vector(n-1 downto 0);
           ZHANG_SEPTEMBER19_Cout : out std_logic;
			  ZHANG_SEPTEMBER19_Overflow, ZHANG_SEPTEMBER19_Zero, ZHANG_SEPTEMBER19_Negative: out std_logic);
	end component;	
		signal ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y, ZHANG_SEPTEMBER19_S, ZHANG_SEPTEMBER19_zeroes : std_logic_vector(n-1 downto 0);
		signal ZHANG_SEPTEMBER19_OP, ZHANG_SEPTEMBER19_Cout, ZHANG_SEPTEMBER19_Overflow, ZHANG_SEPTEMBER19_Zero, ZHANG_SEPTEMBER19_Negative : std_logic;
		begin
		uut: ZHANG_SEPTEMBER19_N_Bit_AddSub_Flag port map (ZHANG_SEPTEMBER19_X,ZHANG_SEPTEMBER19_Y,ZHANG_SEPTEMBER19_OP,ZHANG_SEPTEMBER19_S,ZHANG_SEPTEMBER19_Cout, ZHANG_SEPTEMBER19_Overflow, ZHANG_SEPTEMBER19_Zero, ZHANG_SEPTEMBER19_Negative);

		ZHANG_SEPTEMBER19_zero_allocate: for i in 0 to n-1 generate -- for zero flag, generates 'N' number of 0's 
			ZHANG_SEPTEMBER19_zeroes(i) <= '0';
		end generate;
		
	process
	
		begin 
			
			wait for 100 ns;
			report "Init Message";
			ZHANG_SEPTEMBER19_X <= "0000000000000000";
			ZHANG_SEPTEMBER19_Y <= "0000000000000000";
			ZHANG_SEPTEMBER19_OP <= '0';
			
			
			for i in 0 to 256 loop	
				for j in 0 to 256 loop
					wait for 10 ns;
					
 
					if ZHANG_SEPTEMBER19_OP = '0' then
						assert (ZHANG_SEPTEMBER19_S = ZHANG_SEPTEMBER19_X + ZHANG_SEPTEMBER19_Y) report "Outputed = " &integer'image(to_integer(unsigned((ZHANG_SEPTEMBER19_S))))& " expected X+Y = " &integer'image(to_integer(unsigned((ZHANG_SEPTEMBER19_X+ZHANG_SEPTEMBER19_Y)))) severity ERROR;
						ZHANG_SEPTEMBER19_OP <= ZHANG_SEPTEMBER19_OP xor '1';
					else
						assert (ZHANG_SEPTEMBER19_S = ZHANG_SEPTEMBER19_X - ZHANG_SEPTEMBER19_Y) report "Outputed = " &integer'image(to_integer(unsigned((ZHANG_SEPTEMBER19_S))))& " expected X-Y = " &integer'image(to_integer(unsigned((ZHANG_SEPTEMBER19_X-ZHANG_SEPTEMBER19_Y)))) severity ERROR;
						ZHANG_SEPTEMBER19_OP <= ZHANG_SEPTEMBER19_OP xor '1';
					end if;
					
					if ZHANG_SEPTEMBER19_Negative = '1' then
						assert (ZHANG_SEPTEMBER19_S(n-1) = '1');
					else
						assert (ZHANG_SEPTEMBER19_S(n-1) = '0');
					end if;
					
					-- would have been where i put overflow
					
					
			ZHANG_SEPTEMBER19_Y <= ZHANG_SEPTEMBER19_Y + "0000000000000001";
			end loop;
			ZHANG_SEPTEMBER19_X <= ZHANG_SEPTEMBER19_X + "0000000000000001";
			end loop;
			
			report "Test finished";
			wait;
	end process;
end ZHANG_SEPTEMBER19_arch;