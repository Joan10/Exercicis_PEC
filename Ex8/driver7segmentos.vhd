LIBRARY ieee;
USE ieee.std_logic_1164.all;
--Conversor 3 bits a 7 segments
ENTITY driver7Segmentos IS
	PORT( codigoCaracter: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			bitsCaracter: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END driver7Segmentos;

ARCHITECTURE Structure OF driver7Segmentos IS
BEGIN
	WITH codigoCaracter SELECT
		bitsCaracter <=	"1000000" WHEN "0000", 
								"1111001" WHEN "0001", 
								"0100100" WHEN "0010", 
								"0110000" WHEN "0011", 
								"0011001" WHEN "0100", 
								"0010010" WHEN "0101", 
								"0000010" WHEN "0110", 
								"1111000" WHEN "0111",
								"0000000" WHEN "1000",
								"0011000" WHEN "1001",
								"0001000" WHEN "1010",
								"0000011" WHEN "1011",
								"1000110" WHEN "1100",
								"0100001" WHEN "1101",
								"0000110" WHEN "1110",
								"0001110" WHEN others;
						
END Structure;