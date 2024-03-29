LIBRARY ieee;
USE ieee.std_logic_1164.all;
--Multiplexor 4 a 1.
ENTITY Mux4 IS
	PORT( Control: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			Bus0: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			Bus1: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			Bus2: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			Bus3: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			Salida: OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END Mux4;

ARCHITECTURE Structure OF Mux4 IS
BEGIN
	WITH Control SELECT
		Salida <= 	Bus0 WHEN "00", 
						Bus1 WHEN "01", 
						Bus2 WHEN "10", 
						Bus3 WHEN OTHERS;
END Structure;