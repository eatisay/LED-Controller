----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:47:13 01/03/2018 
-- Design Name: 
-- Module Name:    FIFTYHZCLOCKGEN - Behavioral 
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

entity FOURHZCLOCKGEN is
    Port ( MYCLK : in  STD_LOGIC;
           FOURCLK : out  STD_LOGIC);
end FOURHZCLOCKGEN;

architecture Behavioral of FOURHZCLOCKGEN is
SIGNAL ONE : INTEGER := 12500000;
SIGNAL COUNTER :INTEGER := 0;

BEGIN

CLK_PROCESS: PROCESS(MYCLK)
	
	BEGIN		
		IF(MYCLK'EVENT AND MYCLK = '1') THEN
			IF(COUNTER < ONE) THEN
				COUNTER <= COUNTER + 1;
			ELSE
				COUNTER <= 0;
			END IF;
		END IF;			
	END PROCESS;
		
		FOURCLK <= '1' WHEN COUNTER = 12500000 ELSE '0';
		

end Behavioral;

