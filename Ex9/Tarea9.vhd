LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY Tarea9 IS
	PORT( CLOCK_50 : IN std_logic;
			SW : IN STD_LOGIC_VECTOR(2 downto 0);
			KEY : IN STD_LOGIC_VECTOR(1 downto 0);
			LEDR : OUT STD_LOGIC_VECTOR(8 downto 0);
			HEX0 : OUT std_logic_vector(6 downto 0);
			HEX1 : OUT std_logic_vector(6 downto 0);
			HEX2 : OUT std_logic_vector(6 downto 0);
			HEX3 : OUT std_logic_vector(6 downto 0));
END Tarea9;

ARCHITECTURE Structure OF Tarea9 IS

	signal bus_vector: STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal bus_long: INTEGER;
	signal bus_CLOCK :INTEGER;
	signal clk_flag :STD_LOGIC_VECTOR(0 DOWNTO 0);
	
	signal bus_enable: STD_LOGIC := '1';
	signal bus_reset: STD_LOGIC := '0';
	signal strobe: STD_LOGIC := '0';
	
	COMPONENT switchTOvector IS
		PORT( switch : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
				vector : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
				long : OUT INTEGER;
				vectorLetra : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT Comptador IS
		GENERIC (tics : INTEGER := 50000000 );
		PORT( clk: IN STD_LOGIC;
				fi: OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
				reset: IN STD_LOGIC);
	END COMPONENT;
	
	COMPONENT SeqLED IS
	
		PORT( CLOCK05S : IN std_logic_VECTOR(0 downto 0);
				vectorSW : IN STD_LOGIC_VECTOR(3 downto 0);
				sizeVEC : IN INTEGER; 
				Enable : IN STD_LOGIC;
				Reset: IN STD_LOGIC;
				Ences : OUT STD_LOGIC;
				Sortida : OUT STD_LOGIC;
				Senyal : OUT STD_LOGIC);

	END COMPONENT;
	
	
	
BEGIN
	
	HEX1 <= "1111111";
	HEX2 <= "1111111";
	HEX3 <= "1111111";


	EsperaBoto1: process (KEY(1),KEY(0), CLOCK_50)
	BEGIN
		if (KEY(0) = '0') THEN
			bus_reset <= '1';
		
				
				--Perquè tot el temps em canvia els senyals de tal manera que comenci amb la sequencia???7
				--Resp: Es veu que si assignes un valor asincronament a un signal i no l'havies inicialitzat
				-- amb aquest valor es canvia.
				-- Conclusio: procurar fer servir entrades sincrones.
				
		elsif falling_edge(CLOCK_50) then
			if (KEY(1) = '0') THEN
				strobe <= '1';				
				bus_reset <= '1'; --Hem de provocar un flanc a bus_reset
			elsif (strobe = '1') then
				bus_reset <= '0';
				strobe <= '0';
			end if;
			
				
		END IF;
	END PROCESS;

	
	converSwVec : switchTOvector Port Map ( 	switch => SW,
															vector => bus_vector,
															long => bus_long,
															vectorLetra => HEX0 );
															
	comp : Comptador generic map(tics => 25000000)Port Map (	clk => CLOCK_50,
																				fi => clk_flag,
																				reset => bus_reset);
																				
	codled : SeqLED Port Map ( CLOCK05S => clk_flag, vectorSW =>  bus_vector, 
										sizeVEC  =>  bus_long, Enable => bus_enable, Reset => bus_reset, 
										Ences => LEDR(7), Sortida => LEDR(0), Senyal => LEDR(5) );
										
			

END Structure;