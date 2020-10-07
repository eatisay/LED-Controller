----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:41:02 12/18/2017 
-- Design Name: 
-- Module Name:    MicrophoneWithArduino - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MicrophoneWithArduino is
    Port ( Selector : in STD_LOGIC_VECTOR (0 downto 0) ;
			  V		 : in STD_LOGIC_VECTOR (2 DOWNTO 0);
			  N 		 : out STD_LOGIC_VECTOR (2 DOWNTO 0));
			  
	 
	 
end MicrophoneWithArduino;

architecture Behavioral of MicrophoneWithArduino is

begin


with Selector select N<=
		V WHEN "0",	
		
		"XXX" WHEN OTHERS; 
		
end Behavioral;

