Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity ZHANG_sl is 
port ( A  : in std_logic_vector(31 downto 0);
		 shamt : in std_logic_vector(4 downto 0);
       result : out std_logic_vector(31 downto 0)
		);
end ZHANG_sl;

architecture ZHANG_arch of ZHANG_sl is
begin
    result <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(shamt))));
	 
end ZHANG_arch;