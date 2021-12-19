Library ieee;
use ieee.std_logic_1164.all;

package ZHANG_alu_package is

component ZHANG_instruction_IR

	Port ( 
			instruc : in  STD_LOGIC_VECTOR (31 downto 0);       
         OpCode : out  STD_LOGIC_VECTOR (5 downto 0);
			RS,RT,RD, shamt: out  STD_LOGIC_VECTOR (4 downto 0);
			funct : out STD_LOGIC_vECTOR (5 downto 0);
			imm16 : out STD_LOGIC_VECTOR (15 downto 0)
		);
end component;

component ZHANG_miniCPU

	port (
		ZHANG_opcode : in std_logic_vector(5 downto 0);
		ALUctrl : out std_logic_vector(3 downto 0);
		ir, ExtOp: out std_logic
	);

end component;

component ZHANG_3PORT
	
	PORT
		(
			ZHANG_clock		: IN STD_LOGIC  := '1';
			ZHANG_data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			ZHANG_rdaddress1		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			ZHANG_rdaddress2		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			ZHANG_wraddress		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			ZHANG_wren		: IN STD_LOGIC  := '0';
			ZHANG_q1		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			ZHANG_q2		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);

end component;

component ZHANG_ALU
	port(
			ZHANG_ALUctrl : in std_logic_vector(3 downto 0);
			ZHANG_q1, ZHANG_q2		: in STD_LOGIC_VECTOR (31 DOWNTO 0);
			shamt : in STD_LOGIC_VECTOR(4 downto 0);
			ZHANG_out : out std_logic_vector (31 downto 0);
			ZHANG_Overflow, ZHANG_Zero, ZHANG_Negative : out std_logic
		);

end component;


component ZHANG_ext
	port(
		ExtOp : in std_logic;
		imm16 : in std_logic_vector(15 downto 0);
		imm32 : out std_logic_vector(31 downto 0)
	);
end component;

component ZHANG_SEPTEMBER19_N_Bit_AddSub_Flag

	Port ( ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic_vector(31 downto 0);
           ZHANG_SEPTEMBER19_OP : in std_logic;
           ZHANG_SEPTEMBER19_S  : out std_logic_vector(31 downto 0);
           ZHANG_SEPTEMBER19_Cout : out std_logic;
		     ZHANG_SEPTEMBER19_Overflow, ZHANG_SEPTEMBER19_Zero, ZHANG_SEPTEMBER19_Negative: out std_logic);
END component;

component ZHANG_OR 

	port ( A, B   : in std_logic_vector(31 downto 0);
			 result : out std_logic_vector(31 downto 0));
end component;

component ZHANG_NOR 

	port ( A, B   : in std_logic_vector(31 downto 0);
			 result : out std_logic_vector(31 downto 0));
end component;

component ZHANG_AND
	
	port ( A, B   : in std_logic_vector(31 downto 0);
       result : out std_logic_vector(31 downto 0));
	
end component;

component ZHANG_sl

	port ( A  : in std_logic_vector(31 downto 0);
		 shamt : in std_logic_vector(4 downto 0);
       result : out std_logic_vector(31 downto 0)
		);

end component;

component ZHANG_sr
	
	port ( A  : in std_logic_vector(31 downto 0);
		 shamt : in std_logic_vector(4 downto 0);
       result : out std_logic_vector(31 downto 0)
		);

end component;

component ZHANG_sra

	port ( A  : in std_logic_vector(31 downto 0);
		 shamt : in std_logic_vector(4 downto 0);
       result : out std_logic_vector(31 downto 0)
		);

end component;

end ZHANG_alu_package;