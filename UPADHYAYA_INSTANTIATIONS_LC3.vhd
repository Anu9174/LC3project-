library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity UPADHYAYA_DATAPATH_ALL is
generic(
P:natural:= 16;
MW: natural := 9;
W: NATURAL := 3;
E : NATURAL := 8);
port(
CLK : in std_logic;
RST: IN STD_LOGIC);
--PC_EN: IN STD_LOGIC;
--GATE_PC_EN: IN STD_LOGIC;
--LD_PCMUX: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
--MAR_EN: IN STD_LOGIC;

--MEM_EN: IN STD_LOGIC;
--RD_WR_EN: IN STD_LOGIC;
--MDR_EN: IN STD_LOGIC;
--MDR_GATE_EN: IN STD_LOGIC;
--IR_EN: IN STD_LOGIC;
--LD_ADDR2MUX: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
--LD_ADDR1MUX: IN STD_LOGIC;
--LD_MM: IN STD_LOGIC;
--GATE_MARMUX: IN STD_LOGIC;
--DR_REG: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
--REG_EN: IN STD_LOGIC;
--SR1: IN STD_LOGIC_VECTOR( W-1 DOWNTO 0);
--SR2: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
--LD_SR2MUX: IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
--LD_ALU: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
--GATE_ALU: IN STD_LOGIC);

--BUS_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_DATAPATH_ALL;
--------------------------------------------------------------------------------------
ARCHITECTURE STRUCTURAL OF UPADHYAYA_DATAPATH_ALL IS 
--------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_PC IS
GENERIC(
P : NATURAL :=16);
PORT(
CLK: IN STD_LOGIC;
RST: IN STD_LOGIC;
PC_EN: IN STD_LOGIC;
BUS_IN: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
PC_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0);
PC_MARMUX: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
-----------------------------------------------------------------------------------
COMPONENT UPADHYAYA_PC_GATE IS
GENERIC(
P : NATURAL := 16);
PORT(
--CLK : IN STD_LOGIC;
PC_GATE_EN: IN STD_LOGIC;
PC_GATE_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
PC_GATE_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
---------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_PCMUX IS
GENERIC(P: NATURAL := 16 );
PORT(
LD_PCMUX: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
OP_A: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_B: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_C: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
PC_MUX_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_MAR
generic(
 P: natural:=  16 ;
 MW: natural := 9);
port(
 CLK: in std_logic;
 RST: in std_logic;
 MAR_EN: in std_logic;
 BUS_IN: in std_logic_vector(P-1 downto 0);
 MAR_OUT: out std_logic_vector(MW-1 downto 0))
;
END COMPONENT;
-------------------------------------------------------------------------------
COMPONENT UPADHYAYA_RAM is
generic(
 P : natural:= 16;
MW : natural:= 9);
port(
  CLK : in std_logic;
  MEM_EN: in std_logic;    
  RD_WR_EN: in std_logic;
  MEM_ADD:in std_logic_vector(MW-1 downto 0);
  MDR_IN : in std_logic_vector(P-1 downto 0);
  MEM_OUT: out std_logic_vector(P-1 downto 0));
end COMPONENT;
--------------------------------------------------------------------------------

COMPONENT UPADHYAYA_MDR is
generic(
P : natural := 16);
port(
 CLK : in std_logic;
 RST: in std_logic;
 MDR_EN: in std_logic;
 MEM_IN: in std_logic_vector(P-1 downto 0);
 BUS_IN: in std_logic_vector(P-1 downto 0);
 MDR_BUS: out std_logic_vector(P-1 downto 0));
end COMPONENT;


---------------------------------------------------------------------------------
COMPONENT UPADHYAYA_MDR_TRISTATE is
generic(
 P: natural := 16);
port ( 
--CLK: in std_logic;
MDR_GATE_EN: in std_logic;
MDR_IN: in std_logic_vector(P-1 downto 0);
GATE_MDR_OUT: out std_logic_vector(P-1 downto 0));
end COMPONENT;

---------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_IR IS
GENERIC(
P: NATURAL := 16);
PORT(
CLK: IN STD_LOGIC;
RST: IN STD_LOGIC;
IR_EN: IN STD_LOGIC;
IR_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
IR_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
----------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_FSM IS
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

END COMPONENT;
---------------------------------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_SIGEXT1 IS
GENERIC ( P: INTEGER := 16 );
PORT (
IR_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGEXT1 : OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
----------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_SIGEXT2 IS
GENERIC ( P: INTEGER := 16 );
PORT (
IR_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGEXT2 : OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
----------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_SIGEXT3 IS
GENERIC ( P: INTEGER := 16 );
PORT (
IR_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGEXT3 : OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
----------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_ZEXT IS
GENERIC(P: NATURAL := 16 );
PORT(
OP_A: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_Q: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
----------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_ADDR2MUX IS
GENERIC(P: INTEGER:= 16);
PORT(
 LD_ADDR2MUX: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
 OP_A1 : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
 OP_A2 : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
 OP_A3 : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
 --OP_A4:  IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
 OP_Q : OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;

-----------------------------------------------------------------------------------


COMPONENT UPADHYAYA_16BIT_REG IS
GENERIC(
P : NATURAL := 16);
PORT(
CLK : IN STD_LOGIC;
RST : IN STD_LOGIC;
REG_EN: IN STD_LOGIC;
REG_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
REG: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
----------------------------------------------------------------------------------
COMPONENT UPADHYAYA_REG_ARRAY IS
GENERIC(
P: NATURAL := 16;
W: NATURAL := 3;
E: NATURAL := 8);
PORT (
CLK: IN STD_LOGIC;
RST : IN STD_LOGIC;
REG_EN :IN STD_LOGIC;
REG_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
DR_REG: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
SR1: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
SR2: IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
OPQ1: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OPQ2: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
-----------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_ADDR1MUX IS
GENERIC(
P: NATURAL := 16);
PORT (
LD_ADDR1MUX: STD_LOGIC;
OP_A : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_B : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_Q: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
--------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_SIGEXT4 IS
GENERIC( P: NATURAL := 16 );
PORT (
OP_A : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_Q: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
--------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_SR2MUX IS
GENERIC( P: NATURAL := 16);
PORT (
LD_SR2_MUX: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
OP_A : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_B : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_Q: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
--------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_ADDER IS
GENERIC(P: NATURAL := 16);
PORT(
OP_A : IN STD_LOGIC_VECTOR( P-1 DOWNTO 0);
OP_B: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_Q : OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;

-------------------------------------------------------------------------------
COMPONENT UPADHYAYA_ALU is
GENERIC(P: NATURAL := 16); 
port(
 OP_A: in std_logic_vector(P-1 downto 0);
 OP_B: in std_logic_vector(P-1 downto 0);
 LD_ALU : in std_logic_vector(1 downto 0);
 OP_Q: out std_logic_vector(P-1 downto 0)); 
end COMPONENT;
-----------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_GATE_ALU is
generic(
 P: natural := 16);
port ( 
--CLK: in std_logic;
GATE_ALU: in std_logic;
GATE_ALU_IN: in std_logic_vector(P-1 downto 0);
GATE_ALU_OUT: out std_logic_vector(P-1 downto 0));
end COMPONENT;
----------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_MARMUX IS
GENERIC(P: NATURAL := 16 );
PORT (
LD_MM : IN STD_LOGIC;
ZEXT_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
ADDER_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
MARMUX_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;

--------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_GATE_MARMUX IS
GENERIC(P: NATURAL := 16);
PORT(
--CLK: IN STD_LOGIC;
GATE_MARMUX: IN STD_LOGIC;
MARMUX_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
GATE_MARMUX_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
---------------------------------------------------------------------------------------------
COMPONENT UPADHYAYA_NZP IS
GENERIC(
P: NATURAL := 16;
W: NATURAL := 3
);
PORT(
		CLK: in std_logic;
		RST: in std_logic;
		LD_CC: in std_logic;
		
		OP_A: in std_logic_vector(P-1 downto 0);
		NZP_OUT: out std_logic_vector(W-1 downto 0)
	);

END COMPONENT;
--------------------------------------------------------------------------------------------
SIGNAL PC_EN : STD_LOGIC;
SIGNAL GATE_PC_EN : STD_LOGIC;
SIGNAL LD_PCMUX: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL MAR_EN : STD_LOGIC;
SIGNAL MEM_EN: STD_LOGIC; 
SIGNAL RD_WR_EN : STD_LOGIC;
SIGNAL MDR_EN : STD_LOGIC;
SIGNAL MDR_GATE_EN : STD_LOGIC;
SIGNAL IR_EN : STD_LOGIC;
SIGNAL LD_ADDR2MUX: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL LD_ADDR1MUX: STD_LOGIC;
SIGNAL LD_MM: STD_LOGIC;
SIGNAL GATE_MARMUX: STD_LOGIC;
SIGNAL DR_REG: STD_LOGIC_VECTOR( W-1 DOWNTO 0);
SIGNAL REG_EN : STD_LOGIC;
SIGNAL SR1: STD_LOGIC_VECTOR( W-1 DOWNTO 0);
SIGNAL SR2 : STD_LOGIC_VECTOR( W-1 DOWNTO 0);
SIGNAL LD_SR2MUX : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL LD_ALU : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL LD_CC: STD_LOGIC; 
SIGNAL GATE_ALU : STD_LOGIC;
SIGNAL S_PC_OUT: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_PC_MUX: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
signal S_BUS: std_logic_vector(P-1 downto 0);
SIGNAL S_MAR_OUT : STD_LOGIC_VECTOR(MW-1 DOWNTO 0);
SIGNAL S_MDR_BUS : STD_LOGIC_VECTOR(P-1 DOWNTO 0);
--SIGNAL S_GATE_MDR_OUT : STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_MEM_OUT: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_IR_OUT: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_SIGEXT1 : STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_SIGEXT2: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_SIGEXT3: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_REGOUT1: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_REGOUT2: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAl S_ALU: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_ADDR1MUX: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_ADDR2MUX: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_ADDER: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_ZEXT: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_MARMUX: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_PCMUX_OUT: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_SR2MUX: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_SIGEXT4: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL S_NZP_OUT: STD_LOGIC_VECTOR(W-1 DOWNTO 0);
--SIGNAL S_REG_OUT: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
--SIGNAL S_GATE_ALU: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
--------------------------------------------------------------------------------------------------------
BEGIN
INST0_PC: UPADHYAYA_PC GENERIC MAP (P) PORT MAP(CLK,RST,PC_EN,S_PCMUX_OUT,S_PC_OUT,S_PC_MUX);
INST2_PC_GATE: UPADHYAYA_PC_GATE GENERIC MAP (P) PORT MAP( GATE_PC_EN,S_PC_OUT,S_BUS);
INST1_PC_MUX: UPADHYAYA_PCMUX GENERIC MAP (P) PORT MAP (LD_PCMUX,S_PC_MUX,S_BUS,S_ADDER, S_PCMUX_OUT);
INST70_FSM: UPADHYAYA_FSM GENERIC MAP (P,MW,W,E) PORT MAP(CLK,RST,S_IR_OUT,S_NZP_OUT,PC_EN,GATE_PC_EN,LD_PCMUX,MAR_EN,MEM_EN,RD_WR_EN,MDR_EN,MDR_GATE_EN,IR_EN,LD_ADDR2MUX,LD_ADDR1MUX,LD_MM,GATE_MARMUX,DR_REG,REG_EN,SR1,SR2,LD_SR2MUX,LD_ALU,LD_CC,GATE_ALU);

INST3_MAR: UPADHYAYA_MAR GENERIC MAP(P,MW) PORT MAP(CLK,RST,MAR_EN,S_BUS,S_MAR_OUT);
INST4_RAM: UPADHYAYA_RAM GENERIC MAP (P,MW) PORT MAP (CLK, MEM_EN, RD_WR_EN, S_MAR_OUT,S_BUS, S_MEM_OUT);
INST5_MDR: UPADHYAYA_MDR GENERIC MAP(P) PORT MAP( CLK,RST, MDR_EN,S_MEM_OUT,S_BUS , S_MDR_BUS);--CHANGE REG TO GATE ALU
INST6_GATE_MDR: UPADHYAYA_MDR_TRISTATE GENERIC MAP(P) PORT MAP (MDR_GATE_EN ,S_MDR_BUS,S_BUS );
INST7_IR: UPADHYAYA_IR GENERIC MAP (P) PORT MAP (CLK, RST, IR_EN,S_BUS, S_IR_OUT);

INST8_SIGEXT1: UPADHYAYA_SIGEXT1 GENERIC MAP (P) PORT MAP (S_IR_OUT,S_SIGEXT1); 
INST9_SIGEXT2: UPADHYAYA_SIGEXT2 GENERIC MAP (P) PORT MAP (S_IR_OUT,S_SIGEXT2);
INST10_SIGEXT3: UPADHYAYA_SIGEXT3 GENERIC MAP (P) PORT MAP (S_IR_OUT,S_SIGEXT3);
INST11_ADDR2MUX: UPADHYAYA_ADDR2MUX GENERIC MAP (P) PORT MAP (LD_ADDR2MUX, S_SIGEXT1,S_SIGEXT2,S_SIGEXT3,S_ADDR2MUX);
INST14_ADDR1MUX: UPADHYAYA_ADDR1MUX GENERIC MAP (P) PORT MAP(LD_ADDR1MUX,S_REGOUT1, S_PC_MUX,S_ADDR1MUX);
INST15_ADDER: UPADHYAYA_ADDER GENERIC MAP (P) PORT MAP(S_ADDR2MUX, S_ADDR1MUX, S_ADDER);
INST17_MARMUX: UPADHYAYA_MARMUX GENERIC MAP(P) PORT MAP (LD_MM,S_ZEXT,S_ADDER, S_MARMUX);
INST18_GATE_MARMUX: UPADHYAYA_GATE_MARMUX GENERIC MAP(P) PORT MAP( GATE_MARMUX,S_MARMUX,S_BUS);
--INST012_16_BIT_REGISTER: UPADHYAYA_16BIT_REG GENERIC MAP(P) PORT MAP(CLK,RST,REG_EN,S_GATE_MDR_OUT,S_REG_OUT);
INST12_REG_ARRAY: UPADHYAYA_REG_ARRAY GENERIC MAP(P,W,E) PORT MAP(CLK, RST , REG_EN,S_BUS,DR_REG,SR1,SR2,S_REGOUT1,S_REGOUT2);
INST19_SIGEXT4: UPADHYAYA_SIGEXT4 GENERIC MAP(P)PORT MAP(S_IR_OUT, S_SIGEXT4);
INST20_SR2MUX: UPADHYAYA_SR2MUX GENERIC MAP(P) PORT MAP (LD_SR2MUX,S_SIGEXT4,S_REGOUT2, S_SR2MUX);
INST13_ALU: UPADHYAYA_ALU GENERIC MAP (P) PORT MAP (S_SR2MUX, S_REGOUT1, LD_ALU,S_ALU);


INST16_ZEXT: UPADHYAYA_ZEXT GENERIC MAP(P) PORT MAP( S_IR_OUT,S_ZEXT);

--CHANGE MDR BUS

INST21_GATEALU: UPADHYAYA_GATE_ALU GENERIC MAP (P) PORT MAP ( GATE_ALU,S_ALU,S_BUS); 
INST22_NZP: UPADHYAYA_NZP GENERIC MAP (P,W) PORT MAP(CLK,RST,LD_CC,S_BUS,S_NZP_OUT);
 
END STRUCTURAL;

