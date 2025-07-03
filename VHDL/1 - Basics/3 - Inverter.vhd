library ieee;
use ieee.std_logic_1164.all;

entity inverter_entity is
	port(input : in std_logic;
		output : out std_logic);
end inverter_entity;

architecture behaviour of inverter_entity is
begin 
	output <= not input;
end behaviour;