library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ZHANG_instruction is
    Port ( 
			instruc : in  STD_LOGIC_VECTOR (31 downto 0);       
         OpCode : out  STD_LOGIC_VECTOR (5 downto 0);
			RS,RT,RD: out  STD_LOGIC_VECTOR (4 downto 0);
			imm16 : out STD_LOGIC_VECTOR (15 downto 0));
end ZHANG_instruction;

architecture arch of ZHANG_instruction is
begin
	OpCode <= instruc(31 downto 26);
	RS <= instruc(25 downto 21);
	RT <= instruc(20 downto 16);
	RD <= instruc(15 downto 11);
	imm16 <= instruc(15 downto 0);
end arch;