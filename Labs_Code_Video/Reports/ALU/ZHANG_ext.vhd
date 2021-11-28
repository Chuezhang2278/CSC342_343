library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY ZHANG_ext is
    Port ( 
			ExtOp : in  STD_LOGIC;
         imm16 : in  STD_LOGIC_VECTOR (15 downto 0);           
         imm32: out  STD_LOGIC_VECTOR (31 downto 0));
end ZHANG_ext;

architecture ZHANG_arch of ZHANG_ext is
	COMPONENT ZHANG_sign_ext
		port(
			A : in std_logic_vector(15 downto 0);
			B : out std_logic_vector(31 downto 0)
		);
	end COMPONENT;

signal sign: STD_LOGIC_VECTOR (31 downto 0);
begin
-- 0 = zero extend, 1 = sign extend
SignExt: ZHANG_sign_ext port map(imm16, sign);


imm32 <= x"0000"&imm16 when ExtOp = '0' else
			sign when ExtOp = '1' else
			(others => 'X');

end ZHANG_arch;

