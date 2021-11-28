LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
ENTITY ZHANG_RAM32X4_1PORT_INFERRED IS
	PORT
	(
		ZHANG_address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		ZHANG_clock		: IN STD_LOGIC  := '1';
		ZHANG_data		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		ZHANG_wren		: IN STD_LOGIC ;
		ZHANG_q		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END ZHANG_RAM32X4_1PORT_INFERRED;
ARCHITECTURE ZHANG_arch OF ZHANG_RAM32X4_1PORT_INFERRED IS
   TYPE mem IS ARRAY(0 TO 31) OF std_logic_vector(3 DOWNTO 0);
   SIGNAL ram_block : mem := (others => "0000");
BEGIN
   PROCESS (ZHANG_clock)
   BEGIN
      IF (ZHANG_clock'event AND ZHANG_clock = '1') THEN
         IF (ZHANG_wren = '1') THEN
            ram_block(to_integer(unsigned(ZHANG_address))) <= ZHANG_data;
				ZHANG_q <= ZHANG_data;
         END IF;
         ZHANG_q <= ram_block(to_integer(unsigned(ZHANG_address)));
      END IF;
   END PROCESS;
END ZHANG_arch;

