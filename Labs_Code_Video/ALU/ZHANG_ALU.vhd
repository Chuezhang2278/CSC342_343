Library ieee;
use ieee.std_logic_1164.all;
use work.ZHANG_alu_package.all;

entity ZHANG_ALU is
	port(
		ZHANG_ALUctrl : in std_logic_vector(3 downto 0);
		ZHANG_q1, ZHANG_q2		: in STD_LOGIC_VECTOR (31 DOWNTO 0);
		shamt : in STD_LOGIC_VECTOR(4 downto 0);
		ZHANG_out : out std_logic_vector (31 downto 0);
		ZHANG_Overflow, ZHANG_Zero, ZHANG_Negative : out std_logic
	);
end ZHANG_ALU;

architecture ZHANG_arch of ZHANG_ALU is
	
	signal cout, op, ov: std_logic; 
	signal zhang_t1, zhang_t2, zhang_t3, zhang_t4,zhang_t5,zhang_t6,zhang_t7: std_logic_vector(31 downto 0);
	
	begin
		process(ZHANG_ALUctrl)
			begin
				if ZHANG_ALUctrl = "0000" then -- add
					op <= '0';
				elsif ZHANG_ALUctrl = "0001" then -- sub
					op <= '1';
				elsif ZHANG_ALUctrl = "0010" then -- addu
					op <= '0';
				elsif ZHANG_ALUctrl = "0011" then -- subu
					op <= '1';
				elsif ZHANG_ALUctrl = "1001" then -- addi
					op <= '0';
				elsif ZHANG_ALUctrl = "1010" then -- addi
					op <= '0';
				end if;
		end process;
	
	T1: ZHANG_SEPTEMBER19_N_Bit_AddSub_Flag port map(ZHANG_q1, ZHANG_q2, op, zhang_t1, cout, ov, ZHANG_Zero, ZHANG_Negative); -- add, addu, addiu, sub, subu
	T2: ZHANG_AND port map(ZHANG_q1, ZHANG_q2, zhang_t2); --and, andi
	T3: ZHANG_OR port map(ZHANG_q1, ZHANG_q2, zhang_t3); --ori
	T4: ZHANG_NOR port map(ZHANG_q1, ZHANG_q2, zhang_t4); --nor
	T5: ZHANG_sl port map(ZHANG_q2, shamt, zhang_t5); --sl
	T6: ZHANG_sr port map(ZHANG_q2, shamt, zhang_t6); --sr
	T7: ZHANG_sra port map(ZHANG_q2, shamt, zhang_t7); -- sra
	
	
	process(ZHANG_ALUctrl, zhang_t1, zhang_t2, zhang_t3, zhang_t4, zhang_t5, zhang_t6, zhang_t7, ov) --Addu, Addiu, Subu
		begin
			case ZHANG_ALUctrl is
				when "0000" => -- add
					ZHANG_out <= zhang_t1;
					ZHANG_Overflow <= ov;
					
				when "0001" => -- sub
					ZHANG_out <= zhang_t1;
					ZHANG_Overflow <= ov;
					
				when "0010" => -- addu
					ZHANG_out <= zhang_t1;
					ZHANG_Overflow <= 'X';
					
				when "0011" => -- subu
					ZHANG_out <= zhang_t1;
					ZHANG_Overflow <= 'X';				
				when "1001" => -- addi
					ZHANG_out <= ZHANG_t1;
					ZHANG_Overflow <= ov;
					
				when "1010" => -- addiu
					ZHANG_out <= ZHANG_t1;
					ZHANG_Overflow <= 'X';
					
				when "0100" => -- and
					ZHANG_out <= ZHANG_t2;
					
				when "1011" => -- andi
					ZHANG_out <= ZHANG_t2;
				
				when "1100" => -- ori
					ZHANG_out <= zhang_t3;
				
				when "1101" => -- or
					ZHANG_out <= zhang_t3;
				
				when "0101" => -- nor
					ZHANG_out <= zhang_t4;
				
				when "0110" => -- sl
					ZHANG_out <= zhang_t5;
					
				when "0111" => -- sr
					ZHANG_out <= zhang_t6;
					
				when "1000" => -- sra
					ZHANG_out <= zhang_t7;
					
				when others =>
					ZHANG_out <= (others => 'X');
					
			end case;
	end process;
	
	
end ZHANG_arch;