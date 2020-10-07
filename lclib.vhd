library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;



entity lclib is
    Port ( R : in  STD_LOGIC;
			  G : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  
			  Microphone : in STD_LOGIC;
			  
			  SE1 : in  STD_LOGIC;
			  SE2 : in  STD_LOGIC;
			 
 			  CS1 : in  STD_LOGIC;
			  CS2 : in  STD_LOGIC;
			  
			  MCLK : in  STD_LOGIC;
			
			  V1 : out  STD_LOGIC ;
			  V2 : out  STD_LOGIC ;
			  V3 : out  STD_LOGIC ;

           SEVSEG_DATA : out  STD_LOGIC_VECTOR (6 downto 0);
           SEVSEG_CONTROL : out  STD_LOGIC_VECTOR (7 downto 0));
end lclib;

architecture Behavioral of lclib is
	--INTERMEDIATE SIGNALS
	SIGNAL WIRE_HUNDREDHZ_CLOCK : STD_LOGIC;
	SIGNAL WIRE_ONEHZ_CLOCK     : STD_LOGIC;
	SIGNAL WIRE_TWOHZ_CLOCK   	 : STD_LOGIC;
	SIGNAL WIRE_FOURHZ_CLOCK    : STD_LOGIC;
	SIGNAL WIRE_EIGHTHZ_CLOCK   : STD_LOGIC;
	SIGNAL WIRE_SELECTED_CLOCK  : STD_LOGIC;
	SIGNAL WIRE_SEVSEG_DATA     : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL CL1  			       : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL CL2                  : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL CL3 						 : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL CL4 						 : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL OP  						 : STD_LOGIC_VECTOR (2 DOWNTO 0);

	begin	
	ClockSelector: ENTITY WORK.ClockSelector PORT MAP (
				OneHzClock => WIRE_ONEHZ_CLOCK,
				TwoHzClock => WIRE_TWOHZ_CLOCK,
            FourHzClock => WIRE_FOURHZ_CLOCK,
				EightHzClock => WIRE_EIGHTHZ_CLOCK,
				ClockSelector(0) => CS1,
				ClockSelector(1) => CS2,
				SelectedClock => WIRE_SELECTED_CLOCK
				);

	FadeMode : ENTITY WORK.FadeMode PORT MAP(
			RGB(0)=>R,
			RGB(1)=>G,
			RGB(2)=>B,
			OCLK => WIRE_SELECTED_CLOCK,
			NC => CL2
	 );
	 
	 MicroMode : ENTITY WORK.MicrophoneWithArduino PORT MAP(
			  Selector(0) => Microphone,
			  V	=> CL2,
			  N 	=>CL4	 
	 );

	 PulseMode : ENTITY WORK.PulseMode PORT MAP(
			  V=> CL1,
           CLKK => WIRE_SELECTED_CLOCK,
           VN=>CL3
	 );
	 
	 SingleColorGenerator : ENTITY WORK.SingleColorGenerator PORT MAP(
			  X =>R,
           Y=>G,
           Z =>B,
           V =>CL1
	 );
	
	 ModeSelector : ENTITY WORK.ModeSelector PORT MAP(
			  K =>CL1,
           L =>CL2,
           M =>CL3,
           N =>CL4,
           S(0) =>SE1,
			  S(1) =>SE2,
           OP =>OP
	 );
	

	--ADD CLOCK GENERATOR
	ClockGenerator : ENTITY WORK.ClockGenerator PORT MAP (
		MCLK => MCLK,
		HUNDREDHZCLOCK => WIRE_HUNDREDHZ_CLOCK
	);
	
	OneClockGenerator : ENTITY WORK.OneHzClockGenerator PORT MAP (
		MCLK => MCLK,
		ONECLOCK => WIRE_ONEHZ_CLOCK
	);
		TwoClockGenerator : ENTITY WORK.TwoHzClockGenerator PORT MAP (
		MCLK => MCLK,
		TWOCLOCK  => WIRE_TWOHZ_CLOCK
	);
	EightClockGenerator : ENTITY WORK.EightHzClockGenerator PORT MAP (
		MCLK => MCLK,
		EIGHTCLOCK => WIRE_EIGHTHZ_CLOCK
	);

	FourClockGenerator : ENTITY WORK.FOURHZCLOCKGEN PORT MAP (
		MYCLK=> MCLK,
		FOURCLK => WIRE_FOURHZ_CLOCK
	);
	
	--ADD DRIVER
	Driver : ENTITY WORK.Driver PORT MAP(
	 A => OP,
	 CLK => WIRE_HUNDREDHZ_CLOCK,
	 ssdata => WIRE_SEVSEG_DATA,
	 ssdriver => SEVSEG_CONTROL
	);
	

	
	--ADD DECODER
	ColorDecoder : ENTITY WORK.ColorDecoder PORT MAP(
		INPUT => WIRE_SEVSEG_DATA,
		SEVSEG_BUS => SEVSEG_DATA
	);

	V1 <= not OP(0);
		V2 <= not OP(1);
			V3 <= not OP(2);
end Behavioral;