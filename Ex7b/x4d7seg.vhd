LIBRARY ieee;
USE ieee.std_logic_1164.all;
--Conversor 3 bits a 7 segments
ENTITY x4d7seg IS
	PORT( numero: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			SEG7_0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			SEG7_1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			SEG7_2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			SEG7_3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
			);
END x4d7seg;

ARCHITECTURE Structure OF x4d7seg IS

	COMPONENT driver7Segmentos IS
		PORT( codigoCaracter : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				bitsCaracter : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;

BEGIN
			Visor1 : driver7Segmentos Port Map( 	codigoCaracter => numero(3 downto 0),
																bitsCaracter => SEG7_0);
			Visor2 : driver7Segmentos Port Map( 	codigoCaracter => numero(7 downto 4),
																bitsCaracter => SEG7_1);
			Visor3 : driver7Segmentos Port Map( 	codigoCaracter => numero(11 downto 8),
																bitsCaracter => SEG7_2);
			Visor4 : driver7Segmentos Port Map( 	codigoCaracter => numero(15 downto 12),
																bitsCaracter => SEG7_3);	
														
END Structure;

