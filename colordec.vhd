----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:33:41 10/13/2017 
-- Design Name: 
-- Module Name:    SEVSEG_DECODER - Behavioral 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY ColorDecoder IS
 PORT ( INPUT : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
 SEVSEG_BUS : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END ColorDecoder;
ARCHITECTURE BEHAVIORAL OF ColorDecoder IS
BEGIN
WITH INPUT SELECT SEVSEG_BUS <=
		"1111010" WHEN "001", --Red
		"0100000" WHEN "010", --Green
		"1100000" WHEN "100", --Blue
		"0110001" WHEN "110", --Cyan
		"0011000" WHEN "101", --Purple
		"1000100" WHEN "011", --Yellow
		"1000001" WHEN "111", --White
		"1111111" WHEN OTHERS;
END BEHAVIORAL;