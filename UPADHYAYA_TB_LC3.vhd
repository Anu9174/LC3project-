
------------------------------------------------------------
--File Name:		LC3_data_path_all_tb_amoo.vhd
--VHDL Source File:	A very simple test bench
-- 				Or, you can use the standard TB!
--Components: 		see lc3_parts_all_amoo.vhd
-- 			     requires lc3_datapath_all_amoo
--Comments: 		behavioral testbench description
--Dr. M. E. Amoo
--ADvanced Digital Design
--Fall 2020
-----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity UPADHYAYA_DATAPATH_ALL_TB is
end UPADHYAYA_DATAPATH_ALL_TB;


architecture TB1 of UPADHYAYA_DATAPATH_ALL_TB is

component UPADHYAYA_DATAPATH_ALL is
port (
	CLK: in std_logic;  
	RST: in std_logic
     );
end component UPADHYAYA_DATAPATH_ALL;

signal	CLKtb		: std_logic; 				
signal	RSTtb		: std_logic;				

begin

CLK_GEN: process 
begin 
while now <= 300 us loop 
CLKtb <='1'; wait for 5 ns; CLKtb <='0'; wait for 5 ns; 
end loop; 
wait; 
end process; 

Reset: process
begin
RSTtb  <='1','0' after 10 ns;
wait;
end process;


--------------------------------------do not change-----------------------------------------------
datap: UPADHYAYA_DATAPATH_ALL port map ( CLK=>CLKtb, RST=>RSTtb);

end TB1;
--------------------------------------change the names to match your TB/Component-----
configuration CFG_DATAPATH_ALL_TB of UPADHYAYA_DATAPATH_ALL_TB is
	for TB1
	end for;
end CFG_DATAPATH_ALL_TB;