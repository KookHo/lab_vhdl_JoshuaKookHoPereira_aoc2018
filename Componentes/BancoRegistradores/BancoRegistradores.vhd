	library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

Entity BancoRegistradores is port
	(
	 EscReg: in std_logic; -- Sinal da unidade de controle
	 A: out std_logic_vector (15 downto 0);
	 B: out std_logic_vector (15 downto 0); 
	 DataEsc: in std_logic_vector (15 downto 0); -- Write Back
	 EndRegWrite: in std_logic_vector (3 downto 0); -- Registrador de destino
	 LeReg1: in std_logic_vector (3 downto 0);
	 LeReg2: in std_logic_vector (3 downto 0)
	);
end BancoRegistradores;

Architecture behavior of BancoRegistradores is
	
	type RegBank is array(0 to 15) of std_logic_vector (15 downto 0);
	signal Reg : RegBank;
	
begin
	A <= Reg(to_integer(unsigned(LeReg1)));
	B <= Reg(to_integer(unsigned(LeReg2)));
		
	process (EscReg)
		begin 
			if EscReg = '1' then
				Reg(to_integer(unsigned(EndRegWrite))) <= DataEsc;
				end if;
	end process;
	
end behavior;
					