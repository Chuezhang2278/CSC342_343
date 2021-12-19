library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZHANG_sign_ext is
	port(
		A : in std_logic_vector(15 downto 0);
		B : out std_logic_vector(31 downto 0)
	);
end ZHANG_sign_ext;

architecture ZHANG_ARCH of ZHANG_sign_ext is
begin
	B <= x"0000"&A when A(15) = '0' else
			x"FFFF"&A when A(15) = '1' else
			(others => 'X');
end ZHANG_ARCH;