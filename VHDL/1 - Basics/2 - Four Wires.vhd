library ieee;
use ieee.std_logic_1164.all;

entity wire4_entity is
	port(a, b, c : in std_logic;
		w, x, y, z : out std_logic);
end wire4_entity;

architecture behaviour of wire4_entity is
begin
	w <= a;
	x <= b;
	y <= b;
	z <= c;
end behaviour;
