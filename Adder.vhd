library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           B : in  STD_LOGIC_VECTOR (2 downto 0);
			  OP : in STD_LOGIC;
           LR : out  STD_LOGIC_VECTOR (2 downto 0) 
			  );
end Adder;
	
architecture Behavioral of Adder is
	SIGNAL ci : std_logic_vector (2 downto 0);
	SIGNAL R : std_logic_vector (2 downto 0);
begin
	PROCESS(OP,A,B,R,ci)
	BEGIN
		IF (OP = '0') THEN 
		R(0) <= A(0) xor B(0);
		ci(0) <=  A(0) and B(0);
		
		R(1) <= A(1) xor B(1) xor ci(0);
		ci(1) <= (ci(0) and (A(1) xor B(1))) or (A(1) and B(1));
		
		R(2) <= A(2) xor B(2) xor ci(1);
		ci(2) <= (ci(1) and (A(2) xor B(2))) or (A(2) and B(2));
		

		
		else
		
		END IF;
	END PROCESS;
		LR <= R;

end Behavioral;