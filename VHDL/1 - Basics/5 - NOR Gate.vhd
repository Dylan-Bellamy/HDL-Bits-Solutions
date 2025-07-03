library ieee;
use ieee.std_logic_1164.all;

entity norgate_entity is
	port(a, b : in std_logic;
		output : out std_logic);
end norgate_entity;

architecture behaviour of norgate_entity is
begin
	output <= a nor b;
end behaviour;