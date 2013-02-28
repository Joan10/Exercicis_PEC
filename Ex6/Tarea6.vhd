LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY Tarea6 IS

	PORT( 	KEY : IN std_logic_vector(0 downto 0); -- tecla rotacio
				SW : IN std_logic_vector(0 downto 0);	-- cap a on rotem
				HEX0 : OUT std_logic_vector(6 downto 0);
				HEX1 : OUT std_logic_vector(6 downto 0);
				HEX2 : OUT std_logic_vector(6 downto 0);
				HEX3 : OUT std_logic_vector(6 downto 0);
				LEDR : OUT std_logic_vector(2 downto 0));	-- mostrar contador
				
END Tarea6;

ARCHITECTURE Structure OF Tarea6 IS
	SIGNAL Count : STD_LOGIC_VECTOR(2 downto 0) := "000";
	
BEGIN

	PROCESS (KEY)
	BEGIN
		IF (KEY="0" AND KEY'EVENT) then
			CASE SW IS
				WHEN "1" =>
						Count <= Count + "1";
				WHEN others =>
						Count <= Count - "1";
			END CASE;
		END IF;
	END PROCESS;
	
	LEDR <= Count;
	
	WITH Count SELECT -- 1 NO 0 SI
		HEX3 <=     "0001001" WHEN "000", 
						"1000000" WHEN "001", 
						"1000111" WHEN "010", 
						"0001000" WHEN "011", 
						"1111111" WHEN "100", 
						"1111111" WHEN "101", 
						"1111111" WHEN "110", 
						"1111111" WHEN "111";
	WITH Count SELECT -- 1 NO 0 SI
		HEX2 <=     "1000000" WHEN "000", 
						"1000111" WHEN "001", 
						"0001000" WHEN "010", 
						"1111111" WHEN "011", 
						"1111111" WHEN "100", 
						"1111111" WHEN "101", 
						"1111111" WHEN "110", 
						"0001001" WHEN "111";
	WITH Count SELECT -- 1 NO 0 SI
		HEX1 <=     "1000111" WHEN "000", 
						"0001000" WHEN "001", 
						"1111111" WHEN "010", 
						"1111111" WHEN "011", 
						"1111111" WHEN "100", 
						"1111111" WHEN "101", 
						"0001001" WHEN "110", 
						"1000000" WHEN "111";
	WITH Count SELECT -- 1 NO 0 SI
		HEX0 <=     "0001000" WHEN "000", 
						"1111111" WHEN "001", 
						"1111111" WHEN "010", 
						"1111111" WHEN "011", 
						"1111111" WHEN "100", 
						"0001001" WHEN "101", 
						"1000000" WHEN "110", 
						"1000111" WHEN "111";
		
END Structure;