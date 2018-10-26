library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity UCMips16Uni is 
	port (
			OPCode: in std_logic_vector (3 downto 0);
			OPULA: out std_logic_vector (1 downto 0);
			RegDestino, Jump, Branch, LeMem, EscMem, ULAFonte, MemParaReg, EscReg: out std_logic
		  );
end UCMips16Uni;

ARCHiTECTURE CPU of UCMips16Uni is
	begin
		
		RegDestino   <= '1' when OPCode = "0000" else '1' when OPCode = "0001" else '1' when OPCode = "0010" else '1' when OPCode = "0011" 
						else '1' when OPCode = "1010" else '1' when OPCode = "1011" else '1' when OPCode = "1100" else '1' when OPCode = "1101" else '0';
		Branch   <= '1' when OPCode = "0100" else '1' when OPCode = "0101" else '0';
		Jump     <= '1' when OPCode = "0110" else '1' when OPCode = "0111" else '0';
		LeMem  <= '1' when OPCode = "1000" else '0';
		EscMem <= '1' when OPCode = "1001" else '0';
		MemParaReg  <= '1' when OPCode = "1000" else '0';
		ULAFonte   <= '1' when OPCode = "1000" else '1' when OPCode = "1001";
		EscReg <= '1' when OPCode = "1000" else '1' when OPCode = "0000" else '1' when OPCode = "0001" else '1' when OPCode = "0010" else '1' when OPCode = "0011" 
						else '1' when OPCode = "1010" else '1' when OPCode = "1011" else '1' when OPCode = "1100" else '1' when OPCode = "1101" else '0';
		
		OPULA <= "00" when OPCode = "0000" else "00" when OPCode = "0001" else "01" when OPCode = "0010" else "10" when OPCode = "0011" else "11" when OPCode = "1010";
		
end CPU;
			