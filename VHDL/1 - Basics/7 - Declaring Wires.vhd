library ieee;
use ieee.std_logic_1164.all;

entity wires_entity is
	port(a, b, c, d : in std_logic;
		output, output_n : out std_logic);
end wires_entity;

architecture behaviour of wires_entity is
	signal aANDb, cANDd, abORcd : std_logic;
begin
	aANDb <= a and b;
	cANDd <= c and d;
	abORcd <= aANDb or cANDd;
	output <= abORcd;
	output_n <= not abORcd;
end behaviour;