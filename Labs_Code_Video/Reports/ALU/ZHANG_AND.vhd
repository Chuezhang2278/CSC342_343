Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

entity ZHANG_AND is 
port ( A, B   : in std_logic_vector(31 downto 0);
       result : out std_logic_vector(31 downto 0));
end ZHANG_AND;

architecture ZHANG_arch of ZHANG_AND is
begin
    result <= A AND B;
end ZHANG_arch;