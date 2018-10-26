library ieee;
use ieee.std_logic_1164.all;

entity portaAnd is port(
	A: in STD_LOGIC;
	B: in STD_LOGIC;
	S: out STD_LOGIC

);

end portaAND;

ARCHITECTURE behavior of portaAND is
BEGIN
	S <= A and B;
END behavior;