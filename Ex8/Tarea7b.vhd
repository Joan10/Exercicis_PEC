LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY Tarea8 IS
	PORT( CLOCK_50 : IN std_logic;
		HEX0 : OUT std_logic_vector(6 downto 0);
		HEX1 : OUT std_logic_vector(6 downto 0);
		HEX2 : OUT std_logic_vector(6 downto 0);
		HEX3 : OUT std_logic_vector(6 downto 0));
END Tarea8;

ARCHITECTURE Structure OF Tarea8 IS

	SIGNAL clk_flag : STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL num : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
	
	COMPONENT x4d7seg IS
		PORT( numero: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				SEG7_0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
				SEG7_1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
				SEG7_2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
				SEG7_3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
				);
	END COMPONENT;
	
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
					num <= num + "1";
				END IF;
			END PROCESS;

			Mostrar : x4d7seg port map( 	numero => num,
													SEG7_0  => HEX0,
													SEG7_1  => HEX1,
													SEG7_2  => HEX2,
													SEG7_3  => HEX3);
			
	
		
															
	
END Structure;