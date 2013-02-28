LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY SeqLED IS
	PORT( CLOCK05S : IN std_logic_VECTOR(0 downto 0);
			vectorSW : IN STD_LOGIC_VECTOR(3 downto 0);
			sizeVEC : IN INTEGER;
			Enable : IN STD_LOGIC;
			Reset: IN STD_LOGIC := '0';
			Ences : OUT STD_LOGIC;
			Senyal : OUT STD_LOGIC;
			Sortida : OUT STD_LOGIC
			);
END SeqLED;

ARCHITECTURE Structure OF SeqLED IS

	signal itics : INTEGER := 0;
	signal v_codi : STD_LOGIC_VECTOR(3 downto 0); -- Vector on vindran codificats els nombres en Morse
	signal l_codi : INTEGER := 0; -- Long del vector
	
	
BEGIN
	
	process (CLOCK05S(0))	
	BEGIN
		IF Reset = '1' THEN --Sembla que quan arranca dispara el senyal de reset automaticament.No hi veig cap solucio
									-- es el comportament normal. L'única solucio que hi veig es jugar amb l'enable o be afegir
									-- una entrada de "comença" que posi assigni els valors a v_codi i l_codi.
			v_codi <= vectorSW;
			l_codi <= sizeVEC;
			Ences <= '0';
			Sortida <= '0';
			itics <= 0;
			Senyal <= '1';

		ELSIF (rising_edge(CLOCK05S(0)))  THEN				
			IF (Enable = '1') THEN
			
				IF itics > 1 THEN
					itics <= itics - 1;
					Sortida <= '1';
					
				ELSIF itics = 1 THEN
					Sortida <= '0';
					itics <= itics - 1;
					
				ELSIF l_codi = 0 THEN
					Ences <= '0';
					
				ELSIF l_codi /= 0 THEN
						
						IF (v_codi(l_codi-1) = '1') THEN
							itics <= 3;
							Sortida <= '1';
							l_codi <= l_codi - 1;
						ELSIF (v_codi(l_codi-1) = '0') THEN
							itics <= 1;
							Sortida <= '1';
							l_codi <= l_codi - 1;
						END IF;
						Ences <= '1';
				END IF;
	
			ELSE
				Sortida <= '0';
			END IF;
		END IF;
				
	END process;	
	
															
END Structure;