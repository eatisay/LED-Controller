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

entity ClockSelector is
    Port (	OneHzClock : in  STD_LOGIC;
				TwoHzClock : in  STD_LOGIC;
            FourHzClock: in  STD_LOGIC;
				EightHzClock : in  STD_LOGIC;
				ClockSelector : in  STD_LOGIC_VECTOR (1 downto 0);
				SelectedClock : out  STD_LOGIC);
end ClockSelector;

architecture Behavioral of ClockSelector is

begin
with	ClockSelector select SelectedClock <=
		OneHzClock WHEN "00", --One Hz Clock
		TwoHzClock WHEN "01", --Two Hz Clock
		FourHzClock WHEN "10", --Four Hz Clock
		EightHzClock WHEN "11",--Eight Hz Clock
		'X' WHEN OTHERS; 
end Behavioral;

