library ieee;
use ieee.std_logic_1164.all;

entity chip_entity is
	port(p1a, p1b, p1c, p1d, p1e, p1f : in std_logic;
		p2a, p2b, p2c, p2d : in std_logic;
		p1y, p2y : out std_logic);
end chip_entity;

architecture behaviour of chip_entity is
	signal and1, and2, and3, and4 : std_logic;
begin
	and1 <= p1a and p1b and p1c;
	and2 <= p1d and p1e and p1f;
	and3 <= p2a and p2b;
	and4 <= p2c and p2d;
	p1y <= and1 or and2;
	p2y <= and3 or and4;
end behaviour;