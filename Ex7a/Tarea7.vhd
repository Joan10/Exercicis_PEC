LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY Tarea7 IS
	PORT( CLOCK_50 : IN std_logic;
			HEX0 : OUT std_logic_vector(6 downto 0));
END Tarea7;

ARCHITECTURE Structure OF Tarea7 IS
	SIGNAL Count : STD_LOGIC_VECTOR(24 downto 0) := "0000000000000000000000000";
	SIGNAL CountTic : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	
	COMPONENT driver7Segmentos IS
		PORT( codigoCaracter : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				bitsCaracter : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;
	
BEGIN

	PROCESS (CLOCK_50)
		-- variable C : INTEGER;
	BEGIN
		IF (CLOCK_50='0' AND CLOCK_50'EVENT) then
			Count <= Count + "1";
			IF Count="1000000000000000000000000" then
				CountTic <= CountTic + "1";
				-- C := C + "1";
				-- IF C=10 THEN
				--		C := 0; 
				-- END IF;
				IF CountTic="1001" THEN
					CountTic <= "0000";
				END IF;
				Count <= "0000000000000000000000000";
			END IF;
		END IF;
		-- CountTic <= C;
	END PROCESS;
	
	Visor : driver7Segmentos Port Map( 	codigoCaracter => CountTic,
														bitsCaracter => HEX0);

END Structure;