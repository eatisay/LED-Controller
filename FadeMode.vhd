----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:55 01/03/2018 
-- Design Name: 
-- Module Name:    FadeMode - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FadeMode is
    Port ( RGB : in STD_LOGIC_VECTOR (2 downto 0);
			  OCLK: in STD_LOGIC;
           NC : out  STD_LOGIC_VECTOR (2 downto 0));
end FadeMode;

architecture Behavioral of FadeMode is

SIGNAL CNX : STD_LOGIC_VECTOR(2 DOWNTO 0):="000";
		
begin

PROCESS_OCLK : PROCESS(OCLK)

BEGIN
	
		
	IF(OCLK'EVENT AND OCLK='1') THEN
			CNX<=CNX+1;
		IF (CNX>"111") THEN
			CNX<="000";

		
	END IF;
	END IF;
END PROCESS;

	NC<=CNX;

end Behavioral;

