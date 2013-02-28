LIBRARY ieee;
USE ieee.std_logic_1164.all;
--Conversor 3 bits a 7 segments
ENTITY driver7Segmentos IS
	PORT( codigoCaracter: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			bitsCaracter: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END driver7Segmentos;

ARCHITECTURE Structure OF driver7Segmentos IS
BEGIN
	WITH codigoCaracter SELECT
		bitsCaracter <=	NOT("0111111") WHEN "000", 
								NOT("0000110") WHEN "001", 
								NOT("1011011") WHEN "010", 
								NOT("1001111") WHEN "011", 
								NOT("1100110") WHEN "100", 
								NOT("1101101") WHEN "101", 
								NOT("1111101") WHEN "110", 
								NOT("0000111") WHEN "111";
						
END Structure;