library ieee;
use ieee.std_logic_1164.all;

entity wire_entity is
	port(input : in std_logic;
		 output : out std_logic);
end wire_entity;

architecture behaviour of wire_entity is
begin
	output <= input;
end behaviour;