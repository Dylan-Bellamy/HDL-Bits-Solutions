library ieee;
use ieee.std_logic_1164.all;

entity xnorgate_entity is
	port(a, b : in std_logic;
		output : out std_logic);
end xnorgate_entity;

architecture behaviour of xnorgate_entity is
begin
	output <= a xnor b;
end behaviour;