library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.ALL;

Entity ULA is port
	(
	 A: in std_logic_vector (15 downto 0);
	 B: in std_logic_vector (15 downto 0);
	 OPULA: in std_logic_vector (3 downto 0);
	 ULAOut: out std_logic_vector (15 downto 0)
	);
end ULA;

ARCHITECTURE behavior of ULA is

component ANDPort
	port (A: in STD_LOGIC;
			B: in STD_LOGIC;
			S: out STD_LOGIC
			);
end component;

component ORPort
	port(A: in STD_LOGIC;
		  B: in STD_LOGIC;
		  S: out STD_LOGIC
		 );
end component;

component NOTPort
	port(A: in STD_LOGIC;
		  S: out STD_LOGIC
		 );
end component;

component XORPort
	port(EA, EB: in STD_LOGIC;
		  SAIDA: out STD_LOGIC
		 );
end component;

component Adder16Bits
	port(A,B: in std_logic_vector(15 downto 0);
		  C: out std_logic_vector(15 downto 0)
	    );
end component;

component Subtractor
	port(A,B: in std_logic_vector(15 downto 0);
		  C: out std_logic_vector(15 downto 0)
	    );
end component;

component NANDPort
	port(A, B : in std_logic;
		  S: out std_logic
		 );
end component;

component NORPort
	port(A, B : in std_logic;
		  S: out std_logic
		 );
end component;

component TheMultiplexador
	port(A, O, NR, NA, X ,NO :in std_logic;
		  Sum, Sub, ShiftL, ShiftR: in std_logic_vector (15 downto 0);
		  Choice: in std_logic_vector (3 downto 0);
		  OutPut: out std_logic_vector (15 downto 0)
		 );
end component;

component ShiftEsq
	port(A : in std_logic_vector (15 downto 0);
		  S : out std_logic_Vector (15 downto 0)
		 );
end component;

component ShiftDir
	port(A : in std_logic_vector (15 downto 0);
		  S : out std_logic_Vector (15 downto 0)
		 );
end component;

signal SaidaAND: std_logic;
signal SaidaOR: std_logic;
signal SaidaNOT: std_logic;
signal SaidaXOR: std_logic;
signal Soma: std_logic_vector (15 downto 0);
signal Diferenca: std_logic_vector (15 downto 0);
signal SaidaNAND: std_logic;
signal SaidaNOR: std_logic;
signal LeftShift: std_logic_vector (15 downto 0);
signal RightShift: std_logic_vector (15 downto 0);

begin
	G1: NOTPort port map (A(15) , SaidaNOT); 
	G2: ANDPort port map (A(15), B(15), SaidaAND);
	G3: XORPort port map (A(15), B(15), SaidaXOR);
	G4: ORPort port map (A(15), B(15), SaidaOR);
	G5: Adder16Bits port map (A, B, Soma);
	G6: Subtractor port map (A, B, Diferenca);
	G7: NANDPort port map (A(15), B(15), SaidaNAND);
	G8: NORPort port map (A(15), B(15), SaidaNOR);
	G9: ShiftDir port map(A, RightShift);
	G10: ShiftEsq port map(A, LeftShift);
	G11: TheMultiplexador port map (SaidaAND, SaidaOR, SaidaNOR,SaidaNAND, SaidaXOR,
											 SaidaNOT, Soma, Diferenca,LeftShift, RightShift, OPULA, ULAOut);
	
end;
