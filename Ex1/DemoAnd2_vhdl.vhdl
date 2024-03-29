LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY DemoAnd2_vhdl IS
	PORT( KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			LEDG : OUT STD_LOGIC_VECTOR(2 DOWNTO 2));
END DemoAnd2_vhdl;

ARCHITECTURE Structure OF DemoAnd2_vhdl IS
BEGIN
	LEDG(2) <= not(KEY(0)) and not(KEY(1));
END Structure;