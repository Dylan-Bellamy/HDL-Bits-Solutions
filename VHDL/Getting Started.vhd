library ieee;
use ieee.std_logic_1164.all;

entity top_entity is
	port(output : out std_logic);
end top_entity;

architecture behaviour of top_entity is 
begin
	output <= '1'; 
end behaviour; 