Library ieee;
use ieee.std_logic_1164.all;
use work.ZHANG_OCTOBER17_package.all;

entity ZHANG_ADDER_INTEGRATION is
	port(
		ZHANG_clock		: IN STD_LOGIC  := '1';
		ZHANG_instruc : IN STD_LOGIC_VECTOR (31 downto 0);
		ZHANG_wren		: IN STD_LOGIC  := '0';
		ZHANG_q1, ZHANG_q2		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		ZHANG_Overflow, ZHANG_Zero, ZHANG_Negative : out std_logic
	);
end ZHANG_ADDER_INTEGRATION;

architecture ZHANG_arch of ZHANG_ADDER_INTEGRATION is

signal ZHANG_COUT, ZHANG_OP : std_logic;
signal ZHANG_X, ZHANG_Y, ZHANG_S : std_logic_vector(31 downto 0); 
signal ZHANG_OP_CODE: std_logic_vector (5 downto 0);
signal ZHANG_rs_out, ZHANG_rt_out, ZHANG_rd_out : std_logic_vector(4 downto 0);
signal ZHANG_imm16 : std_logic_vector(15 downto 0);
	
begin 
	process(ZHANG_OP_CODE)
		begin
			if(ZHANG_OP_CODE = "000000") then
				ZHANG_OP <= '0';
			elsif(ZHANG_OP_CODE = "000001") then
				ZHANG_OP <= '1';
			end if;
	end process;
	t1: ZHANG_instruction port map (	ZHANG_instruc, ZHANG_OP_CODE, ZHANG_rs_out, ZHANG_rt_out, ZHANG_rd_out, ZHANG_imm16);
	ZHANG_RAM: ZHANG_3PORT port map(ZHANG_clock,ZHANG_S,ZHANG_rs_out,ZHANG_rt_out,ZHANG_rd_out,ZHANG_wren,ZHANG_X,ZHANG_Y);
	ZHANG_ADDSUB: ZHANG_SEPTEMBER19_N_Bit_AddSub_Flag port map( ZHANG_X, ZHANG_Y,ZHANG_OP,ZHANG_S,ZHANG_COUT,ZHANG_Overflow,ZHANG_Zero,ZHANG_Negative);
	
	ZHANG_q1 <= ZHANG_X;
	ZHANG_q2 <= ZHANG_Y;
	
end ZHANG_arch;