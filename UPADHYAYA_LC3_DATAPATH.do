onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /upadhyaya_datapath_all_tb/CLKtb
add wave -noupdate /upadhyaya_datapath_all_tb/RSTtb
add wave -noupdate -divider INPUT_SIGNALS
add wave -noupdate /upadhyaya_datapath_all_tb/datap/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/RST
add wave -noupdate -divider TOP_LEVEL_SIGNALS/INTERMEDIATE_SIGNALS
add wave -noupdate /upadhyaya_datapath_all_tb/datap/PC_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_PC_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_PC_MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/GATE_PC_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_BUS
add wave -noupdate /upadhyaya_datapath_all_tb/datap/LD_PCMUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_PCMUX_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/MAR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_MAR_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/MEM_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/RD_WR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_MEM_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/MDR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_MDR_BUS
add wave -noupdate /upadhyaya_datapath_all_tb/datap/MDR_GATE_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/IR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_IR_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_SIGEXT1
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_SIGEXT2
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_SIGEXT3
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_SIGEXT4
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_ZEXT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/LD_ADDR2MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/LD_ADDR1MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_ADDR2MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_ADDR1MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_ADDER
add wave -noupdate /upadhyaya_datapath_all_tb/datap/LD_MM
add wave -noupdate /upadhyaya_datapath_all_tb/datap/GATE_MARMUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_MARMUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/DR_REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/SR1
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_REGOUT1
add wave -noupdate /upadhyaya_datapath_all_tb/datap/SR2
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_REGOUT2
add wave -noupdate /upadhyaya_datapath_all_tb/datap/LD_SR2MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_SR2MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/LD_ALU
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_ALU
add wave -noupdate /upadhyaya_datapath_all_tb/datap/GATE_ALU
add wave -noupdate /upadhyaya_datapath_all_tb/datap/LD_CC
add wave -noupdate /upadhyaya_datapath_all_tb/datap/S_NZP_OUT
add wave -noupdate -divider PC_INSTANTIATION
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST0_PC/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST0_PC/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST0_PC/PC_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST0_PC/BUS_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST0_PC/PC_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST0_PC/PC_MARMUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST0_PC/TEMPQ1
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST0_PC/TEMPQ2
add wave -noupdate -divider PC_GATE
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST2_PC_GATE/PC_GATE_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST2_PC_GATE/PC_GATE_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST2_PC_GATE/PC_GATE_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST2_PC_GATE/TEMPQ
add wave -noupdate -divider PC_MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST1_PC_MUX/LD_PCMUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST1_PC_MUX/OP_A
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST1_PC_MUX/OP_B
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST1_PC_MUX/OP_C
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST1_PC_MUX/PC_MUX_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST1_PC_MUX/Y
add wave -noupdate -divider FSM
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/IR_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/NZP_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/PC_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/GATE_PC_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/LD_PCMUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/MAR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/MEM_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/RD_WR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/MDR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/MDR_GATE_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/IR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/LD_ADDR2MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/LD_ADDR1MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/LD_MM
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/GATE_MARMUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/DR_REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/SR1
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/SR2
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/LD_SR2MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/LD_ALU
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/LD_CC
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/GATE_ALU
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/CPU_STATE
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST70_FSM/NEXT_STATE
add wave -noupdate -divider MAR
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST3_MAR/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST3_MAR/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST3_MAR/MAR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST3_MAR/BUS_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST3_MAR/MAR_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST3_MAR/TEMPQ
add wave -noupdate -divider RAM
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST4_RAM/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST4_RAM/MDR_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST4_RAM/MEM_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST4_RAM/RD_WR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST4_RAM/MEM_ADD
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST4_RAM/MEM_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST4_RAM/s_data
add wave -noupdate -divider MDR
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST5_MDR/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST5_MDR/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST5_MDR/MDR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST5_MDR/MEM_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST5_MDR/BUS_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST5_MDR/MDR_BUS
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST5_MDR/TEMPQ
add wave -noupdate -divider GATE_MDR
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST6_GATE_MDR/MDR_GATE_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST6_GATE_MDR/MDR_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST6_GATE_MDR/GATE_MDR_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST6_GATE_MDR/tempq
add wave -noupdate -divider IR
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST7_IR/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST7_IR/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST7_IR/IR_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST7_IR/IR_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST7_IR/IR_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST7_IR/Y
add wave -noupdate -divider {SIGEXTENDERS[10:0]}
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST8_SIGEXT1/IR_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST8_SIGEXT1/SIGEXT1
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST8_SIGEXT1/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST8_SIGEXT1/msb
add wave -noupdate -divider {SIGEXT[8:0]}
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST9_SIGEXT2/IR_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST9_SIGEXT2/SIGEXT2
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST9_SIGEXT2/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST9_SIGEXT2/msb
add wave -noupdate -divider {SIGEXT[5:0]}
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST10_SIGEXT3/IR_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST10_SIGEXT3/SIGEXT3
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST10_SIGEXT3/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST10_SIGEXT3/msb
add wave -noupdate -divider ADDR2MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST11_ADDR2MUX/LD_ADDR2MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST11_ADDR2MUX/OP_A1
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST11_ADDR2MUX/OP_A2
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST11_ADDR2MUX/OP_A3
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST11_ADDR2MUX/OP_Q
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST11_ADDR2MUX/Y
add wave -noupdate -divider ADDR1MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST14_ADDR1MUX/LD_ADDR1MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST14_ADDR1MUX/OP_A
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST14_ADDR1MUX/OP_B
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST14_ADDR1MUX/OP_Q
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST14_ADDR1MUX/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST15_ADDER/OP_A
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST15_ADDER/OP_B
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST15_ADDER/OP_Q
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST15_ADDER/Y
add wave -noupdate -divider MARMUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST17_MARMUX/LD_MM
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST17_MARMUX/ZEXT_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST17_MARMUX/ADDER_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST17_MARMUX/MARMUX_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST17_MARMUX/Y
add wave -noupdate -divider GATE_MARMUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST18_GATE_MARMUX/GATE_MARMUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST18_GATE_MARMUX/MARMUX_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST18_GATE_MARMUX/GATE_MARMUX_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST18_GATE_MARMUX/Y
add wave -noupdate -divider REG_ARRAY
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/REG_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/DR_REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/SR1
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/SR2
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/OPQ1
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/OPQ2
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/SEN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/SFF
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(0)/REGH0/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(0)/REGH0/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(0)/REGH0/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(0)/REGH0/REG_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(0)/REGH0/REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(0)/REGH0/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(1)/REGH0/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(1)/REGH0/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(1)/REGH0/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(1)/REGH0/REG_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(1)/REGH0/REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(1)/REGH0/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(2)/REGH0/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(2)/REGH0/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(2)/REGH0/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(2)/REGH0/REG_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(2)/REGH0/REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(2)/REGH0/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(3)/REGH0/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(3)/REGH0/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(3)/REGH0/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(3)/REGH0/REG_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(3)/REGH0/REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(3)/REGH0/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(4)/REGH0/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(4)/REGH0/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(4)/REGH0/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(4)/REGH0/REG_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(4)/REGH0/REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(4)/REGH0/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(5)/REGH0/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(5)/REGH0/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(5)/REGH0/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(5)/REGH0/REG_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(5)/REGH0/REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(5)/REGH0/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(6)/REGH0/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(6)/REGH0/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(6)/REGH0/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(6)/REGH0/REG_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(6)/REGH0/REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(6)/REGH0/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(7)/REGH0/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(7)/REGH0/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(7)/REGH0/REG_EN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(7)/REGH0/REG_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(7)/REGH0/REG
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST12_REG_ARRAY/G0(7)/REGH0/Y
add wave -noupdate -divider {SIGNEXTENDER [4:0]}
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST19_SIGEXT4/OP_A
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST19_SIGEXT4/OP_Q
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST19_SIGEXT4/Y
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST19_SIGEXT4/msb
add wave -noupdate -divider SR2MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST20_SR2MUX/LD_SR2_MUX
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST20_SR2MUX/OP_A
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST20_SR2MUX/OP_B
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST20_SR2MUX/OP_Q
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST20_SR2MUX/Y
add wave -noupdate -divider ALU
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST13_ALU/OP_A
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST13_ALU/OP_B
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST13_ALU/LD_ALU
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST13_ALU/OP_Q
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST13_ALU/y
add wave -noupdate -divider ZEXT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST16_ZEXT/OP_A
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST16_ZEXT/OP_Q
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST16_ZEXT/Y
add wave -noupdate -divider GATE_ALU
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST21_GATEALU/GATE_ALU
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST21_GATEALU/GATE_ALU_IN
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST21_GATEALU/GATE_ALU_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST21_GATEALU/tempq
add wave -noupdate -divider NZP
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST22_NZP/CLK
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST22_NZP/RST
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST22_NZP/LD_CC
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST22_NZP/OP_A
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST22_NZP/NZP_OUT
add wave -noupdate /upadhyaya_datapath_all_tb/datap/INST22_NZP/Y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99715 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 372
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {111621 ps}
