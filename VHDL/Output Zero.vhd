library ieee;
use ieee.std_logic_1164.all;

entity zero_entity is
	port(output : out std_logic);
end zero_entity;

architecture behaviour of zero_entity is
begin
	output <= '0';
end behaviour;