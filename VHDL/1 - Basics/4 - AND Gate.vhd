library ieee;
use ieee.std_logic_1164.all;

entity andgate_entity is
	port(a, b : in std_logic;
		output : out std_logic);
end andgate_entity;

architecture behaviour of andgate_entity is
begin
	output <= a and b;
end behaviour;