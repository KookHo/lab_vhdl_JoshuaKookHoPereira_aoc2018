library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FLipFlopJK is
   port( J,K: in  std_logic;
         Clock: in std_logic;
         Output: out std_logic);
end FlipFlopJK;

architecture Behavioral of FlipFlopJK is
   signal saida: std_logic;
begin
   process (Clock) 
   begin
      if rising_edge(Clock) then                 
            if (J='0' and K='0') then
               saida <= saida;
            elsif (J='0' and K='1') then
               saida <= '0';
            elsif (J='1' and K='0') then
               saida <= '1';
            elsif (J='1' and K='1') then
               saida <= not (saida);
            end if;
      end if;
   end process;
   Output <= saida;
end Behavioral;