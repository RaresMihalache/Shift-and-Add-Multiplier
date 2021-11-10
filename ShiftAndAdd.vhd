library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ShiftAndAdd is
	port(clk: in std_logic;
		  init: in std_logic;
		  multiplicand: in std_logic_vector(3 downto 0);
		  multiplier: in std_logic_vector(3 downto 0);
		  rez: out std_logic_vector(7 downto 0)
		  );
	
end ShiftAndAdd;

architecture Behavioral of ShiftAndAdd is

	signal B: std_logic_vector(7 downto 0) := x"00";
	signal A: std_logic_vector(7 downto 0) := x"00";
	signal Q: std_logic_vector(3 downto 0);
	
	-- semnale de control
	signal add, writee: std_logic := '0';
	signal shiftRight, shiftLeft: std_logic := '0';
	
	
	signal coutulet: std_logic := '0';
	signal alt_aux: std_logic_vector(7 downto 0) := x"00";
	
	
	component FA_8bit is
		port(x: in std_logic_vector(7 downto 0);
			  y: in std_logic_vector(7 downto 0);
			  cin: in std_logic;
			  sum: out std_logic_vector(7 downto 0);
		     cout: out std_logic);
	end component;
	
begin
	
	process(clk)
	begin
		if rising_edge(clk) then
			if init = '1' then
				B(7 downto 4) <= x"0";
				B(3 downto 0) <= multiplicand;
				A <= x"00";
				Q <= multiplier;
			else
				if shiftLeft = '1' then
					B <=  B(6 downto 0) & "0";
				end if;
				if shiftRight = '1' then
					Q <= '0' & Q(3 downto 1); 
				end if;
				if writee = '1' then
					A <= alt_aux;
				end if;
			end if;
		end if;
	end process;
	
	
	process(clk)
	begin
		shiftLeft <= '0';
		shiftRight <= '0';
		writee <= '0';
		
		if init = '0' then
			shiftLeft <= '1';
			shiftRight <= '1';
			
			if Q(0) = '1' then
				writee <= '1';
			end if;
		end if;
		
	end process;
	
	adder8: FA_8bit port map(A, B, '0', alt_aux, coutulet);
	
	rez <= A;

end Behavioral;

