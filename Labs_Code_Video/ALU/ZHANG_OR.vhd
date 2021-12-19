Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;


entity ZHANG_OR is 
port ( A, B   : in std_logic_vector(31 downto 0);
       result : out std_logic_vector(31 downto 0));
end ZHANG_OR;

architecture ZHANG_arch of ZHANG_OR is
begin
    result <= A OR B;
end ZHANG_arch;