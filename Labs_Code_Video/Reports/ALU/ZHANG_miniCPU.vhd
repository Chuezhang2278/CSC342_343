Library ieee;
use ieee.std_logic_1164.all;

entity ZHANG_miniCPU is
	port (
		ZHANG_opcode : in std_logic_vector(5 downto 0);
		ALUctrl : out std_logic_vector(3 downto 0);
		ir, ExtOp: out std_logic
	);
end ZHANG_miniCPU;

architecture ZHANG_arch of ZHANG_miniCPU is
	begin
			process(ZHANG_opcode)
				begin
						-- 0 = R type, R TYPE SECTION
						if (ZHANG_opcode = "000000") then --add
							ALUctrl <= "0000";
							ir <= '0';
							ExtOp <= '0';
						elsif ZHANG_opcode = "000010" then --addu
							ALUctrl <= "0010";
							ir <= '0';
							ExtOp <= '0';
						elsif ZHANG_opcode = "000001" then --sub
							ALUctrl <= "0001";
							ir <= '0';
							ExtOp <= '0';
						elsif ZHANG_opcode = "000011" then --subu
							ALUctrl <= "0011";
							ir <= '0';
							ExtOp <= '0';
						elsif ZHANG_opcode = "000100" then --And
							ALUctrl <= "0100";
							ir <= '0';
							ExtOp <= '0';
						elsif ZHANG_opcode = "000101" then --Nor
							ALUctrl <= "0101";
							ir <= '0';
							ExtOp <= '0';
						elsif ZHANG_opcode = "000110" then --shift left
							ALUctrl <= "0110";
							ir <= '0';
							ExtOp <= '0';
						elsif ZHANG_opcode = "000111" then --shift right
							ALUctrl <= "0111";
							ir <= '0';
							ExtOp <= '0';
						elsif ZHANG_opcode = "001000" then --shift right arith
							ALUctrl <= "1000";
							ir <= '0';
							ExtOp <= '0';
						elsif ZHANG_opcode = "001001" then -- or
							ALUctrl <= "1101";
							ir <= '0';
							ExtOp <= '0';
						-- 1 = I type, I TYPE SECTION
						elsif ZHANG_opcode = "100000" then --addi
							ALUctrl <= "1001";
							ir <= '1';
							ExtOp <= '1';
						elsif ZHANG_opcode = "100001" then --addiu
							ALUctrl <= "1010";
							ir <= '1';
							ExtOp <= '1';
						elsif ZHANG_opcode = "100010" then --andi
							ALUctrl <= "1011";
							ir <= '1';
							ExtOp <= '0';
						elsif ZHANG_opcode = "100011" then --ori
							ALUctrl <= "1100";
							ir <= '1';
							ExtOp <= '0';
						
				end if;
			end process;
end ZHANG_arch;