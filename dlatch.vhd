----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:59:27 11/29/2017 
-- Design Name: 
-- Module Name:    dlatch - Behavioral 
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

entity DFLIPFLOP is
    Port ( D : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           QN : inout  STD_LOGIC);
end DFLIPFLOP;

architecture Behavioral of DFLIPFLOP is
signal Q1,QN1,Q2,QN2: STD_LOGIC;
signal F,H : std_logic;
signal G,I,X,Y : std_logic;

begin

--D-LATCH PART
F<= D NAND NOT C;
H<= NOT D NAND NOT C;
Q1<= QN1 NAND F;
QN1<= Q1 NAND H;

--SCR-LATCH PART

X<=Q1 NAND C;
Y<=C AND QN1;
Q2<= QN2 NAND X; 
QN2<= Y NAND Q2;

Q<=Q2;
QN<=QN2;
end Behavioral;

