----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:08 01/03/2018 
-- Design Name: 
-- Module Name:    OneHzClockGenerator - Behavioral 
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


entity EightHzClockGenerator is
    Port ( MCLK : in  STD_LOGIC;
           EIGHTCLOCK : out  STD_LOGIC);
end EightHzClockGenerator;

architecture Behavioral of EightHzClockGenerator is
SIGNAL EIGHT : INTEGER := 6250000;
SIGNAL COUNTER :INTEGER := 0;

BEGIN

CLK_PROCESS: PROCESS(MCLK)
	
	BEGIN		
		IF(MCLK'EVENT AND MCLK = '1') THEN
			IF(COUNTER < EIGHT) THEN
				COUNTER <= COUNTER + 1;
			ELSE
				COUNTER <= 0;
			END IF;
		END IF;			
	END PROCESS;
		
		EIGHTCLOCK <= '1' WHEN COUNTER = 6250000 ELSE '0';
		

end Behavioral;

