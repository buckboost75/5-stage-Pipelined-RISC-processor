`timescale 1ns / 1ns

module top(input clk, reset);

    wire [31:0] pc_curr, pc_next_val, instr_fetch;
    wire PCWrite, IFIDWrite, ST;

    wire EnIM;
    wire ALUSrc, MR, MW, MReg, EnRW;
    wire [1:0] ALUOp;

    wire [31:0] reg_data1, reg_data2, imm_ext_out;
    wire [31:0] pc_id_stage, instr_id_stage;
    wire [3:0] opcode, dest_reg, src_reg1, src_reg2;
    wire [15:0] imm_val;

    wire [31:0] pc_ex_stage, reg_data1_ex, reg_data2_ex, imm_val_ex;
    wire [3:0] src_reg1_ex, src_reg2_ex, dest_reg_ex;
    wire [1:0] ALUOp_ex;
    wire ALUSrc_ex, MR_ex, MW_ex, MReg_ex, EnRW_ex;

    wire [1:0] FA, FB;
    wire [31:0] alu_input1, alu_input2, alu_out_result;

    wire [31:0] alu_out_mem_stage, reg_data2_mem;
    wire [3:0] dest_reg_mem;
    wire MR_mem, MW_mem, MReg_mem, EnRW_mem;

    wire [31:0] data_mem_out;
    wire [31:0] write_back_data;
    wire [3:0] dest_reg_wb;
    wire EnRW_wb;

    pc pc_inst(clk, reset, PCWrite, pc_next_val, pc_curr);
    ist_mem imem(clk, EnIM, pc_curr, instr_fetch);

    IF_ID ifid(clk, reset, IFIDWrite, instr_fetch, pc_curr, instr_id_stage, pc_id_stage);

    assign opcode   = instr_id_stage[31:28];
    assign dest_reg = instr_id_stage[27:24];
    assign src_reg1 = instr_id_stage[23:20];
    assign src_reg2 = instr_id_stage[19:16];
    assign imm_val  = instr_id_stage[15:0];

    control_unit cu(opcode, ST, ALUSrc, ALUOp, MR, MW, MReg, EnIM, EnRW);
    reg_file rf(clk, EnRW_wb, src_reg1, src_reg2, dest_reg_wb, write_back_data, reg_data1, reg_data2);
    sign_extend se(imm_val, imm_ext_out);

    hazard_unit hazard(src_reg1, src_reg2, dest_reg_ex, MR_ex, PCWrite, IFIDWrite, ST);

    ID_EX idex(clk, reset, pc_id_stage, reg_data1, reg_data2, imm_ext_out,
               src_reg1, src_reg2, dest_reg, ALUOp, ALUSrc, MR, MW, MReg, EnRW,
               pc_ex_stage, reg_data1_ex, reg_data2_ex, imm_val_ex,
               src_reg1_ex, src_reg2_ex, dest_reg_ex,
               ALUOp_ex, ALUSrc_ex, MR_ex, MW_ex, MReg_ex, EnRW_ex);

    forward_unit fwd(src_reg1_ex, src_reg2_ex, dest_reg_mem, dest_reg_wb, EnRW_mem, EnRW_wb, FA, FB);

    assign alu_input1 = (FA == 2'b00) ? reg_data1_ex :
                        (FA == 2'b10) ? alu_out_mem_stage : write_back_data;

    wire [31:0] alu_operand2 = (ALUSrc_ex) ? imm_val_ex : reg_data2_ex;
    assign alu_input2 = (FB == 2'b00) ? alu_operand2 :
                        (FB == 2'b10) ? alu_out_mem_stage : write_back_data;

    ALU alu(alu_input1, alu_input2, ALUOp_ex, alu_out_result);

    EX_MEM exmem(clk, reset, alu_out_result, reg_data2_ex, dest_reg_ex,
                 MR_ex, MW_ex, MReg_ex, EnRW_ex,
                 alu_out_mem_stage, reg_data2_mem, dest_reg_mem,
                 MR_mem, MW_mem, MReg_mem, EnRW_mem);

    data_mem dmem(clk, MR_mem, MW_mem, alu_out_mem_stage, reg_data2_mem, data_mem_out);

    MEM_WB memwb(clk, reset, alu_out_mem_stage, data_mem_out, dest_reg_mem, MReg_mem, EnRW_mem,
                 write_back_data, dest_reg_wb, EnRW_wb);

    assign pc_next_val = pc_curr + 4;

endmodule
