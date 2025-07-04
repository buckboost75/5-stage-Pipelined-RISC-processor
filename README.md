# 5-stage-Pipelined-RISC-processor

Design  a  5-stage pipeline  RISC  processor(with  hazard detection and data forwarding unit as necessary) that can execute the following instructions: 

0000 SW reg1, 3(reg2) 
0004 ADD reg3, reg1, reg4 
0008 OR reg6, reg3, reg5 
0012 SUBI reg8, reg3, 2400 
0016 NAND reg9, reg7, reg8 

Initialize the register file with the following data 
reg1 = AABB         reg2 = 5 
reg4 = 01034          reg5 = BACC1 
reg7 = 101ED
<img width="418" alt="image" src="https://github.com/user-attachments/assets/a40ed78b-7b2d-4401-822f-d6316d1756ae" />


Opcode for each instruction: 
Instruction 1: 0000 
Instruction 2: 0001 
Instruction 3: 0011 
Instruction 4: 0111 
Instruction 5: 1111
