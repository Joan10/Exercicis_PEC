LIBRARY ieee;
USE ieee.std_logic_1164.all;
--Conversor 3 bits a 7 segments
ENTITY Comptador IS
	GENERIC (tics : INTEGER := 50000000 );
	PORT( clk: IN STD_LOGIC;
	      fi: OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	      reset: IN STD_LOGIC
	);
END Comptador;

ARCHITECTURE Structure OF Comptador IS
BEGIN

	PROCESS (clk, reset)
		VARIABLE temp : INTEGER := tics; 
	BEGIN
		IF (clk='0' AND clk'EVENT) then
			temp := temp - 1;
			fi <= "0";
			IF (temp = 0) THEN
				fi <= "1";
				temp := tics;
			END IF;
		ELSIF (reset='0' AND reset'EVENT) then
			fi <= "0";
			temp := tics;
		
		END IF;
	END PROCESS;
						
END Structure;