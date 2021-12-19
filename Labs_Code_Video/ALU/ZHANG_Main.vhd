Library ieee;
use ieee.std_logic_1164.all;
use work.ZHANG_alu_package.all;

entity ZHANG_Main is
	port(
		ZHANG_clock		: IN STD_LOGIC  := '1';
		ZHANG_wren		: IN STD_LOGIC  := '0';
		instruc : in  STD_LOGIC_VECTOR (31 downto 0);
		result : out STD_LOGIC_VECTOR (31 downto 0)
		);

end ZHANG_Main;

architecture ZHANG_arch of ZHANG_Main is 
	
	-- IR Decoder
	signal OpCode : STD_LOGIC_VECTOR (5 downto 0);
	signal RS,RT,RD,shamt: STD_LOGIC_VECTOR (4 downto 0);
	signal funct : STD_LOGIC_vECTOR (5 downto 0);
	signal imm16 : STD_LOGIC_VECTOR (15 downto 0);
	-- Extender
	signal imm32 : STD_LOGIC_VECTOR (31 downto 0);
	-- CPU
	signal ALUctrl : STD_LOGIC_VECTOR (3 downto 0);
	signal IR_Type, ExtOp : STD_LOGIC;
	-- ALU
	signal q1, q2, a, b, output : STD_LOGIC_VECTOR (31 DOWNTO 0);
	signal overflow, zero, negative : std_logic;
	
	
	begin
	
		IR : ZHANG_instruction_IR port map(instruc, OpCode, RS, RT, RD, shamt, funct, imm16);
	
		CPU : ZHANG_miniCPU port map(OpCode, ALUctrl, IR_Type, ExtOp);
		
		Ext : ZHANG_ext port map(ExtOp, imm16, imm32);
		
		RAM : ZHANG_3PORT port map(ZHANG_clock,output,RS,RT,RD,ZHANG_wren,a,b);
		
		
		process(IR_Type, a, b, q1, q2)
			begin
				if IR_Type = '1' then
					q1 <= a;
					q2 <= imm32;
				elsif IR_Type = '0' then
					q1 <= a;
					q2 <= b;
				end if;
			end process;
		
		ALU : ZHANG_ALU port map(Aluctrl, q1, q2, shamt, output, overflow, zero, negative);
		
		result <= output;
end ZHANG_arch;