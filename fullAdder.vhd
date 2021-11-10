library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
	port(a: in std_logic;
		  b: in std_logic;
		  cin: in std_logic;
		  sum: out std_logic;
		  cout: out std_logic);
end fullAdder;

architecture Behavioral of fullAdder is
begin

	sum <= a xor b xor cin;
	cout <= (a and b) or (b and cin) or (cin and a);
	
end Behavioral;

