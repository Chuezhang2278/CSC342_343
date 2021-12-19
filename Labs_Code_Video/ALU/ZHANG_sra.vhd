Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity ZHANG_sra is 
port ( A  : in std_logic_vector(31 downto 0);
		 shamt : in std_logic_vector(4 downto 0);
       result : out std_logic_vector(31 downto 0)
		);
end ZHANG_sra;

architecture ZHANG_arch of ZHANG_sra is
begin
    result <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(shamt))));
	 
end ZHANG_arch;