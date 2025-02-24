  LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
ENTITY UPADHYAYA_FSM IS
GENERIC(
P:natural:= 16;
MW: natural := 9;
W: NATURAL := 3;
E : NATURAL := 8);
port(
CLK : in std_logic;
RST: IN STD_LOGIC;
IR_OUT: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0); 		--THE INSTRUCTION REGISTER INPUT TO THE FSM 
NZP_OUT : IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);  		--THE BRANCH REGISTER INPUT TO THE FSM
PC_EN: OUT STD_LOGIC;
GATE_PC_EN: OUT STD_LOGIC;					--THE REST OF THEM ARE THE OUTPUT OF THE FSM 
LD_PCMUX: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
MAR_EN: OUT  STD_LOGIC;
MEM_EN: OUT  STD_LOGIC;
RD_WR_EN: OUT  STD_LOGIC;
MDR_EN:OUT  STD_LOGIC;
MDR_GATE_EN: OUT  STD_LOGIC;
IR_EN: OUT  STD_LOGIC;
LD_ADDR2MUX: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
LD_ADDR1MUX: OUT  STD_LOGIC;
LD_MM: OUT  STD_LOGIC;
GATE_MARMUX: OUT  STD_LOGIC;
DR_REG: OUT  STD_LOGIC_VECTOR(W-1 DOWNTO 0);
REG_EN: OUT  STD_LOGIC;
SR1: OUT  STD_LOGIC_VECTOR( W-1 DOWNTO 0);
SR2: OUT  STD_LOGIC_VECTOR(W-1 DOWNTO 0);
LD_SR2MUX: OUT  STD_LOGIC_VECTOR( 1 DOWNTO 0); 
LD_ALU: OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
LD_CC : OUT STD_LOGIC;

GATE_ALU: OUT  STD_LOGIC);

END UPADHYAYA_FSM;
ARCHITECTURE DATAPATH OF UPADHYAYA_FSM IS
type LC3_STATE IS (S0, S1,S2,S2A,S2B,S2C,S000,S3,S3AD,S3AD1,S3AN,S3AN1,S3NOT,S3ADN,S3LD,S3LD1,S3LD2,S3LD3,S3LD4,S3LDI,S3LDI1,S3LDI2,S3LDI3,S3ST,S3ST1,S3ST2,S3ST3,S3ST4,S3STI,S3STI1,S3STI2,S3STI3,S8);
--,S3D,S3E,S3H,S3I,S3J,S3K,S3ADN1
SIGNAL CPU_STATE: LC3_STATE;
SIGNAL NEXT_STATE:LC3_STATE;

CONSTANT ADD: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001"; --ADD

CONSTANT ANDL : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0101";--AND

CONSTANT NOTL: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001"; --NOT

CONSTANT BR: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"; --NZP BRANCH 
 
CONSTANT JMP: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1100"; --JMP IF BASE IS 111

--CONSTANT JSRR: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0100"; --JSRR

CONSTANT JSR: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100"; --JSR JUMP TO SUB ROUTINE

CONSTANT RET: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1100"; -- RET 

CONSTANT LD: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010"; --LD

CONSTANT LDI: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010"; --LDI INDIRECT

CONSTANT LDR: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110"; --LDR RELATIVE

CONSTANT LEA: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1110"; --LEA LOAD EFFECTIVE ADDRESS

CONSTANT ST: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011"; --ST

CONSTANT STI : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1011"; --STI STORE INDIRECT

CONSTANT STR: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0111"; --STR STORE RELATIVE

CONSTANT TRAP: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111"; --TRAP

CONSTANT RTI: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000"; --RTI

BEGIN 
-------------------------------------------MOVE TO THE NEXT STATE-------------------------------
NEXTSTATELOGIC: PROCESS(CLK)
BEGIN
IF (CLK'EVENT AND CLK ='1') THEN 
	IF (RST ='1') THEN 
	CPU_STATE <= S0;
	ELSE 
	CPU_STATE <= NEXT_STATE;
END IF;
ELSE 
CPU_STATE <= CPU_STATE;
END IF;
END PROCESS;

--------------------------------------------------------------------------------
FSM: PROCESS(IR_OUT, NZP_OUT, CPU_STATE, NEXT_STATE)

VARIABLE TRAPVECTOR : STD_LOGIC_VECTOR( 7 DOWNTO 0);
VARIABLE OPCODE : STD_LOGIC_VECTOR( 3 DOWNTO 0);
VARIABLE PC_OFFSET : STD_LOGIC_VECTOR( MW-1 DOWNTO 0);
VARIABLE SR1IN : STD_LOGIC_VECTOR( W-1 DOWNTO 0);
VARIABLE SR2IN : STD_LOGIC_VECTOR( W-1 DOWNTO 0);
VARIABLE DRIN : STD_LOGIC_VECTOR( W-1 DOWNTO 0);
VARIABLE IR5 : STD_LOGIC;
VARIABLE IMMEDIATE : STD_LOGIC_VECTOR( 4 DOWNTO 0);
VARIABLE BASEREG : STD_LOGIC_VECTOR( W-1 DOWNTO 0);
VARIABLE NZPVAL :STD_LOGIC_VECTOR(2 DOWNTO 0);  
BEGIN  
CASE CPU_STATE IS 
  WHEN S0 =>					--THE FETCH CYCLE
	PC_EN <= '0'  ;
	GATE_PC_EN <= '0';					
	LD_PCMUX <= "00";
	MAR_EN <= '0';
	MEM_EN <='0' ;
	RD_WR_EN<='0';
	MDR_EN<='0';
	MDR_GATE_EN<= '0';
	IR_EN<='0' ;
	LD_ADDR2MUX<="00";
	LD_ADDR1MUX<='0' ;
	LD_MM <='0';
	GATE_MARMUX<='0';
	DR_REG<="000";
	REG_EN<='0' ;
	SR1 <="000";
	SR2<= "000";
	LD_SR2MUX<="00" ; 
	LD_ALU<="00";
	GATE_ALU<='0';
	LD_CC<='0';
	NEXT_STATE <= S1;
WHEN S1 =>
	PC_EN <= '0';			--enable THE MAR AND THE PC_GATE--
  	LD_PCMUX <= "00";
        GATE_PC_EN <= '1';	
        MAR_EN <= '1';
        NEXT_STATE <= S2;

	
WHEN S2 => 
	MAR_EN<= '0';
	GATE_PC_EN <= '0';
	MEM_EN <= '1';
	RD_WR_EN <= '1';
	NEXT_STATE <= S2A;

--WHEN S2A =>   				--WAIT ONE CLOCK CYCLE SO THAT THE DATA GETS TO THE MDR
 --NEXT_STATE <= S2;

WHEN S2A =>
	RD_WR_EN <= '0';
	MEM_EN <= '0';
	MDR_EN <= '1';
	--MDR_GATE_EN  <= '0';
        --IR_EN <= '0';
	NEXT_STATE <= S2B;

WHEN S2B => 
       MDR_EN <= '0';
	MDR_GATE_EN  <= '1';
	IR_EN <='1';
	NEXT_STATE <= S2C;
WHEN S2C =>
	
	MDR_GATE_EN <= '0';
	--MDR_EN <= '0';
	IR_EN <= '0';
	NEXT_STATE <= S3;
WHEN S3 =>	
	TRAPVECTOR := IR_OUT (7 DOWNTO 0);				--THE DECODE STATE
        OPCODE := IR_OUT ( 15 DOWNTO 12);
	PC_OFFSET := IR_OUT (8 DOWNTO 0);
	SR1IN := IR_OUT (8 DOWNTO 6);
	SR2IN := IR_OUT (2 DOWNTO 0);
	DRIN := IR_OUT (11 DOWNTO 9);
	IR5 := IR_OUT(5);
	IMMEDIATE := IR_OUT(4 DOWNTO 0);
	BASEREG := IR_OUT(8 DOWNTO 6);
	NZPVAL := IR_OUT(11 DOWNTO 9);

	CASE OPCODE IS
	WHEN ADD => 						--ADD
	  IF IR5 = '0' THEN 
		LD_CC <= '1';
		SR1 <= SR1IN;
		SR2 <= SR2IN;
		--LD_ALU <= "00";
		--LD_SR2MUX <= "10";
		--GATE_ALU <=  '1';
		--REG_EN <= '1';
		NEXT_STATE <= S3AD;
	  ELSE
		LD_CC <= '1';
		SR1 <= SR1IN;
		--LD_SR2MUX <=  "01";
		--LD_ALU <= "00";
		--GATE_ALU <= '1';
		--REG_EN <= '1';
		NEXT_STATE <= S3AD1;
	  END IF;
		
	WHEN ANDL=>						--AND
	  IF IR5 = '0' THEN 
		LD_CC <= '1';
		SR1 <= SR1IN;
		SR2 <= SR2IN;
		--LD_ALU <= "10";
		--LD_SR2MUX <= "10";
		--GATE_ALU <=  '1';
		--REG_EN <= '1';
		NEXT_STATE <= S3AN;
	  ELSE
		LD_CC <= '1';
		SR1 <= SR1IN;
		--LD_SR2MUX <=  "01";
		--LD_ALU <= "10";
		--GATE_ALU <= '1';
		--NEXT_STATE <= S3ADN1;
		-- REG_EN <= '1';		
	        
	END IF;
	
	WHEN NOTL =>				--NOT
	        LD_CC <= '1';
		SR1 <= SR1IN;
		--LD_SR2MUX <=  "01";
		--LD_ALU <= "11";
		--GATE_ALU <= '1';
		--REG_EN <= '1';		
		NEXT_STATE <= S3NOT; 				-- S3A STATE WHERE DATA IS STORED TO DEST REG
	WHEN BR =>
	   if (NZP_OUT = "000" and IR_OUT = "0000000000000000") then
		LD_MM <= '0';
		GATE_MARMUX <= '1';
		LD_PCMUX <= "01";
		PC_EN  <= '1';
		NEXT_STATE <= S8;
	   else
		PC_EN <= '1';
		LD_PCMUX <= "00";
		NEXT_STATE <= S1;				--IF THE NZP IS NOT SET TO RESET THEN MAR AND PC_GATE ARE ENABLED
	  end if;
	WHEN LD => 
		LD_CC <= '1';
		LD_ADDR2MUX <= "10";
		LD_ADDR1MUX <= '1';
		LD_MM <= '1';
		GATE_MARMUX <= '1';
		MAR_EN <= '1';
		NEXT_STATE <=  S3LD;    				--S3B STATE WHERE FROM MEM TO REG
	WHEN LDI =>
		LD_CC <= '1';
		LD_ADDR1MUX <='1';
		LD_ADDR2MUX <= "10";
		LD_MM <= '1';
		GATE_MARMUX <= '1';
		MAR_EN <= '1';		
		NEXT_STATE <= S3LDI;	
			--FROM MEM TO MAR AGAIN AND THEN TO S3B
	--WHEN LDR =>
		--LD_CC <= '1';
		--LD_ADDR1MUX <='1';
		--LD_ADDR2MUX <= "01";
		--LD_MM <= '1';
		--GATE_MARMUX <= '1';
		--MAR_EN <= '1';		
		--NEXT_STATE <= S3D;
		
	--WHEN LEA => 
		--LD_CC <= '1';
		--LD_ADDR1MUX <='1';
		--LD_ADDR2MUX <= "01";
		--LD_MM <= '1';
		--GATE_MARMUX <= '1';
		--MAR_EN <= '1';		
		--NEXT_STATE <= S3E;
	WHEN ST =>
		LD_ADDR2MUX <= "10";
		LD_ADDR1MUX <= '1';
		LD_MM <= '1';
		GATE_MARMUX <= '1';
		MAR_EN <= '1';
		NEXT_STATE <=  S3ST;				--LOAD THE MDR WITH THE VALUE FRM THE REGISTER
	WHEN STI =>
		LD_ADDR1MUX <='1';
		LD_ADDR2MUX <= "10";
		LD_MM <= '1';
		GATE_MARMUX <= '1';
		MAR_EN <= '1';		
		NEXT_STATE <= S3STI;	
	--WHEN STR =>			--INDIRECT STORING ANOTHER SAME PROCESS
		--LD_ADDR1MUX <='1';
		--LD_ADDR2MUX <= "01";
		--LD_MM <= '1';
		--GATE_MARMUX <= '1';
		--MAR_EN <= '1';		
		--NEXT_STATE <= S3H;		
	--WHEN JMP =>
		--LD_ADDR1MUX <='1';
		--LD_ADDR2MUX <= "00";
		--LD_MM <= '1';
		--GATE_MARMUX <= '1';
		--MAR_EN <= '1';					--JMP TO THE FOLLOWING ADDRESS
		--NEXT_STATE <= S3I;
	--WHEN  JSR =>
		--LD_ADDR1MUX <='1';
		--LD_ADDR2MUX <= "11";
		--LD_MM <= '1';
		--GATE_MARMUX <= '1';
		--MAR_EN <= '1';					--JMP TO THE FOLLOWING ADDRESS
		--NEXT_STATE <= S3J;
	--WHEN JSRR =>
        	--LD_ADDR1MUX <='1';
		--LD_ADDR2MUX <= "00";
		--LD_MM <= '1';
		--GATE_MARMUX <= '1';
		--MAR_EN <= '1';					--JMP TO THE FOLLOWING ADDRESS
		--NEXT_STATE <= S3K;
	

	--WHEN TRAP =>
		--SOMETHING
	--WHEN RTI =>
		--SOMETHING
	
WHEN OTHERS =>
	PC_EN <= '1';
	LD_PCMUX <= "00";
	NEXT_STATE <=S1 ;
END CASE;
------------------------------------------------------------------------------------------------------------------------
------------------------------------EXECUTE CYCLE-----------------------------------------------------------------------
-----------------ADD,AND,NOT--------------------------------------------------------------------------------------

WHEN S3AD=>
	LD_CC<= '0';
	LD_SR2MUX <= "10"; 
	LD_ALU <= "00";
	GATE_ALU <= '1';    --LOADING THE DATA FROM THE ALU TO THE REGISTER 
	DR_REG<=DRIN;
	REG_EN <= '1';
	NEXT_STATE <= S3ADN;
---------------------IMMEDIATE ADD---------------------------------------------------------------------------------------
WHEN S3AD1=>
	LD_CC<= '0';
	LD_SR2MUX <= "01";
	LD_ALU <= "00";
	GATE_ALU <= '1';
	DR_REG <=DRIN;
	REG_EN <= '1';
	NEXT_STATE <= S3ADN;
---------------------AND-----------------------------------------------------------------------------------------------
WHEN S3AN =>
	LD_CC<= '0';
	LD_SR2MUX <= "10"; 
	LD_ALU <= "10";
	GATE_ALU <= '1';    --LOADING THE DATA FROM THE ALU TO THE REGISTER 
	DR_REG<=DRIN;
	REG_EN <= '1';
	NEXT_STATE <= S3ADN;
-----------AND IMMEDIATE--------------------------------------------------------------------
WHEN S3AN1=>
	LD_CC<= '0';
	LD_SR2MUX <= "01";
	LD_ALU <= "10";
	GATE_ALU <= '1';
	DR_REG <=DRIN;
	REG_EN <= '1';
	NEXT_STATE <= S3ADN;
------------------------------------------NOT INSTRUCTION-------------------------------------------------------------------------------------------------------------------------
WHEN S3NOT =>
	LD_CC <= '0';
	LD_SR2MUX <= "01";
	LD_ALU <= "11";
	GATE_ALU <= '1';
	DR_REG <=DRIN;
	REG_EN <= '1';
	NEXT_STATE <= S3ADN;
---------------------------------------CLOSE THE GATE BEHIND YOU AND THEN SET TO NEXT INSTRUCTION---------------------------------------------------------------------------------
WHEN S3ADN =>		
	GATE_ALU <= '0';
	REG_EN <= '0';
	NEXT_STATE <= S000;
--WHEN S3ADN1 =>			--ADDED ANOTHER STATE SO THAT IT WILL BE STORED IN THE REG------
	--NEXT_STATE <=S000;
------------------------------------------------------------------------------------------------------------------------
WHEN S000 =>
	LD_PCMUX <= "00"; 	--TAKE THE NEXT INSTRUCTION
	PC_EN <= '1';
	GATE_PC_EN <= '0';
	MAR_EN <= '0';
	NEXT_STATE <=S1;
-----------------------------------------------LOAD OPERANDS--------------------------------------
-------------------------------LD-----------------------------------------
--WHEN S3LD => 	
	---LD_ALU <= '0';
	--LD_SR2MUX <= "10";
	--NEXT_STATE <= S3LD1;		--LOADING THE DATA FROM THE MEMORY TO THE REG 
	
WHEN S3LD=> 
	LD_CC <='0';
	GATE_MARMUX <= '0';
	MAR_EN <= '0';
	RD_WR_EN <= '1';
	MEM_EN <= '1';
	LD_MM <= '0';
	
	--LD_ADDR1MUX <= '0';
	--LD_ADDR2MUX <= "00";
	
	NEXT_STATE <= S3LD1;
--WHEN S3AN2 =>  			--THE DATA GOES TO THE MDR
	--NEXT_STATE <= S3AN3;
WHEN S3LD1 =>
	RD_WR_EN <= '0';
	MEM_EN <= '0';
	MDR_EN <= '1';
	--MDR_GATE_EN <='0';
	--DR_REG <=DRIN;
	--REG_EN<= '1';
	NEXT_STATE <= S3LD2;
WHEN S3LD2 => 				--CLOSE THE GATE BEHIND YOU
	MDR_EN <= '0';
	MDR_GATE_EN <= '1';
	DR_REG <= DRIN;
	REG_EN <= '1';
 	NEXT_STATE <= S3LD3;
-----------------------CLOSE THE GATE BEHIND YOU AND STORE THE DATA-----------------------
WHEN S3LD3 =>
	MDR_GATE_EN <= '0';
	REG_EN <='0';
	NEXT_STATE <= S3LD4;
WHEN S3LD4 =>
	NEXT_STATE <= S000;

	--LD_PCMUX <= "00"; 	--TAKE THE NEXT INSTRUCTION
	--PC_EN <= '1';
	--GATE_PC_EN <= '0';
	--MAR_EN <= '0';
	--NEXT_STATE <=S1;
	
--------------------LDI--------------------------------------------------

WHEN S3LDI =>
	GATE_MARMUX <= '0';
	LD_MM <= '0';
	LD_CC <= '0';
	MAR_EN <= '0';	
	RD_WR_EN <= '1';
	MEM_EN <= '1';
	
	--LD_ADDR1MUX <= '0';
	--LD_ADDR2MUX <= "00";
	
	
	NEXT_STATE <= S3LDI1;
 --WHEN S3CA =>  			         --THE DATA GOES TO THE MDR
	--NEXT_STATE <= S3CB;		--ONE EXTRA CLOCK CYCLE FOR THE DATA TO GO FROM THE MEMORY TO THE MDR.
WHEN S3LDI1 =>
	RD_WR_EN <='0';
	MEM_EN <= '0';
	MDR_EN <= '1';
	--MDR_GATE_EN <='1';
	--MAR_EN <= '0';
	NEXT_STATE<= S3LDI2;
----------------------------------------------
WHEN S3LDI2 =>
	MDR_EN <= '0';
	MDR_GATE_EN <= '1';
	MAR_EN <= '1';
	NEXT_STATE <= S3LDI3;
WHEN S3LDI3 =>
	MDR_GATE_EN <= '0';
	MAR_EN <='0';
	RD_WR_EN <='1';
	MEM_EN <= '1';
	NEXT_STATE <= S3LD1;
------------------------------------------------------------------------------------------------------------------
--WHEN S3CC =>
-- NEXT_STATE <= S3CD; --VALIDATE THE DATA IN THE MAR
--WHEN S3CD =>
--NEXT_STATE <= S3B;
--------------------------LDR----------------------------------------------------
--DON'T REALLY KNOW WHAT TO DO
--------------------------LEA------------------------------------------------------
--DON'T KNOW LEA EITHER
---------------------------------------------------------------------------------
--------------------STORE THE VALUE-----------------------------------------------------
-------------------ST-------------------------------------------------------------------
WHEN S3ST =>
	--LD_ADDR2MUX <= "00";
	GATE_MARMUX <= '0';
	MAR_EN <= '0';
	--LD_ADDR1MUX <= '0';
	LD_MM <= '0';
	--SR1 <= DRIN;
	NEXT_STATE <= S3ST1;
WHEN S3ST1 =>
	SR1 <= DRIN;
	LD_ALU <= "01";
	GATE_ALU <= '1';
	MDR_EN <= '0';
	MEM_EN <= '1';
	NEXT_STATE <= S3ST2;
WHEN S3ST2 => 
	GATE_ALU <= '0'; 
	MEM_EN <= '0';
	RD_WR_EN <= '0';
				--TAKES TWO CLOCK CYLES SO 
	NEXT_STATE <= S3ST3;
WHEN S3ST3 =>
	--MEM_EN <= '1';
	NEXT_STATE <= S3ST4;		--TAKES 2 CLOCK CYCLES TO WRITE INTO THE MEMMORY
WHEN S3ST4 =>
	--MEM_EN <='0';
	NEXT_STATE <= S000;		--TAKE THE NEXT INSTRUCTION
------------STI----------------------------------------------------
	
WHEN S3STI =>	
	GATE_MARMUX <= '0';
	MAR_EN <= '0';
	RD_WR_EN <= '1';
	MEM_EN <= '1';
	
	--LD_ADDR1MUX <= '0';
	--LD_ADDR2MUX <= "00";
	LD_MM <= '0';
	
	NEXT_STATE <= S3STI1;
--WHEN S3STI1 =>
		         		--THE DATA GOES TO THE MDR
	--NEXT_STATE <= S3STI2;		--ONE EXTRA CLOCK CYCLE FOR THE DATA TO GO FROM THE MEMORY TO THE MDR.
WHEN S3STI1 =>
	RD_WR_EN <= '0';
	MEM_EN <= '0';
	MDR_EN <= '1';
	--MDR_GATE_EN <='0';
	--MAR_EN <= '1';
	NEXT_STATE<= S3STI2;

WHEN S3STI2 =>
	MDR_GATE_EN <='1';
	MAR_EN<='1';
	NEXT_STATE <= S3STI3; 
WHEN S3STI3 =>
	MDR_GATE_EN <='0';
	MAR_EN <='0';
	SR1<= DRIN;
	NEXT_STATE <= S3ST1;
----------------------------------------------------------------------------------------------------------
WHEN S8 =>
NEXT_STATE <= S000;
------------------------------------------------------------------------------------------------
END CASE ;
END PROCESS;

END DATAPATH;

