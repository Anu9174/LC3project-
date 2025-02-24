  ----------------------------------PC--------------------------------------------------
----------------------------------ANU UPADHYAYA---------------------------------------------
----------------------------------LC3 DATAPATH-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
ENTITY UPADHYAYA_PC IS
GENERIC(
P : NATURAL :=16);
PORT(
CLK: IN STD_LOGIC;
RST: IN STD_LOGIC;
PC_EN: IN STD_LOGIC;
BUS_IN: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
PC_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0);
PC_MARMUX: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_PC;
ARCHITECTURE PC_BEH OF UPADHYAYA_PC IS
SIGNAL TEMPQ1,TEMPQ2: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
BEGIN
PCPROCESS: PROCESS(CLK)
BEGIN
 IF (CLK = '1' AND CLK'EVENT) THEN 
	IF (RST = '1') THEN 
	  TEMPQ1 <= (others=>'0');
	  TEMPQ2 <= "0000000000000001";
	ELSIF (PC_EN = '1') THEN 
	  TEMPQ1 <= BUS_IN;
          TEMPQ2 <= BUS_IN +1;
        ELSE
	TEMPQ1 <= TEMPQ1;
	TEMPQ2 <= TEMPQ2;
	END IF;
ELSE
	TEMPQ1 <= TEMPQ1;
	TEMPQ2 <= TEMPQ2;

END IF;
END PROCESS PCPROCESS;
PC_OUT <= TEMPQ1;
PC_MARMUX<= TEMPQ2;
END PC_BEH;
---------------PCMUX-------------------------------------------------
---------------ANU UPADHYAYA-----------------------------------------
---------------LC3 DATA PATH-----------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_PCMUX IS
GENERIC(P: NATURAL := 16 );
PORT(
LD_PCMUX: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
OP_A: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_B: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_C: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
PC_MUX_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_PCMUX;
ARCHITECTURE PCMUX_BEH OF UPADHYAYA_PCMUX IS
SIGNAL Y: STD_LOGIC_VECTOR( P-1 DOWNTO 0);
BEGIN 
WITH LD_PCMUX SELECT
Y <= OP_A WHEN "00",
	OP_B WHEN "01",
	OP_C WHEN OTHERS;
PC_MUX_OUT <= Y;
END PCMUX_BEH;
---------------------------------PC GATE TRISTATE-----------------------------------------
---------------------------------ANU UPADHYAYA--------------------------------------------
---------------------------------LC3 DATAPATH---------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_PC_GATE IS
GENERIC(
P : NATURAL := 16);
PORT(
--CLK : IN STD_LOGIC;
PC_GATE_EN: IN STD_LOGIC;
PC_GATE_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
PC_GATE_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_PC_GATE;
ARCHITECTURE PC_TRISTATE_BEH OF UPADHYAYA_PC_GATE IS 
SIGNAL TEMPQ : STD_LOGIC_VECTOR(P-1 DOWNTO 0);
BEGIN
--PCGATE: PROCESS(CLK)
--BEGIN
--IF (CLK ='1' AND CLK'EVENT) THEN
	--IF (PC_GATE_EN = '1') THEN
	-- TEMPQ <= PC_GATE_IN;
	-- ELSE 
	-- TEMPQ <= (OTHERS=>'Z');
	--END IF;
WITH PC_GATE_EN SELECT
TEMPQ <= PC_GATE_IN WHEN '1',
	(OTHERS => 'Z') WHEN OTHERS ;
	
--ELSE
--TEMPQ <= TEMPQ;
--END IF;
--END PROCESS PCGATE;
PC_GATE_OUT <= TEMPQ;
END PC_TRISTATE_BEH;




--lc3  datapath
--vhdl
--Anu Upadhyaya
-----------------------------------------------------------
-------------------------MAR---------------------------------------------------------------
------------------------ANU UPADHYAYA----------------------------------------
------------------------LC3 DATAPATH-----------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity UPADHYAYA_MAR is
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
end UPADHYAYA_MAR;
architecture BEH_MAR of UPADHYAYA_MAR is
SIGNAL TEMPQ: STD_LOGIC_VECTOR(MW-1 DOWNTO 0);

BEGIN
MAR_PROCESS:PROCESS(CLK)
BEGIN
	IF(CLK='1'AND CLK'EVENT)THEN
		IF(RST='1')THEN
		  TEMPQ<=(OTHERS=>'Z');
		ELSIF(MAR_EN='1')THEN
		  TEMPQ<=BUS_IN(MW-1 DOWNTO 0);
		ELSE
		  TEMPQ<=TEMPQ;
		END IF;
	else
		tempq<= tempq;
	
	END IF;
END PROCESS;
MAR_OUT<=TEMPQ;
END BEH_MAR;

-----------------------------------MEMORY/RAM--------------------------------------------
----------------------------------ANU UPADHYAYA------------------------------------------
----------------------------------LC3 DATAPATH-------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity UPADHYAYA_RAM is
generic(
 P : natural:= 16;
MW : natural:= 9);
port(
  CLK : in std_logic;
  MDR_IN : in std_logic_vector(P-1 downto 0);
  MEM_EN: in std_logic;
  RD_WR_EN: in std_logic;
  MEM_ADD:in std_logic_vector(MW-1 downto 0);
  MEM_OUT: out std_logic_vector(P-1 downto 0));
end UPADHYAYA_RAM;
architecture RAM_BEH of UPADHYAYA_RAM is
 type data_array is array (integer range <>) of std_logic_vector(P-1 downto 0);
 signal data: data_array(0 to (2**MW -1)):= ("0010111000001001",
"1010110000001001","0101101111000110","1001100101111111","0001011111000110","0001010011100010",
"0011010000000110","1011100000000110","0000000000000000","0000000000000000","0000000000001111","0000000000001100",
"0000000000001111","0000000000000000","0000000000001111","0000000000000000",
OTHERS=>(OTHERS=>'0'));
 signal s_data: std_logic_vector(P-1 downto 0);
  
begin
MEMORY: process(clk,RD_WR_EN)
begin
  if( clk'event and clk='1') then
      if (MEM_EN = '0') then
        s_data <= (others=> 'Z');
      elsif (RD_WR_EN= '0') then
        data(conv_integer(MEM_ADD)) <= MDR_IN ;
        s_data <= (others => 'Z');
      elsif (RD_WR_EN = '1' )then
        s_data <= data(conv_integer(MEM_ADD));
      end if;
 else 
    s_data<= s_data;
    data <= data;
end if;

end process MEMORY;
MEM_OUT<= s_data;
END RAM_BEH;


         
       
------------------------MDR-------------------------------------------------------------------------------------------------------------------
------------------------ANU UPADHYAYA-----------------------------------------------------------------------
------------------------LC3 DATAPATH-----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity UPADHYAYA_MDR is
generic(
P : natural := 16);
port(
 CLK : in std_logic;
 RST: in std_logic;
 MDR_EN: in std_logic;
 MEM_IN: in std_logic_vector(P-1 downto 0);
 BUS_IN: in std_logic_vector(P-1 downto 0);
 MDR_BUS: out std_logic_vector(P-1 downto 0));
end UPADHYAYA_MDR;
ARCHITECTURE BEH_MDR OF UPADHYAYA_MDR IS
SIGNAL TEMPQ: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
BEGIN
MDR_PROCESS:PROCESS(CLK)
BEGIN
	IF(CLK='1'AND CLK'EVENT)THEN
		IF(RST='1')THEN
		  TEMPQ<=(OTHERS=>'Z');
		ELSIF(MDR_EN='1')THEN
		  TEMPQ<=MEM_IN(P-1 DOWNTO 0);
		ELSIF(MDR_EN='0')THEN
		  TEMPQ<=BUS_IN(P-1 DOWNTO 0);
		ELSE
		  TEMPQ<=(OTHERS=>'Z');
		END IF;
	ELSE
        TEMPQ <= TEMPQ;
	END IF;
END PROCESS;
MDR_BUS<=TEMPQ;
END BEH_MDR;

--------------------------------MDR GATE/TRISTATE-----------------------------------------------
--------------------------------ANU UPADHYAYA---------------------------------------------------
--------------------------------LC3 DATA PATH---------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity UPADHYAYA_MDR_TRISTATE is
generic(
 P: natural := 16);
port ( 
--CLK: in std_logic;
MDR_GATE_EN: in std_logic;
MDR_IN: in std_logic_vector(P-1 downto 0);
GATE_MDR_OUT: out std_logic_vector(P-1 downto 0));
end UPADHYAYA_MDR_TRISTATE;

architecture MDR_TRISTATE_BEH of UPADHYAYA_MDR_TRISTATE is
 signal tempq : std_logic_vector(P-1 downto 0);
--begin
--tristate: process(CLK)
begin 
--if (CLK ='1' and CLK'event) then 
 -- if (MDR_GATE_EN = '1') then 
 -- tempq <= MDR_IN;
 -- else 
 -- tempq <= (others=>'Z');
--  end if;
--ELSE 
--tempq <= TEMPQ;
--end if;
WITH MDR_GATE_EN SELECT
tempq <= MDR_IN WHEN '1',
	(OTHERS => 'Z') WHEN OTHERS ;


--end process tristate;
GATE_MDR_OUT <= tempq;
end MDR_TRISTATE_BEH;
-----------------------------------IR------------------------------------------------------
-----------------------------------ANU UPADHYAYA-------------------------------------------
-----------------------------------LC3 DATAPATH--------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_IR IS
GENERIC(
P: NATURAL := 16);
PORT(
CLK: IN STD_LOGIC;
RST: IN STD_LOGIC;
IR_EN: IN STD_LOGIC;
IR_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
IR_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_IR;
ARCHITECTURE IR_BEH OF UPADHYAYA_IR IS
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
BEGIN 
IRPROCESS : PROCESS(CLK)
BEGIN
IF (CLK='1' AND CLK'EVENT) THEN
	IF ( RST= '1') THEN 
	Y <= (OTHERS=>'Z');
	ELSIF (IR_EN = '1') THEN 
	Y <= IR_IN;
	ELSE
	Y <= Y; --COULD ALSO BE 'Z'
	END IF;
ELSE
Y <= Y;
END IF;

END PROCESS IRPROCESS;
IR_OUT <= Y;
END IR_BEH;
------------------------SIGN EXTENDER 10:0--------------------------------------------
------------------------ANU UPADHYAYA-------------------------------------------------
------------------------LC3 DATAPATH--------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_SIGEXT1 IS
GENERIC ( P: INTEGER := 16 );
PORT (
IR_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGEXT1 : OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_SIGEXT1;
ARCHITECTURE SIGEXT1_BEH OF UPADHYAYA_SIGEXT1 IS
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
signal msb: std_logic;
begin
 msb <=  '1'  when (IR_IN(10)='1')else
         '0'  WHEN (IR_IN(10)='0');
with msb select
y<= "11111" & IR_IN(10 downto 0) when '1',
    "00000" & IR_IN(10 downto 0) when others;
SIGEXT1<= y;
end  SIGEXT1_BEH;
------------------------------------SIGNEXTENDER2 8:0-----------------------------------
------------------------------------ANU UPADHYAYA--------------------------------------------
------------------------------------LC3 DATAPATH--------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_SIGEXT2 IS
GENERIC ( P: INTEGER := 16 );
PORT (
IR_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGEXT2 : OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_SIGEXT2;
ARCHITECTURE SIGEXT2_BEH OF UPADHYAYA_SIGEXT2 IS
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
signal msb: std_logic;
begin
 msb <=  '1'  when (IR_IN(8)='1')else
         '0'  WHEN (IR_IN(8)='0');
with msb select
y<= "1111111" & IR_IN(8 downto 0) when '1',
    "0000000" & IR_IN(8 downto 0) when others;
SIGEXT2<= y;
end  SIGEXT2_BEH;
--------------------------------------SIGEXT3 5:0------------------------------------------
--------------------------------------ANU UPADHYAYA----------------------------------------
--------------------------------------LC3 DATAPATH-----------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_SIGEXT3 IS
GENERIC ( P: INTEGER := 16 );
PORT (
IR_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGEXT3 : OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_SIGEXT3;
ARCHITECTURE SIGEXT3_BEH OF UPADHYAYA_SIGEXT3 IS
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
signal msb: std_logic;
begin
 msb <=  '1'  when (IR_IN(5)='1')else
         '0'  WHEN (IR_IN(5)='0');
with msb select
y<= "1111111111" & IR_IN(5 downto 0) when '1',
    "0000000000" & IR_IN(5 downto 0) when others;
SIGEXT3<= y;
end  SIGEXT3_BEH;
-----------------------ZEXT---------------------------------
----------------------ANU UPADHYAYA-------------------------
----------------------LC3 DATA PATH ------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_ZEXT IS
GENERIC(P: NATURAL := 16 );
PORT(
OP_A: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_Q: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_ZEXT;
ARCHITECTURE ZEXT_BEH OF UPADHYAYA_ZEXT IS
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
BEGIN 
Y<= "00000000" & OP_A( 7 DOWNTO 0);
OP_Q <= Y;
END ZEXT_BEH;


----------------------------------ADDER2MUX--------------------------------------
----------------------------------ANU UPADHYAYA----------------------------------
----------------------------------LC3 DATA PATH----------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_ADDR2MUX IS
GENERIC(P: INTEGER:= 16);
PORT(
 LD_ADDR2MUX: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
 OP_A1 : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
 OP_A2 : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
 OP_A3 : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
 OP_Q : OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_ADDR2MUX;
ARCHITECTURE ADDR2MUX_BEH OF UPADHYAYA_ADDR2MUX IS
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);

BEGIN 
WITH LD_ADDR2MUX SELECT
Y<= OP_A1 WHEN "11",
	OP_A2 WHEN "10",
	OP_A3 WHEN "01",
	"0000000000000000" WHEN OTHERS;
OP_Q<= Y;
END ADDR2MUX_BEH;
 

----------------------------REGISTERS-----------------------------------------------
----------------------------ANU UPADHYAYA-------------------------------------------
----------------------------LC3 DATAPATH--------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_16BIT_REG IS
GENERIC(
P : NATURAL := 16);
PORT(
CLK : IN STD_LOGIC;
RST : IN STD_LOGIC;
REG_EN: IN STD_LOGIC;
REG_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
REG: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_16BIT_REG;
ARCHITECTURE REG_BEH OF UPADHYAYA_16BIT_REG IS 
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
BEGIN 
REGPROCESS: PROCESS(CLK)
BEGIN 
IF (CLK='1' AND CLK'EVENT) THEN 
	IF (RST = '1') THEN 
	Y <= "0000000000000000";
	ELSIF (REG_EN = '1') THEN
	Y <= REG_IN;
	ELSE 
	Y <= Y;
	END IF ;
ELSE
Y <=  Y;
END IF;
END PROCESS REGPROCESS;
REG <= Y;
END REG_BEH;
-------------------------------------REG_ARRAY-----------------------------------
-------------------------------------ANU UPADHYAYA-------------------------------
-------------------------------------LC3 DATAPATH--------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY UPADHYAYA_REG_ARRAY IS
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
END UPADHYAYA_REG_ARRAY;

ARCHITECTURE REG_ARRAY_BEH OF UPADHYAYA_REG_ARRAY IS
TYPE REGARY IS ARRAY(E-1 DOWNTO 0) OF STD_LOGIC_VECTOR(P-1 DOWNTO 0);
SIGNAL SEN : STD_LOGIC_VECTOR(E-1 DOWNTO 0);
SIGNAL SFF: REGARY;
COMPONENT UPADHYAYA_16BIT_REG 
GENERIC(
P: NATURAL := 16);
PORT (
CLK : IN STD_LOGIC;
RST : IN STD_LOGIC;
REG_EN: IN STD_LOGIC;
REG_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
REG: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END COMPONENT;
BEGIN 
P0: PROCESS(DR_REG,REG_EN)
BEGIN
SEN <= (SEN'RANGE=> '0');
SEN(TO_INTEGER(UNSIGNED(DR_REG))) <= REG_EN;
END PROCESS;
G0: FOR J IN 0 TO (E-1) GENERATE
REGH0: UPADHYAYA_16BIT_REG
PORT MAP(CLK,RST,SEN(J),REG_IN, SFF(J));
END GENERATE;
OPQ1 <= SFF(TO_INTEGER(UNSIGNED(SR1)));
OPQ2 <= SFF(TO_INTEGER(UNSIGNED(SR2)));
END REG_ARRAY_BEH;
---------------------------------ADDR1MUX-----------------------------------------
---------------------------------ANU UPADHYAYA------------------------------------
--------------------------------LC3 DATA PATH-------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_ADDR1MUX IS
GENERIC(
P: NATURAL := 16);
PORT (
LD_ADDR1MUX: STD_LOGIC;
OP_A : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_B : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_Q: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_ADDR1MUX;
ARCHITECTURE ADDR1MUX_BEH OF UPADHYAYA_ADDR1MUX IS
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
BEGIN
WITH LD_ADDR1MUX SELECT
Y<= OP_A WHEN '0',
	OP_B WHEN OTHERS;
OP_Q <= Y;
END ADDR1MUX_BEH;


------------SIGEXT4------------------------------------------
------------ANU UPADHYAYA-----------------------------------
------------LC3 DATA PATH-------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_SIGEXT4 IS
GENERIC( P: NATURAL := 16 );
PORT (
OP_A : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_Q: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_SIGEXT4;
ARCHITECTURE SIGEXT4_BEH OF UPADHYAYA_SIGEXT4 IS
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
signal msb: std_logic;
begin
 msb <=  '1'  when (OP_A(4)='1')else
         '0'  WHEN (OP_A(4)='0');
with msb select
y<= "11111111111" & OP_A(4 downto 0) when '1',
    "00000000000" & OP_A(4 downto 0) when others;
OP_Q<= y;
END SIGEXT4_BEH;
------------SR2MUX-------------------------------------
------------ANU UPADHYAYA---------------------------------
------------LC3 DATA PATH---------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_SR2MUX IS
GENERIC( P: NATURAL := 16);
PORT (
LD_SR2_MUX: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
OP_A : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_B : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_Q: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_SR2MUX;
ARCHITECTURE SR2MUX_BEH OF UPADHYAYA_SR2MUX IS
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
BEGIN 
WITH LD_SR2_MUX SELECT
Y<= OP_A WHEN "01",
    OP_B WHEN "10",
    "0000000000000000" WHEN OTHERS;
OP_Q<= Y;
END SR2MUX_BEH;
-----------------------ADDER--------------------------------
-----------------------ANU UPADHYAYA------------------------
-----------------------LC3 DATA PATH------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY UPADHYAYA_ADDER IS
GENERIC(P: NATURAL := 16);
PORT(
OP_A : IN STD_LOGIC_VECTOR( P-1 DOWNTO 0);
OP_B: IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
OP_Q : OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_ADDER;
ARCHITECTURE ADDER_BEH OF UPADHYAYA_ADDER IS
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
BEGIN 
Y <=  OP_A + OP_B;
OP_Q <= Y;
END ADDER_BEH;


------------------------------------ALU-------------------------------------------
------------------------------------ANU UPADHYAYA---------------------------------
------------------------------------LC3 DATAPATH----------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity UPADHYAYA_ALU is
GENERIC(
P: NATURAL := 16);
port(
 OP_A: in std_logic_vector(P-1 downto 0);
 OP_B: in std_logic_vector(P-1 downto 0);
 LD_ALU : in std_logic_vector(1 downto 0);
 OP_Q: out std_logic_vector(P-1 downto 0)); 
end UPADHYAYA_ALU;
architecture ALU_BEH of UPADHYAYA_ALU is
signal y: std_logic_vector(P-1 downto 0);
begin
with LD_ALU select
y<= (OP_A+OP_B) when "00",
    OP_B when "01",
    OP_A AND OP_B WHEN "10",
    NOT OP_B WHEN OTHERS;
OP_Q <= Y;
END ALU_BEH;
------------------------GATE ALU------------------------------------------
------------------------ANU UPADHYAYA---------------------------------
------------------------LC3 DATA PATH-------------------------------------


library ieee;
use ieee.std_logic_1164.all;
entity UPADHYAYA_GATE_ALU is
generic(
 P: natural := 16);
port ( 
--CLK: in std_logic;
GATE_ALU: in std_logic;
GATE_ALU_IN: in std_logic_vector(P-1 downto 0);
GATE_ALU_OUT: out std_logic_vector(P-1 downto 0));
end UPADHYAYA_GATE_ALU;

architecture GATE_ALU_BEH of UPADHYAYA_GATE_ALU is
 signal tempq : std_logic_vector(P-1 downto 0);
begin
--tristate: process(CLK)
--begin 
--if (CLK ='1' and CLK'event) then 
 -- if (GATE_ALU = '1') then 
  --tempq <= GATE_ALU_IN;
  --else 
 -- tempq <= (others=>'Z');
 -- end if;
--ELSE 
--tempq <= TEMPQ;
--end if;
--end process tristate;
WITH GATE_ALU SELECT
tempq <= GATE_ALU_IN WHEN '1',
	(OTHERS => 'Z') WHEN OTHERS ;
GATE_ALU_OUT <= tempq;
end GATE_ALU_BEH;

-----------------MARMUX----------------------------------------
-----------------ANU UPADHYAYA---------------------------------
-----------------LC3 DATA PATH---------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity UPADHYAYA_MARMUX is
GENERIC(
P: NATURAL := 16 );
PORT (
LD_MM : IN STD_LOGIC;
ZEXT_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
ADDER_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
MARMUX_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_MARMUX;
ARCHITECTURE MARMUX_BEH OF UPADHYAYA_MARMUX IS 
SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0 );
BEGIN 
WITH LD_MM SELECT
Y<= ZEXT_IN WHEN '0',
	ADDER_IN WHEN OTHERS;
MARMUX_OUT <= Y;
END MARMUX_BEH;
--------------------GATE MARMUX-----------------------------------
--------------------ANU UPADHYAYA--------------------------------
--------------------LC3 DATA PATH---------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_GATE_MARMUX IS
GENERIC(P: NATURAL := 16);
PORT(
--CLK: IN STD_LOGIC;
GATE_MARMUX: IN STD_LOGIC;
MARMUX_IN : IN STD_LOGIC_VECTOR(P-1 DOWNTO 0);
GATE_MARMUX_OUT: OUT STD_LOGIC_VECTOR(P-1 DOWNTO 0));
END UPADHYAYA_GATE_MARMUX;
ARCHITECTURE GATE_MARMUX_BEH OF UPADHYAYA_GATE_MARMUX IS 

SIGNAL Y: STD_LOGIC_VECTOR(P-1 DOWNTO 0);
BEGIN 
--PROCESS(CLK)
--BEGIN
--IF (CLK='1' AND CLK'EVENT) THEN 
	--IF (GATE_MARMUX='1') THEN
	--Y <= MARMUX_IN ;
	--ELSE
	--Y <= (OTHERS=>'Z');
	--END IF;
--ELSE 
--Y <= Y;
--END IF;

--END PROCESS;
WITH GATE_MARMUX SELECT
Y <= MARMUX_IN WHEN '1',
	(OTHERS => 'Z') WHEN OTHERS ;
GATE_MARMUX_OUT <= Y;
END GATE_MARMUX_BEH;
---------------------------------------------------------------------------------
-------------------------------NZP----------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY UPADHYAYA_NZP IS
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

END UPADHYAYA_NZP;
ARCHITECTURE BEH OF UPADHYAYA_NZP IS 
SIGNAL Y: STD_LOGIC_VECTOR(W-1 DOWNTO 0);
BEGIN 
NZP: PROCESS(CLK)
BEGIN 

IF CLK='1' AND CLK'EVENT THEN
	if LD_CC='1' THEN 
		IF OP_A(15) = '1' THEN
			Y<= "100";
		ELSIF OP_A = "0000000000000000" THEN 
			Y<= "010";
		ELSE 
			Y<= "001";
		END IF;
	ELSE 
		Y<= Y;
	END IF ;
ELSE 
Y <= Y;
END IF ;
END PROCESS;
NZP_OUT <= Y;
END BEH;
-----------------------------------------------------------------------------------------------------------

		


