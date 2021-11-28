Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

entity ZHANG_NOR is 
port ( A, B   : in std_logic_vector(31 downto 0);
       result : out std_logic_vector(31 downto 0));
end ZHANG_NOR;

architecture ZHANG_arch of ZHANG_NOR is
begin
    result <= A NOR B;
end ZHANG_arch;