LIBRARY ieee;
USE ieee.std_logic_1164.all;
--Multiplexor 4 a 1. SW[1..0] selector i KEY[3..0] data
ENTITY Tarea2 IS
	PORT( SW: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0));
END Tarea2;

ARCHITECTURE Structure OF Tarea2 IS
BEGIN
	WITH SW SELECT
		LEDR(0) <= KEY(0) WHEN "00", 
						KEY(1) WHEN "01", 
						KEY(2) WHEN "10", 
						KEY(3) WHEN OTHERS;

END Structure;