LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY switchTOvector IS
	PORT( switch : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			vector : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			long : OUT INTEGER;
			vectorLetra : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END switchTOvector;

ARCHITECTURE Structure OF switchTOvector IS
BEGIN
	-- Llegim de esquerra a dreta!!
	-- 0 els bits que no corresponen
	WITH switch SELECT
		vector <=	"0010" WHEN "000", 
						"1000" WHEN "001", 
						"1010" WHEN "010", 
						"0100" WHEN "011", 
						"0000" WHEN "100", 
						"0010" WHEN "101", 
						"0110" WHEN "110", 
						"0000" WHEN others;
						
	WITH switch SELECT
		long <=	2 WHEN "000", 
					4 WHEN "001", 
					4 WHEN "010", 
					3 WHEN "011", 
					1 WHEN "100", 
					4 WHEN "101", 
					3 WHEN "110", 
					4 WHEN others;
		
	WITH switch SELECT
		vectorLetra <=	"0001000" WHEN "000", 
							"0000011" WHEN "001", 
							"1000110" WHEN "010", 
							"0100001" WHEN "011", 
							"0000110" WHEN "100", 
							"0001110" WHEN "101", 
							"0010000" WHEN "110", 
							"0001001" WHEN others;

						
END Structure;