LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY Tarea8 IS
	PORT( CLOCK_50 : IN std_logic;
		HEX0 : OUT std_logic_vector(6 downto 0);
		HEX1 : OUT std_logic_vector(6 downto 0);
		HEX2 : OUT std_logic_vector(6 downto 0);
		HEX3 : OUT std_logic_vector(6 downto 0);
		SW : IN std_logic_vector(0 downto 0));	-- cap a on rotem);
END Tarea8;

ARCHITECTURE Structure OF Tarea8 IS

	SIGNAL clk_flag : STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL num : STD_LOGIC_VECTOR(2 downto 0) := "000";

	
	COMPONENT Comptador IS
		GENERIC (tics : INTEGER := 50000000 );
		PORT( clk: IN STD_LOGIC;
				fi: BUFFER STD_LOGIC_VECTOR(0 DOWNTO 0));
	END COMPONENT;
	
BEGIN

			Compt : Comptador generic map (tics => 50000000) port map(	clk => CLOCK_50,
																							fi => clk_flag );
			
			PROCESS (clk_flag)
			BEGIN
				IF (clk_flag="0" and clk_flag'EVENT) THEN
					IF (SW = "0") THEN
						num <= num + "1";
					ELSE
						num <= num - "1";
					END IF;
				END IF;
			END PROCESS;

	WITH num SELECT -- 1 NO 0 SI
		HEX3 <=     "0001001" WHEN "000", 
						"1000000" WHEN "001", 
						"1000111" WHEN "010", 
						"0001000" WHEN "011", 
						"1111111" WHEN "100", 
						"1111111" WHEN "101", 
						"1111111" WHEN "110", 
						"1111111" WHEN "111";
	WITH num SELECT -- 1 NO 0 SI
		HEX2 <=     "1000000" WHEN "000", 
						"1000111" WHEN "001", 
						"0001000" WHEN "010", 
						"1111111" WHEN "011", 
						"1111111" WHEN "100", 
						"1111111" WHEN "101", 
						"1111111" WHEN "110", 
						"0001001" WHEN "111";
	WITH num SELECT -- 1 NO 0 SI
		HEX1 <=     "1000111" WHEN "000", 
						"0001000" WHEN "001", 
						"1111111" WHEN "010", 
						"1111111" WHEN "011", 
						"1111111" WHEN "100", 
						"1111111" WHEN "101", 
						"0001001" WHEN "110", 
						"1000000" WHEN "111";
	WITH num SELECT -- 1 NO 0 SI
		HEX0 <=     "0001000" WHEN "000", 
						"1111111" WHEN "001", 
						"1111111" WHEN "010", 
						"1111111" WHEN "011", 
						"1111111" WHEN "100", 
						"0001001" WHEN "101", 
						"1000000" WHEN "110", 
						"1000111" WHEN "111";
			
	
		
															
	
END Structure;