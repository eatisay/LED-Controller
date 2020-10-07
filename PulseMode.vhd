----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:05 01/03/2018 
-- Design Name: 
-- Module Name:    PulseMode - Behavioral 
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

entity PulseMode is
    Port ( V : in  STD_LOGIC_VECTOR (2 downto 0);
           CLKK : in  STD_LOGIC;
           VN : out  STD_LOGIC_VECTOR (2 downto 0));
end PulseMode;

architecture Behavioral of PulseMode is
SIGNAL VX : STD_LOGIC_VECTOR(2 DOWNTO 0):="000";
begin

PROCESS_CLKK : PROCESS(CLKK)

BEGIN
	
		
	IF(CLKK'EVENT AND CLKK='1') THEN
	
				IF (VX <= "000") THEN
				VX <= V;
				ELSIF (VX /= "000") THEN
				VX <= "000";

	END IF;
	END IF;



VN<=VX;
	

END PROCESS;


end Behavioral;

