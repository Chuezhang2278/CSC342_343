LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

LIBRARY lpm;
USE lpm.all;

ENTITY ZHANG_SEPTEMBER19_LPM_ADDSUB IS
	generic (n : integer := 32);
	PORT
	(
		add_sub		: IN STD_LOGIC ;
		cin		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		cout		: OUT STD_LOGIC ;
		overflow		: OUT STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		zero		: out std_logic;
		negative : out std_logic
	);
END ZHANG_SEPTEMBER19_LPM_ADDSUB;


ARCHITECTURE SYN OF ZHANG_SEPTEMBER19_LPM_ADDSUB IS

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL sub_wire1	: STD_LOGIC ;
	SIGNAL sub_wire2	: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	SIGNAL zeroes 		: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	SIGNAL Test 		: STD_LOGIC_VECTOR (n-1 DOWNTO 0);

	COMPONENT lpm_add_sub
	GENERIC (
		lpm_direction		: STRING;
		lpm_hint		: STRING;
		lpm_representation		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL
	);
	PORT (
			add_sub	: IN STD_LOGIC ;
			cin	: IN STD_LOGIC ;
			dataa	: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			cout	: OUT STD_LOGIC ;
			overflow	: OUT STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
	);
	END COMPONENT;

BEGIN

	
	zero_allocate: for i in 0 to n-1 
		generate -- for zero flag, generates 'N' number of 0's 
			zeroes(i) <= '0';
		end generate;

	cout    <= sub_wire0;
	overflow    <= sub_wire1;
	result    <= sub_wire2(n-1 downto 0);
	zero <= '1' when sub_wire2 = zeroes else '0';
	
	negative <= sub_wire2(n-1);
	
	

	LPM_ADD_SUB_component : LPM_ADD_SUB
	GENERIC MAP (
		lpm_direction => "UNUSED",
		lpm_hint => "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
		lpm_representation => "SIGNED",
		lpm_type => "LPM_ADD_SUB",
		lpm_width => n
	)
	PORT MAP (
		add_sub => add_sub,
		cin => cin,
		dataa => dataa,
		datab => datab,
		cout => sub_wire0,
		overflow => sub_wire1,
		result => sub_wire2
	);


END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: CarryIn NUMERIC "1"
-- Retrieval info: PRIVATE: CarryOut NUMERIC "1"
-- Retrieval info: PRIVATE: ConstantA NUMERIC "0"
-- Retrieval info: PRIVATE: ConstantB NUMERIC "0"
-- Retrieval info: PRIVATE: Function NUMERIC "2"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
-- Retrieval info: PRIVATE: Latency NUMERIC "0"
-- Retrieval info: PRIVATE: Overflow NUMERIC "1"
-- Retrieval info: PRIVATE: RadixA NUMERIC "10"
-- Retrieval info: PRIVATE: RadixB NUMERIC "10"
-- Retrieval info: PRIVATE: Representation NUMERIC "0"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: ValidCtA NUMERIC "0"
-- Retrieval info: PRIVATE: ValidCtB NUMERIC "0"
-- Retrieval info: PRIVATE: WhichConstant NUMERIC "0"
-- Retrieval info: PRIVATE: aclr NUMERIC "0"
-- Retrieval info: PRIVATE: clken NUMERIC "0"
-- Retrieval info: PRIVATE: nBit NUMERIC "16"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_DIRECTION STRING "UNUSED"
-- Retrieval info: CONSTANT: LPM_HINT STRING "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=YES"
-- Retrieval info: CONSTANT: LPM_REPRESENTATION STRING "SIGNED"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_ADD_SUB"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "16"
-- Retrieval info: USED_PORT: add_sub 0 0 0 0 INPUT NODEFVAL "add_sub"
-- Retrieval info: USED_PORT: cin 0 0 0 0 INPUT NODEFVAL "cin"
-- Retrieval info: USED_PORT: cout 0 0 0 0 OUTPUT NODEFVAL "cout"
-- Retrieval info: USED_PORT: dataa 0 0 16 0 INPUT NODEFVAL "dataa[15..0]"
-- Retrieval info: USED_PORT: datab 0 0 16 0 INPUT NODEFVAL "datab[15..0]"
-- Retrieval info: USED_PORT: overflow 0 0 0 0 OUTPUT NODEFVAL "overflow"
-- Retrieval info: USED_PORT: result 0 0 16 0 OUTPUT NODEFVAL "result[15..0]"
-- Retrieval info: CONNECT: @add_sub 0 0 0 0 add_sub 0 0 0 0
-- Retrieval info: CONNECT: @cin 0 0 0 0 cin 0 0 0 0
-- Retrieval info: CONNECT: @dataa 0 0 16 0 dataa 0 0 16 0
-- Retrieval info: CONNECT: @datab 0 0 16 0 datab 0 0 16 0
-- Retrieval info: CONNECT: cout 0 0 0 0 @cout 0 0 0 0
-- Retrieval info: CONNECT: overflow 0 0 0 0 @overflow 0 0 0 0
-- Retrieval info: CONNECT: result 0 0 16 0 @result 0 0 16 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL ZHANG_SEPTEMBER19_LPM_ADDSUB.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ZHANG_SEPTEMBER19_LPM_ADDSUB.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ZHANG_SEPTEMBER19_LPM_ADDSUB.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ZHANG_SEPTEMBER19_LPM_ADDSUB.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ZHANG_SEPTEMBER19_LPM_ADDSUB.vhd FALSE
-- Retrieval info: LIB_FILE: lpm