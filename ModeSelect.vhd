----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:36:49 11/29/2017 
-- Design Name: 
-- Module Name:    ModeSelect - Behavioral 
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

entity ModeSelector is
    Port ( K : in  STD_LOGIC_VECTOR (2 downto 0);
           L : in  STD_LOGIC_VECTOR (2 downto 0);
           M : in  STD_LOGIC_VECTOR (2 downto 0);
           N : in  STD_LOGIC_VECTOR (2 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           OP : out  STD_LOGIC_VECTOR (2 downto 0));
end ModeSelector;

architecture Behavioral of ModeSelector is

begin
with S select OP <=
		K WHEN "00", --Singlecolorgen
		L WHEN "01", --Fade
		M WHEN "10", --Pulse
		N WHEN "11",
		"XXX" WHEN OTHERS; --Micro



end Behavioral;

