Library ieee;
use ieee.std_logic_1164.all;

package ZHANG_SEPTEMBER19_fulladd_package is
	component ZHANG_SEPTEMBER19_HalfAdder
		port (ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic;
				ZHANG_SEPTEMBER19_S, ZHANG_SEPTEMBER19_C : out std_logic);
	end component;
	
	component ZHANG_SEPTEMBER19_FullAdder is
		port (ZHANG_SEPTEMBER19_A, ZHANG_SEPTEMBER19_B, ZHANG_SEPTEMBER19_Cin : in std_logic;
				ZHANG_SEPTEMBER19_Sum, ZHANG_SEPTEMBER19_Cout : out std_logic);
	end component;
	
	component ZHANG_SEPTEMBER19_Four_Bit_Adder is 
		port (ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic_vector(3 downto 0);
				ZHANG_SEPTEMBER19_Cin : in std_logic; 
				ZHANG_SEPTEMBER19_S : out std_logic_vector(3 downto 0);
				ZHANG_SEPTEMBER19_Cout : out std_logic);
	end component;
	
	component ZHANG_SEPTEMBER19_Four_Bit_AddSub is 
		port (ZHANG_SEPTEMBER19_X, ZHANG_SEPTEMBER19_Y : in std_logic_vector(3 downto 0);
				ZHANG_SEPTEMBER19_OP : in std_logic; 
				ZHANG_SEPTEMBER19_S : out std_logic_vector(3 downto 0);
				ZHANG_SEPTEMBER19_Cout : out std_logic);
	end component;

end ZHANG_SEPTEMBER19_fulladd_package;