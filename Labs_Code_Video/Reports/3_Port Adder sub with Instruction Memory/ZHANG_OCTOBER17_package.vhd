Library ieee;
use ieee.std_logic_1164.all;

package ZHANG_OCTOBER17_package is
component ZHANG_instruction is
	Port ( 
		instruc : in  STD_LOGIC_VECTOR (31 downto 0);       
      OpCode : out  STD_LOGIC_VECTOR (5 downto 0);
		RS,RT,RD: out  STD_LOGIC_VECTOR (4 downto 0);
		imm16 : out STD_LOGIC_VECTOR (15 downto 0));
end component;	
component ZHANG_3PORT is
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
component ZHANG_SEPTEMBER19_N_Bit_AddSub_Flag

	Port ( ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic_vector(31 downto 0);
           ZHANG_SEPTEMBER19_OP : in std_logic;
           ZHANG_SEPTEMBER19_S  : out std_logic_vector(31 downto 0);
           ZHANG_SEPTEMBER19_Cout : out std_logic;
		     ZHANG_SEPTEMBER19_Overflow, ZHANG_SEPTEMBER19_Zero, ZHANG_SEPTEMBER19_Negative: out std_logic);
END component;

end ZHANG_OCTOBER17_package;